using Ccs.Data;

namespace Ccs.Domain
{
  public interface ISpeakerRepository : IObjectRepository<Speaker> { }

  public class SpeakerRepository : ObjectRepository<Speaker>
  {


    public override void Update(Speaker entity)
    {
      var stored = FetchByKey(entity.Key);

      stored.Name = entity.Name;
      stored.Biography = entity.Biography;
      stored.ImageName = entity.ImageName;
      

      Db.Container.Store(stored);
    }
  }
}