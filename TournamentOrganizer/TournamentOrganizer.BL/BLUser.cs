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
            try
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
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool DeleteRefreshToken(string refreshTokenId)
        {
            try
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
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static RefreshToken FindRefreshToken(string refreshTokenId)
        {
            RefreshToken token = null;
            try
            {
                if (string.IsNullOrWhiteSpace(refreshTokenId))
                    throw new Exception("Invalid refresh token");

                using (TournamentOrganizerEntities context = new TournamentOrganizerEntities())
                {
                    context.Configuration.LazyLoadingEnabled = false;
                    token = context.RefreshTokens.Where(rt => rt.Id == refreshTokenId).FirstOrDefault();
                }

                return token;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static Client FindClient(string id)
        {
            try
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
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<string> GetIdentityRoles(Guid userId)
        {
            try
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
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static User GetUser(string username)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(username))
                    throw new Exception("Invalid user name");

                using (TournamentOrganizerEntities context = new TournamentOrganizerEntities())
                {
                    var users = from u in context.Users
                                where u.Username.Trim() == username.Trim()
                                select u;

                    if (users.FirstOrDefault() == null)
                        throw new Exception("Invalid username or password.");
                    if (users.ToList().Count > (int)NumericValues.ONE)
                        throw new Exception("Some strange issue has occured. Please contact support team");

                    return users.FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static TUser GetIdentityUser(string username)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(username))
                    throw new Exception("Invalid user name");
                User user = GetUser(username);
                return LoadUser(user) as TUser;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static TUser GetIdentityUser(Guid id)
        {
            try
            {
                if (id == Guid.Empty)
                    throw new Exception("Invalid user id");

                User user = GetUser(id);
                return LoadUser(user) as TUser;
            }
            catch (Exception ex)
            {
                throw ex;
            }
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
            try
            {
                if (id == Guid.Empty)
                    throw new Exception("Invalid user id");

                using (TournamentOrganizerEntities context = new TournamentOrganizerEntities())
                {
                    var users = from u in context.Users
                                where u.Id == id
                                select u;

                    if (users.ToList().Count > (int)NumericValues.ONE)
                        throw new Exception("Some strange issue has occured. Please contact support team");

                    return users.FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
