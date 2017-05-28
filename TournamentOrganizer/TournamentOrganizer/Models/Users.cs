using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TournamentOrganizer.Models
{
    public class Users : IUser<Guid>
    {
        public Guid Id { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public string Avatar { get; set; }
        public byte GenderId { get; set; }
        public byte RoleId { get; set; }
        public byte StatusId { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime? LastLoginDate { get; set; }
        public DateTime? LastPasswordChangedDate { get; set; }
        public string ForgotPasswordToken { get; set; }
        public DateTime? ForgotPasswordTokenSentOn { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }

        public string UserName { get; set; }
    }
}