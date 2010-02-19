using Ccs.Data;

namespace Ccs.Domain
{
  public class SpeakerRepository : ObjectRepository<Speaker>, ISpeakerRepository
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