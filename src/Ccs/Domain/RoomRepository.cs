using Ccs.Data;

namespace Ccs.Domain
{
  public class RoomRepository : ObjectRepository<Room>, IRoomRepository
  {
    public override void Update(Room entity)
    {
      var stored = FetchByKey(entity.Key);

      stored.Name = entity.Name;

      Db.Container.Store(stored);
    }
  }
}