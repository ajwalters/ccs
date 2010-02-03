using System;

using Ccs.Domain;

using Xunit;

namespace Ccs.Tests.Facts
{
  public class RoomFacts
  {
    [Fact]
    public void CreateNewRoomFact()
    {
      var room = new Room
                 {
                   Key = Guid.NewGuid(),
                   Name = "Room 110"
                 };
    }
  }
}