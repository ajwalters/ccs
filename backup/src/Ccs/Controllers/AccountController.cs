using System;
using System.Diagnostics.CodeAnalysis;
using System.Security.Principal;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;

using Ccs.Security.Contracts;
using Ccs.Security.Models;
using Ccs.Services;

using NLog;

namespace Ccs.Site.Controllers
{
  [HandleError]
  public class AccountController : Controller
  {
    public static readonly Logger log = LogManager.GetCurrentClassLogger();

    /// <summary>
    /// Initializes a new instance of the <see cref="AccountController"/> class.
    /// </summary>
    public AccountController()
      : this(null, null)
    {
    }

    /// <summary>
    /// Initializes a new instance of the <see cref="AccountController"/> class.
    /// </summary>
    /// <param name="formsService">The forms service.</param>
    /// <param name="membershipService">The membership service.</param>
    public AccountController(IFormsAuthenticationService formsService, IMembershipService membershipService)
    {
      FormsService = formsService ?? new FormsAuthenticationService();
      MembershipService = membershipService ?? new AccountMembershipService();
    }

    /// <summary>
    /// Gets or sets the forms service.
    /// </summary>
    /// <value>The forms service.</value>
    public IFormsAuthenticationService FormsService { get; private set; }

    /// <summary>
    /// Gets or sets the membership service.
    /// </summary>
    /// <value>The membership service.</value>
    public IMembershipService MembershipService { get; private set; }

    /// <summary>
    /// Initializes data that might not be available when the constructor is called.
    /// </summary>
    /// <param name="requestContext">The HTTP context and route data.</param>
    protected override void Initialize(RequestContext requestContext)
    {
      if (requestContext.HttpContext.User.Identity is WindowsIdentity)
      {
        throw new InvalidOperationException("Windows authentication is not supported.");
      }
      base.Initialize(requestContext);
    }

    /// <summary>
    /// Called before the action method is invoked.
    /// </summary>
    /// <param name="filterContext">Information about the current request and action.</param>
    protected override void OnActionExecuting(ActionExecutingContext filterContext)
    {
      ViewData["PasswordLength"] = MembershipService.MinPasswordLength;

      base.OnActionExecuting(filterContext);
    }

    /// <summary>
    /// Changes the password.
    /// </summary>
    /// <returns></returns>
    [Authorize]
    public ActionResult ChangePassword()
    {
      return View();
    }

    /// <summary>
    /// Changes the password.
    /// </summary>
    /// <param name="model">The model.</param>
    /// <returns></returns>
    [Authorize]
    [HttpPost]
    public ActionResult ChangePassword(ChangePasswordModel model)
    {
      if (ModelState.IsValid)
      {
        if (MembershipService.ChangePassword(User.Identity.Name, model.OldPassword, model.NewPassword))
        {
          return RedirectToAction("ChangePasswordSuccess");
        }
        ModelState.AddModelError("", "The current password is incorrect or the new password is invalid.");
      }

      return View(model);
    }

    /// <summary>
    /// Changes the password success.
    /// </summary>
    /// <returns></returns>
    public ActionResult ChangePasswordSuccess()
    {
      return View();
    }

    /// <summary>
    /// Logs the off.
    /// </summary>
    /// <returns></returns>
    public ActionResult LogOff()
    {
      FormsService.SignOut();

      return RedirectToAction("Index", "Home");
    }

    /// <summary>
    /// Logs the on.
    /// </summary>
    /// <returns></returns>
    public ActionResult LogOn()
    {
      return View();
    }

    /// <summary>
    /// Logs the on.
    /// </summary>
    /// <param name="model">The model.</param>
    /// <param name="returnUrl">The return URL.</param>
    /// <returns></returns>
    [HttpPost]
    [SuppressMessage("Microsoft.Design", "CA1054:UriParametersShouldNotBeStrings",
      Justification = "Needs to take same parameter type as Controller.Redirect()")]
    public ActionResult LogOn(LogOnModel model, string returnUrl)
    {
      if (ModelState.IsValid)
      {
        if (MembershipService.ValidateUser(model.UserName, model.Password))
        {
          FormsService.SignIn(model.UserName, model.RememberMe);
          if (!string.IsNullOrEmpty(returnUrl))
          {
            return Redirect(returnUrl);
          }
          return RedirectToAction("Index", "Home");
        }
        ModelState.AddModelError("", "The user name or password provided is incorrect.");
      }

      return View(model);
    }

    /// <summary>
    /// Registers this instance.
    /// </summary>
    /// <returns></returns>
    public ActionResult Register()
    {
      return View();
    }

    /// <summary>
    /// Registers the specified model.
    /// </summary>
    /// <param name="model">The model.</param>
    /// <returns></returns>
    [HttpPost]
    public ActionResult Register(RegisterModel model)
    {
      if (ModelState.IsValid)
      {
        var createStatus = MembershipService.CreateUser(model.UserName, model.Password, model.Email);

        if (createStatus == MembershipCreateStatus.Success)
        {
          FormsService.SignIn(model.UserName, false /* createPersistentCookie */);
          return RedirectToAction("Index", "Home");
        }
        ModelState.AddModelError("", ErrorCodeToString(createStatus));
      }

      return View(model);
    }

    /// <summary>
    /// Errors the code to string.
    /// </summary>
    /// <param name="createStatus">The create status.</param>
    /// <returns></returns>
    static string ErrorCodeToString(MembershipCreateStatus createStatus)
    {
      switch (createStatus)
      {
        case MembershipCreateStatus.DuplicateUserName:
          return "Username already exists. Please enter a different user name.";

        case MembershipCreateStatus.DuplicateEmail:
          return "A username for that e-mail address already exists. Please enter a different e-mail address.";

        case MembershipCreateStatus.InvalidPassword:
          return "The password provided is invalid. Please enter a valid password value.";

        case MembershipCreateStatus.InvalidEmail:
          return "The e-mail address provided is invalid. Please check the value and try again.";

        case MembershipCreateStatus.InvalidAnswer:
          return "The password retrieval answer provided is invalid. Please check the value and try again.";

        case MembershipCreateStatus.InvalidQuestion:
          return "The password retrieval question provided is invalid. Please check the value and try again.";

        case MembershipCreateStatus.InvalidUserName:
          return "The user name provided is invalid. Please check the value and try again.";

        case MembershipCreateStatus.ProviderError:
          return
            "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

        case MembershipCreateStatus.UserRejected:
          return
            "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

        default:
          return
            "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
      }
    }
  }
}