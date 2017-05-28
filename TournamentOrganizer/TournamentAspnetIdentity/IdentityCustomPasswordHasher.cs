using Microsoft.AspNet.Identity;
using System;
using System.Security.Cryptography;

namespace TournamentAspnetIdentity
{
    public class IdentityCustomPasswordHasher : PasswordHasher
    {
        private const int SaltByteSize = 32;
        private const int HashByteSize = 32;
        private const int HasingIterationsCount = 27176;
        public override string HashPassword(string password)
        {
            byte[] salt;
            byte[] buffer2;
            if (password == null)
                throw new ArgumentNullException("password");

            using (Rfc2898DeriveBytes bytes = new Rfc2898DeriveBytes(password, SaltByteSize, HasingIterationsCount))
            {
                salt = bytes.Salt;
                buffer2 = bytes.GetBytes(HashByteSize);
            }
            byte[] dst = new byte[(SaltByteSize + HashByteSize) + 1];
            Buffer.BlockCopy(salt, 0, dst, 1, SaltByteSize);
            Buffer.BlockCopy(buffer2, 0, dst, SaltByteSize + 1, HashByteSize);
            return Convert.ToBase64String(dst);
        }

        public override PasswordVerificationResult VerifyHashedPassword(string hashedPassword, string providedPassword)
        {
            bool result = false;
            byte[] passwordHashing;
            int _arrayLen = (SaltByteSize + HashByteSize) + 1;
            if (hashedPassword == null)
                result = false;
            else
            {
                if (providedPassword == null)
                    throw new ArgumentNullException("password");
                byte[] src = Convert.FromBase64String(hashedPassword);
                if ((src.Length != _arrayLen) || (src[0] != 0))
                    result = false;
                else
                {
                    byte[] salt = new byte[SaltByteSize];
                    Buffer.BlockCopy(src, 1, salt, 0, SaltByteSize);
                    byte[] hashed = new byte[HashByteSize];
                    Buffer.BlockCopy(src, SaltByteSize + 1, hashed, 0, HashByteSize);
                    using (Rfc2898DeriveBytes bytes = new Rfc2898DeriveBytes(providedPassword, salt, HasingIterationsCount))
                        passwordHashing = bytes.GetBytes(SaltByteSize);

                    result = ByteArraysEqual(hashed, passwordHashing);
                }
            }

            if (result)
                return PasswordVerificationResult.Success;
            else
                return PasswordVerificationResult.Failed;
        }

        public static bool ByteArraysEqual(byte[] b1, byte[] b2)
        {
            if (b1 == b2) return true;
            if (b1 == null || b2 == null || b1.Length != b2.Length) return false;
            for (int i = 0; i < b1.Length; i++)
                if (b1[i] != b2[i]) return false;
            return true;
        }
    }
}