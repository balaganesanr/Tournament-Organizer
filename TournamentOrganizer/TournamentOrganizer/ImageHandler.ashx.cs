using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using TournamentOrganizer.BL;

namespace TournamentOrganizer
{
    /// <summary>
    /// Summary description for ImageHandler
    /// </summary>
    public class ImageHandler : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            // Get the image name
            string imageName = context.Request.QueryString["fileName"];
            // Get the image type
            string type = context.Request.QueryString["Type"];

            string imagePath = System.Configuration.ConfigurationManager.AppSettings["ImagePath"], _i = string.Empty;
            string extension = Path.GetExtension(imageName).Trim().ToLower();
            string imageUrl = string.Empty;

            ImageType imageType = ImageType.None;
            Enum.TryParse(type, out imageType);

            if (ImageType.General == imageType)
                imageUrl = Path.Combine(imagePath, type, imageName);

            if (File.Exists(imageUrl))
            {
                byte[] buffer = File.ReadAllBytes(imageUrl);
                context.Response.OutputStream.Write(buffer, 0, buffer.Length);
            }
            else
                context.Response.Write("");
        }

        public bool IsReusable
        {
            get
            {
                return true;
            }
        }
    }
}