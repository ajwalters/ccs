using System.Configuration;
using System.IO;
using System.Web;

using Db4objects.Db4o;

namespace Ccs.Data
{
  public class Db
  {
    static readonly object padlock = new object();

    // static object container variable 
    static IObjectContainer _db;

    /// <summary>
    /// Initializes the <see cref="Db"/> class.
    /// </summary>
    static Db()
    {
      DbPath = ConfigurationManager.ConnectionStrings["ObjectStore"].ConnectionString;
    }

    /// <summary>
    /// Gets or sets the DB path.
    /// </summary>
    /// <value>The DB path.</value>
    public static string DbPath { get; set; }

    /// <summary>
    /// Gets the container.
    /// </summary>
    /// <value>The container.</value>
    public static IObjectContainer Container
    {
      get
      {
        lock (padlock)
        {
          if (_db == null)
          {
            //check to see if this is pointing to data directory
            //change as you need btw
            if (DbPath.Contains("|DataDirectory|"))
            {
              //we know, then, that this is a web project
              //and HttpContext is hopefully not null...

              DbPath = DbPath.Replace("|DataDirectory|", "");
              var appDir = HttpContext.Current.Server.MapPath("~/App_Data/");
              DbPath = Path.Combine(appDir, DbPath);
            }

            _db = Db4oFactory.OpenFile(DbPath);
          }
          return _db;
        }
      }
    }

    /// <summary>
    /// Closes the container.
    /// </summary>
    public static void CloseContainer()
    {
      if (_db != null)
      {
        _db.Close();
      }
      _db = null;
    }
  }
}