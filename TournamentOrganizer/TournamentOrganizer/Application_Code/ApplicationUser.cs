using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using TournamentOrganizer.Model;
using TournamentOrganizer.Models;
using TournamentOrganizer.BL;

namespace TournamentOrganizer.Application_Code
{
    public class ApplicationUser : IdentityUsers
    {
        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(ApplicationUserManager userManager)
        {

            var userIdentity = await userManager.CreateIdentityAsync(this, DefaultAuthenticationTypes.ExternalBearer);
            // Add custom user claims here
            return userIdentity;
        }
    }
}