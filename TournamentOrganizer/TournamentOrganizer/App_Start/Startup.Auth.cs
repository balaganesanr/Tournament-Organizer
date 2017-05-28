using System;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using Microsoft.Owin.Security.Cookies;

using Owin;
using Microsoft.Owin.Security.OAuth;
using TournamentOrganizer.Application_Code;
using TournamentOrganizer.Providers;

namespace TournamentOrganizer.App_Start
{
    public partial class Startup
    {
        public static OAuthBearerAuthenticationOptions OAuthBearerOptions { get; private set; }
        public static OAuthAuthorizationServerOptions OAuthServerOptions { get; private set; }

        public void ConfigureAuth(IAppBuilder app)
        {

            // Configure the ApplicationUserManager and ApplicationSignInManager to use a single instance per request
            app.CreatePerOwinContext<ApplicationUserManager>(ApplicationUserManager.Create);
            //app.CreatePerOwinContext<ApplicationSignInManager>(ApplicationSignInManager.Create);

            app.UseExternalSignInCookie(DefaultAuthenticationTypes.ExternalCookie);

            OAuthBearerOptions = new OAuthBearerAuthenticationOptions();

            /*
             * Safari browser doesnot allow the file download using blob.
             * So to authenticate the user, the token has been sent through the query string
             * and then it has been added to header to authenticate the user.
             */
            app.Use(async (context, next) =>
            {
                if (context.Request.QueryString.HasValue)
                {
                    if (string.IsNullOrWhiteSpace(context.Request.Headers.Get("Authorization")))
                    {
                        var queryString = HttpUtility.ParseQueryString(context.Request.QueryString.Value);
                        /*
                         * to stands for tournament organiser
                         * at stands for access token
                         * this key will be used to identify the token from the query parameter.
                         */
                        string token = queryString.Get("to_at");

                        if (!string.IsNullOrWhiteSpace(token))
                            context.Request.Headers.Add("Authorization", new[] { string.Format("Bearer {0}", token) });
                    }
                }

                await next.Invoke();
            });

            int tokenExpires;
            string timeout = System.Configuration.ConfigurationManager.AppSettings["tokenExpires"];
            if (string.IsNullOrWhiteSpace(timeout) || !Int32.TryParse(timeout, out tokenExpires))
                tokenExpires = 30;

            OAuthServerOptions = new OAuthAuthorizationServerOptions()
            {

                AllowInsecureHttp = true,
                TokenEndpointPath = new PathString("/token"),
                AccessTokenExpireTimeSpan = TimeSpan.FromMinutes(tokenExpires),
                Provider = new SimpleAuthorizationServerProvider(),
                RefreshTokenProvider = new SimpleRefreshTokenProvider(),

            };

            // Token Generation
            app.UseOAuthAuthorizationServer(OAuthServerOptions);
            app.UseOAuthBearerAuthentication(OAuthBearerOptions);
        }
    }
}