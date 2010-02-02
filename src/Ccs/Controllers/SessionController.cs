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

    readonly SessionRepository repository;

    public SessionController()
    {
      repository = new SessionRepository();
    }

    public ActionResult Index()
    {
      return View(repository.FetchAll().ToList());
    }

    public ActionResult Details(Guid key)
    {
      return View(repository.FetchByKey(key));
    }

    public ActionResult Create()
    {
      return View();
    }

    public ActionResult Delete(Guid key)
    {
      repository.DeleteByKey(key);

      return RedirectToAction("Index");
    }

    [HttpPost]
    public ActionResult Create(Session viewModel)
    {
      try
      {
        repository.Add(viewModel);

        return RedirectToAction("Index");
      }
      catch
      {
        return View();
      }
    }

    public ActionResult Edit(Guid key)
    {
      return View(repository.FetchByKey(key));
    }

    [HttpPost]
    public ActionResult Edit(Guid key, Session viewModel)
    {
      try
      {
        repository.Update(key, viewModel);

        return RedirectToAction("Details", new {viewModel.Key});
      }
      catch
      {
        return View();
      }
    }
  }
}