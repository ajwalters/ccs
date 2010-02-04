using Ccs.Domain;

using StructureMap.Configuration.DSL;

namespace Ccs
{
  public class CcsRegistry : Registry
  {
    public CcsRegistry()
    {
      Profile("Ccs",
        x => {
          x.For<ISpeakerRepository>().Use<SpeakerRepository>();
          x.For<ISessionRepository>().Use<SessionRepository>();
          x.For<IRoomRepository>().Use<RoomRepository>();
        }
        );
    }
  }
}