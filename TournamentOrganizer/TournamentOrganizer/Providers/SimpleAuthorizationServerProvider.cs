using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OAuth;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
using TournamentOrganizer.Model;
using TournamentOrganizer.Application_Code;
using TournamentOrganizer.BL;
using TournamentAspnetIdentity;

namespace TournamentOrganizer.Providers
{
    public class SimpleAuthorizationServerProvider : OAuthAuthorizationServerProvider
    {
        public Microsoft.Owin.IReadableStringCollection Parameters { get; set; }
        public override Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            string clientId = string.Empty;
            string clientSecret = string.Empty;
            Client client = null;

            IdentityCustomPasswordHasher hasher = new IdentityCustomPasswordHasher();
            string key = hasher.HashPassword("G!slenTo17");
            if (!context.TryGetBasicCredentials(out clientId, out clientSecret))
                context.TryGetFormCredentials(out clientId, out clientSecret);

            Parameters = context.Parameters;
            if (context.ClientId == null)
            {
                //Remove the comments from the below line context.SetError, and invalidate context 
                //if you want to force sending clientId/secrects once obtain access tokens. 
                context.Validated();
                //context.SetError("invalid_clientId", "ClientId should be sent.");
                return Task.FromResult<object>(null);
            }

            using (AuthRepository _repo = new AuthRepository())
                client = _repo.FindClient(context.ClientId);

            if (client == null)
            {
                context.SetError("invalid_clientId", string.Format("Client '{0}' is not registered in the system.", context.ClientId));
                return Task.FromResult<object>(null);
            }

            if (!client.Active)
            {
                context.SetError("invalid_clientId", "Client is inactive.");
                return Task.FromResult<object>(null);
            }

            context.OwinContext.Set<string>("as:clientAllowedOrigin", client.AllowedOrigin);
            context.OwinContext.Set<string>("as:clientRefreshTokenLifeTime", client.RefreshTokenLifeTime.ToString());

            context.Validated();
            return Task.FromResult<object>(null);
        }

        public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {

            try
            {
                var allowedOrigin = context.OwinContext.Get<string>("as:clientAllowedOrigin");
                if (allowedOrigin == null) allowedOrigin = "*";

                context.OwinContext.Response.Headers.Add("Access-Control-Allow-Origin", new[] { allowedOrigin });
                ClaimsIdentity identity = null;
                ApplicationUser user = null;
                using (AuthRepository _repo = new AuthRepository())
                {
                    user = await _repo.FindUser(context.UserName);

                    if (user == null)
                        throw new Exception("Invalid user");

                    PasswordVerificationResult result = _repo.VerifyPassword(user.Password, context.Password);

                    if (result == PasswordVerificationResult.Failed)
                        throw new Exception("Invalid user email or password");

                    if (user.StatusId == (int)TypesOfUserState.Deactive)
                        throw new Exception("User is deactivated");

                    if (user.StatusId == (int)TypesOfUserState.Inactive)
                        throw new Exception("User is inactive");

                    if (user.StatusId == (int)TypesOfUserState.Rejected)
                        throw new Exception("User is rejected");

                    await _repo.SignInAsync(user, false);
                    identity = _repo.CreateClaimsIdentity(user);
                }

                IdentityHelper helper = new IdentityHelper();

                identity.AddClaim(new Claim(ClaimTypes.Name, context.UserName));
                identity.AddClaim(new Claim(helper.LOGGEDIN_USERNAME, context.UserName));
                identity.AddClaim(new Claim(helper.LOGGEDIN_ROLE, user.RoleId.ToString()));

                Dictionary<string, string> dictionary = new Dictionary<string, string>();
                dictionary.Add("as:client_id", (context.ClientId == null) ? string.Empty : context.ClientId);
                dictionary.Add(helper.LOGGEDIN_USERNAME, context.UserName);
                dictionary.Add(helper.LOGGEDIN_ROLE, user.RoleId.ToString());

                JavaScriptSerializer serialize = new JavaScriptSerializer();
                var props = new AuthenticationProperties(new Dictionary<string, string>(dictionary));

                var ticket = new AuthenticationTicket(identity, props);
                context.Validated(ticket);
            }
            catch (Exception ex)
            {
                context.SetError("Exception", ex.Message);
            }
        }

        public override Task GrantRefreshToken(OAuthGrantRefreshTokenContext context)
        {
            try
            {
                var originalClient = context.Ticket.Properties.Dictionary["as:client_id"];
                var currentClient = context.ClientId;

                if (originalClient != currentClient)
                {
                    context.SetError("invalid_clientId", "Refresh token is issued to a different clientId.");
                    return Task.FromResult<object>(null);
                }

                // Change auth ticket for refresh token requests
                var newIdentity = new ClaimsIdentity(context.Ticket.Identity);
                var newTicket = new AuthenticationTicket(newIdentity, context.Ticket.Properties);
                context.Validated(newTicket);
            }
            catch (Exception ex)
            {
                context.SetError("Exception", ex.Message);
            }

            return Task.FromResult<object>(null);
        }

        public override Task TokenEndpoint(OAuthTokenEndpointContext context)
        {
            foreach (KeyValuePair<string, string> property in context.Properties.Dictionary)
                context.AdditionalResponseParameters.Add(property.Key, property.Value);

            return Task.FromResult<object>(null);
        }

        public string GetParameter(string key)
        {
            if (Parameters != null)
            {
                var paramValues = Parameters.ToArray();
                for (int i = 0; i < paramValues.Length; i++)
                {
                    if (paramValues[i].Key.ToLower() == key.ToLower())
                        return paramValues[i].Value[0];
                }
            }

            return string.Empty;
        }

        public string GetPropertyValue(IDictionary<string, string> properties, string key)
        {
            if (properties != null)
            {
                var _properties = properties.ToArray();
                for (int i = 0; i < _properties.Length; i++)
                {
                    if (_properties[i].Key.ToLower() == key.ToLower())
                        return _properties[i].Value;
                }
            }

            return string.Empty;
        }

    }
}