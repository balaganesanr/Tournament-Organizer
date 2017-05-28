using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using System.Web;
using System.Security.Principal;

namespace TournamentOrganizer.Application_Code
{
    public class IdentityHelper
    {
        public string LOGGEDIN_ROLE = "RoleId";
        public string LOGGEDIN_USERNAME = "Username";
        private ApplicationUserManager _userManager;

        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.Current.GetOwinContext().Authentication;
            }
        }
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
        public IIdentity UserIdentity
        {
            get { return HttpContext.Current.User.Identity; }
        }
        public Guid UserId
        {
            get
            {
                return !string.IsNullOrWhiteSpace(UserIdentity.GetUserId()) ? new Guid(UserIdentity.GetUserId()) : Guid.Empty;
            }
        }

        public Type GetClaimValue<Type>(ClaimsIdentity claimsIdentity, string key)
        {
            if (claimsIdentity == null)
                return (Type)Convert.ChangeType(default(Type), typeof(Type));

            string value = GetClaimValue(claimsIdentity.Claims, key);
            if (string.IsNullOrWhiteSpace(value))
                return (Type)Convert.ChangeType(default(Type), typeof(Type));

            return (Type)Convert.ChangeType(value, typeof(Type));
        }

        public string GetClaimValue(IEnumerable<Claim> claims, string key)
        {
            var claim = claims.Where(r => r.Type == key).FirstOrDefault();

            if (claim != null)
                return claim.Value;
            return string.Empty;
        }
    }
}