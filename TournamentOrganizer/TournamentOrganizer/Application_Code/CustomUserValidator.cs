using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace TournamentOrganizer.Application_Code
{
    public class CustomUserValidator<TUser> : UserValidator<TUser, Guid> where TUser : ApplicationUser
    {
        private UserManager<TUser, Guid> _manager { get; set; }

        /// <summary>
        ///     Constructor
        /// </summary>
        /// <param name="manager"></param>
        public CustomUserValidator(UserManager<TUser, Guid> manager)
            : base(manager)
        {
            this._manager = manager;
        }

        /// <summary>
        ///     Validates a user before saving
        /// </summary>
        /// <param name="item"></param>
        /// <returns></returns>
        public override async Task<IdentityResult> ValidateAsync(TUser item)
        {
            var user = await Task.Run(() => _manager.FindByName(item.UserName));
            //var user= _manager.FindByName(item.UserName);

            var errors = new List<string>();

            if (item == null)
            {
                throw new ArgumentNullException("item");
            }

            if (user != null)
                errors.Add("Invalid user");

            if (errors.Count > 0)
            {
                return IdentityResult.Failed(errors.ToArray());
            }
            return IdentityResult.Success;
        }
    }
}