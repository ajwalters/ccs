using System;
using System.Linq;
using System.Net;
using System.Web.Mvc;

using Ccs.Site.Models;

using NLog;

namespace Ccs.Site.Controllers
{
  public class SpeakerController : Controller
  {
    public static readonly Logger log = LogManager.GetCurrentClassLogger();

    /// <summary>
    /// Indexes this instance.
    /// </summary>
    /// <returns></returns>
    public ActionResult Index()
    {
      var repository = new ObjectRepository<Speaker>();
      var model = repository.GetAll();
      return View(model);
    }

    /// <summary>
    /// Detailses the specified id.
    /// </summary>
    /// <param name="id">The id.</param>
    /// <returns></returns>
    public ActionResult Details(Guid id)
    {
      var repository = new ObjectRepository<Speaker>();
      var model = repository.Find(m => m.Id == id).First();
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
    /// Deletes the specified id.
    /// </summary>
    /// <param name="id">The id.</param>
    /// <returns></returns>
    public void Delete(Guid id)
    {
      var repository = new ObjectRepository<Speaker>();
      repository.DeleteBy(id);

      RedirectToAction("Index");
    }

    /// <summary>
    /// Creates the specified model.
    /// </summary>
    /// <param name="model">The model.</param>
    /// <returns></returns>
    [HttpPost]
    public ActionResult Create(Speaker model)
    {
      try
      {
        var repository = new ObjectRepository<Speaker>();
        if (0 < (repository.Find(s => s.Name == model.Name)).Count())
        {
          throw new WebException("The speaker already exists.");
        }
        model.Id = Guid.NewGuid();
        repository.Save(model);

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
      var repository = new ObjectRepository<Speaker>();
      var model = repository.Find(s => s.Id == id);
      return View(model);
    }

    /// <summary>
    /// Edits the specified id.
    /// </summary>
    /// <param name="id">The id.</param>
    /// <param name="speaker">The speaker.</param>
    /// <returns></returns>
    [HttpPost]
    public ActionResult Edit(Guid id, Speaker speaker)
    {
      try
      {
        var repository = new ObjectRepository<Speaker>();
        repository.Save(speaker);

        return RedirectToAction("Index");
      }
      catch
      {
        return View();
      }
    }
  }
}