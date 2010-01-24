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

    static string _dbPath = ConfigurationManager.ConnectionStrings["ObjectStore"].ConnectionString;

    public static string DBPath
    {
      get { return _dbPath; }
      set { _dbPath = value; }
    }

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
            if (_dbPath.Contains("|DataDirectory|"))
            {
              //we know, then, that this is a web project
              //and HttpContext is hopefully not null...

              _dbPath = _dbPath.Replace("|DataDirectory|", "");
              var appDir = HttpContext.Current.Server.MapPath("~/App_Data/");
              _dbPath = Path.Combine(appDir, _dbPath);
            }

            _db = Db4oFactory.OpenFile(_dbPath);
          }
          return _db;
        }
      }
    }

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