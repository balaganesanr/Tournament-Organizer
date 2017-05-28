using System.Net;
using System.Net.Http;
using System.Web.Http;
using TournamentOrganizer.Application_Code;

namespace TournamentOrganizer.Controllers
{
    public class CommonController : ApiController
    {
        [AllowAnonymous]
        [HttpGet]
        public HttpResponseMessage Logout()
        {
            AuthRepository authRepository = new AuthRepository();
            authRepository.Signout();
            return Request.CreateResponse(HttpStatusCode.OK);
        }
    }
}
