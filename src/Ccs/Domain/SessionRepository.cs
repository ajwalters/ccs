using System;

using Ccs.Data;

namespace Ccs.Domain
{
  public class SessionRepository : ObjectRepository<Session>
  {
    public override void Update(Guid key, Session entity)
    {
      var stored = FetchByKey(key);

      stored.Name = entity.Name;
      stored.Abstract = entity.Abstract;
      stored.Room = entity.Room;
      stored.Start = entity.Start;
      stored.End = entity.End;
      stored.SpeakerKeys = entity.SpeakerKeys;

      Db.Container.Store(stored);
    }
  }
}