using StructureMap;

namespace Ccs
{
  public class Bootstrapper : IBootstrapper
  {
    public static bool HasStarted { get; private set; }

    public void BootstrapStructureMap()
    {
      ObjectFactory.Initialize(
        x => x.Scan(scan =>
        {
          scan.AssembliesFromApplicationBaseDirectory();
          scan.TheCallingAssembly();
          scan.LookForRegistries();
        })
        );
    }

    public static void Restart()
    {
      if (HasStarted)
      {
        ObjectFactory.ResetDefaults();
      }
      Configure();
      HasStarted = true;
    }

    public static void Configure()
    {
      (new Bootstrapper()).BootstrapStructureMap();
    }
  }
}