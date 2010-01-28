using System;
using System.Collections.Generic;
using System.Web.Mvc;

using Ccs.Site.Models;

using NLog;

namespace Ccs.Site.Controllers
{
  public class SessionController : Controller
  {
    public static readonly Logger log = LogManager.GetCurrentClassLogger();

    /// <summary>
    /// Detailses the specified id.
    /// </summary>
    /// <param name="id">The id.</param>
    /// <returns></returns>
    public ActionResult Details(Guid id)
    {
      var model = new Session
                  {
                    Id = Guid.NewGuid(),
                    Abstract = "This will be a fun session.",
                    Description = "Here is a really long description of what the session will be about.",
                    Name = "Happy Fun Time Session",
                    Speaker = "Michael D. Hall"
                  };

      return View(model);
    }

    /// <summary>
    /// Indexes this instance.
    /// </summary>
    /// <returns></returns>
    public ActionResult Index()
    {
      var model = new List<Session>
                  {
                    new Session
                    {
                      Id = Guid.NewGuid(),
                      Abstract = "This will be a fun session.",
                      Description = "Here is a really long description of what the session will be about.",
                      Name = "Happy Fun Time Session",
                      Speaker = "Michael D. Hall"
                    }
                  };

      return View(model);
    }

    /// <summary>
    /// Agendas this instance.
    /// </summary>
    /// <returns></returns>
    public ActionResult Agenda()
    {
      var model = new Agenda
                  {
                    Sessions = new List<Session>
                               {
                                 new Session
                                 {
                                   Id = Guid.NewGuid(),
                                   Abstract = "This will be a fun session.",
                                   Description = "Here is a really long description of what the session will be about.",
                                   Name = "Happy Fun Time Session",
                                   Speaker = "Michael D. Hall"
                                 }
                               }
                  };

      return View(model);
    }

    /// <summary>
    /// Creates this instance.
    /// </summary>
    /// <returns></returns>
    public ActionResult Create()
    {
      return View();
    }

    /// <summary>
    /// Creates the specified collection.
    /// </summary>
    /// <param name="collection">The collection.</param>
    /// <returns></returns>
    [HttpPost]
    public ActionResult Create(FormCollection collection)
    {
      try
      {
        return RedirectToAction("Index");
      }
      catch
      {
        return View();
      }
    }

    /// <summary>
    /// Edits the specified id.
    /// </summary>
    /// <param name="id">The id.</param>
    /// <returns></returns>
    public ActionResult Edit(Guid id)
    {
      return View();
    }

    /// <summary>
    /// Edits the specified id.
    /// </summary>
    /// <param name="id">The id.</param>
    /// <param name="collection">The collection.</param>
    /// <returns></returns>
    [HttpPost]
    public ActionResult Edit(Guid id, FormCollection collection)
    {
      try
      {
        return RedirectToAction("Index");
      }
      catch
      {
        return View();
      }
    }
  }
}