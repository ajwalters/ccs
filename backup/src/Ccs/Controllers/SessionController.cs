using System;
using System.Web.Mvc;

using Ccs.Builders;
using Ccs.Domain;

using NLog;

using StructureMap;

namespace Ccs.Controllers
{
  public class SessionController : Controller
  {
    public static readonly Logger log = LogManager.GetCurrentClassLogger();

    readonly SessionRepository _sessionRepository;

    public SessionController()
    {
      _sessionRepository = new SessionRepository();
    }

    public ActionResult Index()
    {
      var builder = new SessionViewModelBuilder(
        (SessionRepository) ObjectFactory.GetInstance(typeof (ISessionRepository)),
        (RoomRepository) ObjectFactory.GetInstance(typeof (IRoomRepository)),
        (SpeakerRepository) ObjectFactory.GetInstance(typeof (ISpeakerRepository))
        );

      return View(builder.Build());
    }

    public ActionResult Details(Guid key)
    {
      return View(_sessionRepository.FetchByKey(key));
    }

    public ActionResult Create()
    {
      return View();
    }

    public ActionResult Delete(Guid key)
    {
      _sessionRepository.DeleteByKey(key);

      return RedirectToAction("Index");
    }

    [HttpPost]
    public ActionResult Create(Session viewModel)
    {
      try
      {
        _sessionRepository.Add(viewModel);

        return RedirectToAction("Index");
      }
      catch
      {
        return View();
      }
    }

    public ActionResult Edit(Guid key)
    {
      return View(_sessionRepository.FetchByKey(key));
    }

    [HttpPost]
    public ActionResult Edit(Guid key, Session viewModel)
    {
      try
      {
        _sessionRepository.Update(viewModel);

        return RedirectToAction("Details", new {viewModel.Key});
      }
      catch
      {
        return View();
      }
    }
  }
}