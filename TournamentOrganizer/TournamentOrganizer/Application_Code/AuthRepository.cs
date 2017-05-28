using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OAuth;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using TournamentOrganizer.Model;
using Microsoft.AspNet.Identity.Owin;
using TournamentOrganizer.BL;

namespace TournamentOrganizer.Application_Code
{
    public class AuthRepository : IDisposable
    {
        private ApplicationUserManager _userManager;

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.Current.GetOwinContext().Authentication;
            }
        }

        public async Task<ApplicationUser> FindUser(string userName, string password)
        {
            ApplicationUser user = await _userManager.FindAsync(userName, password);

            return user;
        }

        public async Task<ApplicationUser> FindUser(string userName)
        {
            ApplicationUser user = null;
            if (UserManager != null)
                user = await UserManager.FindByNameAsync(userName);

            return user;
        }

        public PasswordVerificationResult VerifyPassword(string userPassword, string inputPassword)
        {
            return UserManager.PasswordHasher.VerifyHashedPassword(userPassword, inputPassword);
        }

        public ClaimsIdentity CreateClaimsIdentity(ApplicationUser user)
        {
            return UserManager.CreateIdentity(user, OAuthDefaults.AuthenticationType);
        }
        public Client FindClient(string clientId)
        {
            return BLUser<IdentityUsers>.FindClient(clientId); ;
        }

        public async Task<bool> AddRefreshToken(RefreshToken token)
        {
            bool isAdded = BLUser<IdentityUsers>.AddRefreshToken(token);
            return await Task.FromResult<bool>(isAdded);
            //return await Task.FromResult<bool>(true);
        }

        public async Task<bool> RemoveRefreshToken(string refreshTokenId)
        {
            bool isdeleted = BLUser<IdentityUsers>.DeleteRefreshToken(refreshTokenId);
            return await Task.FromResult<bool>(isdeleted);
            //return await Task.FromResult<bool>(true);
        }

        public async Task<RefreshToken> FindRefreshToken(string refreshTokenId)
        {
            var refreshToken = BLUser<IdentityUsers>.FindRefreshToken(refreshTokenId);
            return await Task.FromResult<RefreshToken>(refreshToken);
            //return await Task.FromResult<RefreshToken>(null);
        }
       
        public async Task SignInAsync(ApplicationUser user, bool isPersistent)
        {
            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ExternalCookie);
            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ExternalBearer);
            AuthenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = isPersistent }, await user.GenerateUserIdentityAsync(UserManager));
        }

        public void Signout()
        {
            AuthenticationManager.SignOut();
            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ExternalBearer);
        }

        public void Dispose()
        {
            if (_userManager != null)
            {
                _userManager.Dispose();
            }
        }
    }
}