using System;
using System.Linq;
using System.Web.Mvc;

using Ccs.Domain;

using NLog;

namespace Ccs.Site.Controllers
{
  public class SpeakerController : Controller
  {
    public static readonly Logger log = LogManager.GetCurrentClassLogger();

    readonly SpeakerRepository repository;

    public SpeakerController()
    {
      repository = new SpeakerRepository();
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
    public ActionResult Create(Speaker viewModel)
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
    public ActionResult Edit(Guid key, Speaker viewModel)
    {
      try
      {
        repository.Update(viewModel);

        return RedirectToAction("Details", new {viewModel.Key});
      }
      catch
      {
        return View();
      }
    }
  }
}