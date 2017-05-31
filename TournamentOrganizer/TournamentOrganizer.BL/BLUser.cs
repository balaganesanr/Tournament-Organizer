using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TournamentOrganizer.Model;

namespace TournamentOrganizer.BL
{
    static public class BLUser<TUser>
        where TUser : IdentityUsers
    {
        public static bool AddRefreshToken(RefreshToken token)
        {

            if (token == null)
                throw new Exception("Invalid refresh token");

            using (TournamentOrganizerEntities context = new TournamentOrganizerEntities())
            {
                context.RefreshTokens.Add(token);
                context.SaveChanges();
            }

            return true;
        }

        public static bool DeleteRefreshToken(string refreshTokenId)
        {

            if (string.IsNullOrWhiteSpace(refreshTokenId))
                throw new Exception("Invalid refresh token");

            using (TournamentOrganizerEntities context = new TournamentOrganizerEntities())
            {
                context.Configuration.LazyLoadingEnabled = false;
                var token = context.RefreshTokens.Where(rt => rt.Id == refreshTokenId).FirstOrDefault();
                if (token != null)
                    context.RefreshTokens.Remove(token);
                context.SaveChanges();
            }

            return true;

        }

        public static RefreshToken FindRefreshToken(string refreshTokenId)
        {
            RefreshToken token = null;
            if (string.IsNullOrWhiteSpace(refreshTokenId))
                throw new Exception("Invalid refresh token");

            using (TournamentOrganizerEntities context = new TournamentOrganizerEntities())
            {
                context.Configuration.LazyLoadingEnabled = false;
                token = context.RefreshTokens.Where(rt => rt.Id == refreshTokenId).FirstOrDefault();
            }

            return token;
        }
        public static Client FindClient(string id)
        {
            if (string.IsNullOrWhiteSpace(id))
                throw new Exception("Invalid client id");

            using (TournamentOrganizerEntities context = new TournamentOrganizerEntities())
            {
                var clients = from c in context.Clients
                              where c.Id == id
                              select c;

                return clients.FirstOrDefault();
            }
        }
        public static List<string> GetIdentityRoles(Guid userId)
        {
            if (userId == Guid.Empty)
                throw new Exception("Invalid user name");

            using (TournamentOrganizerEntities context = new TournamentOrganizerEntities())
            {
                var roles = from tuser in context.Users
                            join role in context.Roles on tuser.RoleId equals role.Id
                            where tuser.Id == userId
                            select role.Name;

                return roles.ToList();
            }
        }
        public static User GetUser(string username)
        {
            if (string.IsNullOrWhiteSpace(username))
                throw new Exception("Invalid user name");

            using (TournamentOrganizerEntities context = new TournamentOrganizerEntities())
            {
                var users = from u in context.Users
                            where u.Username.Trim() == username.Trim()
                            select u;

                var _users = users.ToList();

                if (_users == null)
                    throw new Exception("Invalid username or password.");

                if (_users.Count > (int)NumericValues.ONE)
                    throw new Exception("Some strange issue has occurred. Please contact support team");

                return _users.FirstOrDefault();
            }
        }

        public static TUser GetIdentityUser(string username)
        {
            if (string.IsNullOrWhiteSpace(username))
                throw new Exception("Invalid user name");
            User user = GetUser(username);
            return LoadUser(user) as TUser;
        }

        public static TUser GetIdentityUser(Guid id)
        {
            if (id == Guid.Empty)
                throw new Exception("Invalid user id");

            User user = GetUser(id);
            return LoadUser(user) as TUser;
        }

        private static IdentityUsers LoadUser(User user)
        {
            TUser identityUser = (TUser)Activator.CreateInstance(typeof(TUser)); ;
            identityUser.Id = user.Id;
            identityUser.UserName = user.Username;

            identityUser.Password = user.Password;
            identityUser.Name = user.Name;
            identityUser.Avatar = user.Avatar;
            identityUser.GenderId = user.GenderId;
            identityUser.RoleId = user.RoleId;
            identityUser.StatusId = user.StatusId;
            identityUser.IsDeleted = user.IsDeleted;
            identityUser.LastLoginDate = user.LastLoginDate;
            identityUser.LastPasswordChangedDate = user.LastPasswordChangedDate;
            identityUser.ForgotPasswordToken = user.ForgotPasswordToken;
            identityUser.ForgotPasswordTokenSentOn = user.ForgotPasswordTokenSentOn;
            identityUser.CreatedBy = user.CreatedBy;
            identityUser.CreatedOn = user.CreatedOn;
            identityUser.ModifiedBy = user.ModifiedBy;
            identityUser.ModifiedOn = user.ModifiedOn;
            identityUser.SecurityStamp = (new Guid()).ToString();
            return identityUser;
        }
        public static User GetUser(Guid id)
        {
            if (id == Guid.Empty)
                throw new Exception("Invalid user id");

            using (TournamentOrganizerEntities context = new TournamentOrganizerEntities())
            {
                var users = from u in context.Users
                            where u.Id == id
                            select u;

                var _users = users.ToList();

                if (_users == null)
                    throw new Exception("Invalid user id");

                if (_users.Count > (int)NumericValues.ONE)
                    throw new Exception("Some strange issue has occurred. Please contact support team");

                return _users.FirstOrDefault();
            }
        }
    }
}
