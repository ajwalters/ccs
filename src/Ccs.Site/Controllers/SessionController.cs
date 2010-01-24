using System.Collections.Generic;
using System.Web.Mvc;

using Ccs.Site.Models;

namespace Ccs.Site.Controllers
{
  public class SessionController : Controller
  {
    //
    // GET: /Session/Details/the_session_name

    public ActionResult Details(string id)
    {
      var model = new Session
                    {
                      Abstract = "This will be a fun session.",
                      Description = "Here is a really long description of what the session will be about.",
                      Name = "Happy Fun Time Session",
                      Speaker = "Michael D. Hall"
                    };

      return View(model);
    }

    public ActionResult Index()
    {
      var model = new List<Session>
                  {
                    new Session
                    {
                      Abstract = "This will be a fun session.",
                      Description = "Here is a really long description of what the session will be about.",
                      Name = "Happy Fun Time Session",
                      Speaker = "Michael D. Hall"
                    }
                  };

      return View(model);
    }

    public ActionResult Agenda()
    {
      var model = new Agenda
                  {
                    Sessions = new List<Session>
                               {
                                 new Session
                                 {
                                   Abstract = "This will be a fun session.",
                                   Description = "Here is a really long description of what the session will be about.",
                                   Name = "Happy Fun Time Session",
                                   Speaker = "Michael D. Hall"
                                 }
                               }
                  };

      return View(model);
    }


    //
    // GET: /Session/Create

    public ActionResult Create()
    {
      return View();
    }

    //
    // POST: /Session/Create

    [HttpPost]
    public ActionResult Create(FormCollection collection)
    {
      try
      {
        // TODO: Add insert logic here

        return RedirectToAction("Index");
      }
      catch
      {
        return View();
      }
    }

    //
    // GET: /Session/Edit/5

    public ActionResult Edit(int id)
    {
      return View();
    }

    //
    // POST: /Session/Edit/5

    [HttpPost]
    public ActionResult Edit(int id, FormCollection collection)
    {
      try
      {
        // TODO: Add update logic here

        return RedirectToAction("Index");
      }
      catch
      {
        return View();
      }
    }
  }
}