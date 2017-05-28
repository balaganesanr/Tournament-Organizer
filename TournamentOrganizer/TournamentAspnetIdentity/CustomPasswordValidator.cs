using Microsoft.AspNet.Identity;
using System;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace TournamentAspnetIdentity
{
    public class CustomPasswordValidator : PasswordValidator
    {
        public bool isPasswordRequired { get; set; }

        public override Task<IdentityResult> ValidateAsync(string item)
        {
            if (!isPasswordRequired)
                return Task.FromResult(IdentityResult.Success);
            else
            {
                if (String.IsNullOrEmpty(item) || item.Length < RequiredLength)
                {
                    return Task.FromResult(IdentityResult.Failed(String.Format("Minimum Password Length Required is:{0}", RequiredLength)));
                }

                string PasswordPattern = @"^(?=.*[0-9])(?=.*[!@#$%^&*])[0-9a-zA-Z!@#$%^&*0-9]{10,}$";

                if (!Regex.IsMatch(item, PasswordPattern))
                {
                    return Task.FromResult(IdentityResult.Failed(String.Format("The Password must have at least one numeric and one special character")));
                }

                return Task.FromResult(IdentityResult.Success);
            }
        }
    }
}