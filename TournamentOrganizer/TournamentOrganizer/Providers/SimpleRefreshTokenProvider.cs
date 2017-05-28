using Microsoft.Owin.Security.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using TournamentAspnetIdentity;
using TournamentOrganizer.Application_Code;
using TournamentOrganizer.Model;

namespace TournamentOrganizer.Providers
{
    public class SimpleRefreshTokenProvider : IAuthenticationTokenProvider
    {

        public async Task CreateAsync(AuthenticationTokenCreateContext context)
        {
            IdentityHelper identity = new IdentityHelper();
            var clientid = context.Ticket.Properties.Dictionary["as:client_id"];

            if (string.IsNullOrEmpty(clientid))
                return;
            IdentityCustomPasswordHasher hasher = new IdentityCustomPasswordHasher();
            var refreshTokenId = hasher.HashPassword(Guid.NewGuid().ToString());

           string username = identity.GetClaimValue<string>(context.Ticket.Identity as ClaimsIdentity, identity.LOGGEDIN_USERNAME); ;
            //long groupId = IdentityHelper.GetClaimValue<long>(context.Ticket.Identity as ClaimsIdentity, IdentityHelper.GROUP_ID);

            //Guid _userId = Guid.Empty;
            //if (!string.IsNullOrWhiteSpace(userId))
            //    _userId = Guid.Parse(userId);

            using (AuthRepository _repo = new AuthRepository())
            {
                var refreshTokenLifeTime = context.OwinContext.Get<string>("as:clientRefreshTokenLifeTime");
                var token = new RefreshToken()
                {
                    Id = refreshTokenId,
                    ClientId = clientid,
                    IssuedUtc = DateTime.UtcNow,
                    ExpiresUtc = DateTime.UtcNow.AddMinutes(Convert.ToDouble(refreshTokenLifeTime)),
                    Username= username
                };

                context.Ticket.Properties.IssuedUtc = token.IssuedUtc;
                context.Ticket.Properties.ExpiresUtc = token.ExpiresUtc;
                token.ProtectedTicket = context.SerializeTicket();

                var result = await _repo.AddRefreshToken(token);
                
                if (result)
                    context.SetToken(refreshTokenId);
            }
        }

        public async Task ReceiveAsync(AuthenticationTokenReceiveContext context)
        {

            var allowedOrigin = context.OwinContext.Get<string>("as:clientAllowedOrigin");
            context.OwinContext.Response.Headers.Add("Access-Control-Allow-Origin", new[] { allowedOrigin });

            string hashedTokenId = context.Token;
            //string hashedTokenId = string.Empty;
            using (AuthRepository _repo = new AuthRepository())
            {
                var refreshToken = await _repo.FindRefreshToken(hashedTokenId);

                if (refreshToken != null)
                {
                    //Get protectedTicket from refreshToken class
                    context.DeserializeTicket(refreshToken.ProtectedTicket);
                    var result = await _repo.RemoveRefreshToken(hashedTokenId);
                }
            }
        }

        public void Create(AuthenticationTokenCreateContext context)
        {
            throw new NotImplementedException();
        }

        public void Receive(AuthenticationTokenReceiveContext context)
        {
            throw new NotImplementedException();
        }
    }
}