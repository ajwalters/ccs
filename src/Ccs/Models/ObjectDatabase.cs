using System.Configuration;
using System.IO;
using System.Web;

using Db4objects.Db4o;

namespace Ccs.Site.Models
{
  public class ObjectDatabase
  {
    static readonly object padlock = new object();

    // static object container variable 
    static IObjectContainer _db;

    static ObjectDatabase()
    {
      DbPath = ConfigurationManager.ConnectionStrings["ObjectStore"].ConnectionString;
    }

    public static string DbPath { get; set; }

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
            DbPath = ExpandDataDirectory(DbPath);

            _db = Db4oFactory.OpenFile(DbPath);
          }
          return _db;
        }
      }
    }

    /// <summary>
    /// Gets the db path.
    /// </summary>
    public static string ExpandDataDirectory(string connectionString)
    {
      if (!connectionString.Contains("|DataDirectory|"))
      {
        return connectionString;
      }
      connectionString = connectionString.Replace("|DataDirectory|", "");
      var appDir = HttpContext.Current.Server.MapPath("~/App_Data/");
      return Path.Combine(appDir, connectionString);
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