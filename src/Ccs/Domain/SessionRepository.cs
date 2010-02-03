using Ccs.Data;

namespace Ccs.Domain
{
  public class SessionRepository : ObjectRepository<Session>
  {
    public override void Update(Session entity)
    {
      var stored = FetchByKey(entity.Key);

      stored.Abstract = entity.Abstract;
      stored.Description = entity.Description;
      stored.End = entity.End;
      stored.Name = entity.Name;
      stored.Start = entity.Start;

      Db.Container.Store(stored);
    }
  }
}