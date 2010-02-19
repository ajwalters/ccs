using Ccs.Domain;

using StructureMap.Configuration.DSL;

namespace Ccs
{
  public class DependencyRegistry : Registry
  {
    public DependencyRegistry()
    {
      For<ISpeakerRepository>().Use<SpeakerRepository>();
      For<IRoomRepository>().Use<RoomRepository>();
      For<ISessionRepository>().Use<SessionRepository>();
    }
  }
}