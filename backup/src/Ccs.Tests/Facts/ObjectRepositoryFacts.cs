//using System;
//using System.IO;
//using System.Linq;

//using Ccs.Site.Models;

//using Xunit;

//namespace Ccs.Tests.Facts
//{
//  public class Person
//  {
//    public Guid Key { get; set; }

//    public string Name { get; set; }
//  }

//  public class ObjectRepositoryFacts : IDisposable
//  {
//    public ObjectRepositoryFacts()
//    {
//      if (File.Exists(ObjectDatabase.DbPath))
//      {
//        File.Delete(ObjectDatabase.DbPath);
//      }
//    }

//    /// <summary>
//    /// Performs application-defined tasks associated with freeing, releasing, or resetting unmanaged resources.
//    /// </summary>
//    public void Dispose()
//    {
//      ObjectDatabase.CloseContainer();
//      if (File.Exists(ObjectDatabase.DbPath))
//      {
//        File.Delete(ObjectDatabase.DbPath);
//      }
//    }

//    [Fact]
//    public void ItShouldSaveAnObject()
//    {
//      var r = new ObjectRepository<Person>();
//      Assert.True(r.Count == 0);
//      var p = new Person {Name = "Penelope Hall", Key = new Guid()};
//      r.Save(p);
//      Assert.True(r.Count == 1);
//    }

//    [Fact]
//    public void ItShouldDeleteAnObject()
//    {
//      ItShouldSaveAnObject();
//    }

//    [Fact]
//    public void IsShouldUpdateAnObject()
//    {
//      ItShouldSaveAnObject();

//      var r = new ObjectRepository<Person>();

//      var p = r.Find(x => x.Key == new Guid()).First();

//      Assert.True(p.Key == new Guid());
//      Assert.True(p.Name == "Penelope Hall");
//    }

//    [Fact]
//    public void ItShouldFindAnObjectById()
//    {
//      ItShouldSaveAnObject();

//      var r = new ObjectRepository<Person>();

//      var p = r.Find(x => x.Key == new Guid()).First();

//      Assert.True(p.Key == new Guid());
//      Assert.True(p.Name == "Penelope Hall");


//    }
//  }
//}