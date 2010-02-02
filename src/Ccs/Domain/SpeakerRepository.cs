using System;

using Ccs.Data;

namespace Ccs.Domain
{
  public class SpeakerRepository : ObjectRepository<Speaker>
  {
    public override void Update(Guid key, Speaker entity)
    {
      var stored = FetchByKey(key);

      stored.Name = entity.Name;
      stored.Biography = entity.Biography;
      stored.ImageName = entity.ImageName;
      stored.SessionKeys = entity.SessionKeys;

      Db.Container.Store(stored);
    }
  }
}