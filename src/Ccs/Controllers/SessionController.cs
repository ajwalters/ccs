using System;
using System.Linq;
using System.Web.Mvc;

using Ccs.Domain;

using NLog;

namespace Ccs.Controllers
{
  public class SessionController : Controller
  {
    public static readonly Logger log = LogManager.GetCurrentClassLogger();

    readonly SessionRepository sessionRepository;

    public SessionController()
    {
      sessionRepository = new SessionRepository();
    }

    public ActionResult Index()
    {
      return View(sessionRepository.FetchAll().ToList());
    }

    public ActionResult Details(Guid key)
    {
      return View(sessionRepository.FetchByKey(key));
    }

    public ActionResult Create()
    {
      return View();
    }

    public ActionResult Delete(Guid key)
    {
      sessionRepository.DeleteByKey(key);

      return RedirectToAction("Index");
    }

    [HttpPost]
    public ActionResult Create(Session viewModel)
    {
      try
      {
        sessionRepository.Add(viewModel);

        return RedirectToAction("Index");
      }
      catch
      {
        return View();
      }
    }

    public ActionResult Edit(Guid key)
    {
      return View(sessionRepository.FetchByKey(key));
    }

    [HttpPost]
    public ActionResult Edit(Guid key, Session viewModel)
    {
      try
      {
        sessionRepository.Update(viewModel);

        return RedirectToAction("Details", new {viewModel.Key});
      }
      catch
      {
        return View();
      }
    }
  }
}