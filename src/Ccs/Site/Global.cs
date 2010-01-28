using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Ccs.Site
{
  // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
  // visit http://go.microsoft.com/?LinkId=9394801

  public class Global : HttpApplication
  {
    /// <summary>
    /// Registers the routes.
    /// </summary>
    /// <param name="routes">The routes.</param>
    public static void RegisterRoutes(RouteCollection routes)
    {
      routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

      routes.MapRoute(
        "Default",
        // Route name
        "{controller}/{action}/{id}",
        // URL with parameters
        new {controller = "Home", action = "Index", id = ""} // Parameter defaults
        );
    }

    /// <summary>
    /// Application_s the start.
    /// </summary>
    protected void Application_Start()
    {
      AreaRegistration.RegisterAllAreas();

      RegisterRoutes(RouteTable.Routes);
    }
  }
}