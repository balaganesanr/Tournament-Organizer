using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Claims;
using TournamentOrganizer.BL;
using TournamentOrganizer.Model;

namespace TournamentAspnetIdentity
{
    public class UserStore<TUser> : IUserStore<TUser, Guid>, IUserPasswordStore<TUser, Guid>,
                                   IUserSecurityStampStore<TUser, Guid>,
                                   IUserEmailStore<TUser, Guid>
                                   , IUserRoleStore<TUser, Guid>

                                   where TUser : IdentityUsers
    {
        //public Database Database { get; private set; }

        public UserStore()
        {
            //DatabaseProviderFactory factory = new DatabaseProviderFactory();
            //new UserStore<TUser>(factory.CreateDefault());
        }

        //public UserStore(Database database)
        //{
        //    Database = database;
        //}

        public Task CreateAsync(TUser user)
        {
            throw new NotImplementedException("Remove from role async");
            //BLUser.CreateAccount(user);
            //return Task.FromResult<object>(BLUser<User>.CreateUser(user));
        }

        public Task DeleteAsync(TUser user)
        {
            throw new NotImplementedException();
        }

        public Task<TUser> FindByIdAsync(Guid userId)
        {
            TUser user = BLUser<TUser>.GetIdentityUser(userId) as TUser;
            if (user != null)
            {
                return Task.FromResult(user);
            }

            return Task.FromResult<TUser>(null);
        }

        public Task<TUser> FindByNameAsync(string userName)
        {
            TUser user = BLUser<TUser>.GetIdentityUser(userName) as TUser;
            if (user != null)
            {
                return Task.FromResult(user);
            }

            return Task.FromResult<TUser>(null);
        }

        public Task UpdateAsync(TUser user)
        {
            throw new NotImplementedException();
        }

        // Summary:
        //     Get the user password hash
        //
        // Parameters:
        //   user:
        public Task<string> GetPasswordHashAsync(TUser user)
        {
            // Need to call BL to get decrypted password
            return Task.FromResult<string>(null);
        }

        //
        // Summary:
        //     Returns true if a user has a password set
        //
        // Parameters:
        //   user:
        public Task<bool> HasPasswordAsync(TUser user)
        {
            throw new NotImplementedException();
        }

        //
        // Summary:
        //     Set the user password hash
        //
        // Parameters:
        //   user:
        //
        //   passwordHash:
        public Task SetPasswordHashAsync(TUser user, string passwordHash)
        {
            user.Password = passwordHash;
            return Task.FromResult<object>(user);
        }

        // Summary:
        //     Get the user security stamp
        //
        // Parameters:
        //   user:
        public Task<string> GetSecurityStampAsync(TUser user)
        {
            //throw new NotImplementedException("Remove from role async");
            return Task.FromResult(user.SecurityStamp);
        }
        //
        // Summary:
        //     Set the security stamp for the user
        //
        // Parameters:
        //   user:
        //
        //   stamp:
        public Task SetSecurityStampAsync(TUser user, string stamp)
        {
            user.SecurityStamp = stamp;
            return Task.FromResult<object>(user);
        }

        // Summary:
        //     Returns the user associated with this email
        //
        // Parameters:
        //   email:
        public Task<TUser> FindByEmailAsync(string email)
        {
            TUser user = BLUser<TUser>.GetUser(email) as TUser;
            if (user != null)
            {
                return Task.FromResult<TUser>(user);
            }

            return Task.FromResult<TUser>(null);
        }

        //
        // Summary:
        //     Get the user email
        //
        // Parameters:
        //   user:
        public Task<string> GetEmailAsync(TUser user)
        {
            throw new NotImplementedException();
        }

        //
        // Summary:
        //     Returns true if the user email is confirmed
        //
        // Parameters:
        //   user:
        public Task<bool> GetEmailConfirmedAsync(TUser user)
        {
            throw new NotImplementedException();
        }

        //
        // Summary:
        //     Set the user email
        //
        // Parameters:
        //   user:
        //
        //   email:
        public Task SetEmailAsync(TUser user, string email)
        {
            throw new NotImplementedException();
        }

        //
        // Summary:
        //     Sets whether the user email is confirmed
        //
        // Parameters:
        //   user:
        //
        //   confirmed:
        public Task SetEmailConfirmedAsync(TUser user, bool confirmed)
        {
            throw new NotImplementedException();
        }

        // Summary:
        //     Adds a user to a role
        //
        // Parameters:
        //   user:
        //
        //   roleName:
        public Task AddToRoleAsync(TUser user, string roleName)
        {
            throw new NotImplementedException("Add to role async");
        }
        //
        // Summary:
        //     Returns the roles for this user
        //
        // Parameters:
        //   user:
        public Task<System.Collections.Generic.IList<string>> GetRolesAsync(TUser user)
        {
            //throw new NotImplementedException("Remove from role async");
            return Task.FromResult<IList<string>>(BLUser<TUser>.GetIdentityRoles(user.Id));
        }
        //
        // Summary:
        //     Returns true if a user is in the role
        //
        // Parameters:
        //   user:
        //
        //   roleName:
        public Task<bool> IsInRoleAsync(TUser user, string roleName)
        {
            throw new NotImplementedException("Is in Role async");
        }
        //
        // Summary:
        //     Removes the role for the user
        //
        // Parameters:
        //   user:
        //
        //   roleName:
        public Task RemoveFromRoleAsync(TUser user, string roleName)
        {
            throw new NotImplementedException("Remove from role async");
        }

        public void Dispose()
        {
            //if (Database != null)
            //{
            //    ((IDisposable)Database).Dispose();
            //}
        }
    }
}