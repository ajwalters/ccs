using System;
using System.Collections.Generic;

using Ccs.Models;

using Xunit;

namespace Ccs.Tests.Facts
{
  public class SessionFacts
  {
    [Fact]
    public void CreateNewSession()
    {
      var session = new Session
                    {
                      Key = Guid.NewGuid(),
                      Name = "Fun with db4o",
                      Abstract =
                        "Learn how to use the db4o object database to avoid the pain of managing a relational model.",
                      Description =
                        @"db4o is a rock solid object oriented database management system. 

Despite what the RDBMS vendors may tell you for most purposes an OODBMS is a better fit.

Learn how to use db4o in a connected application and a disconnected web environment without the headaches of managing a relational model.",
                      Start = new DateTime(2010, 10, 1, 9, 00, 00).ToUniversalTime(),
                      End = new DateTime(2010, 10, 1, 10, 0, 0).ToUniversalTime(),
                      //Room taks a Room.Id Guid.
                      Room = Guid.NewGuid(),
                      //Speakers takes a list of Speaker.Id Guids
                      SpeakerKeys = new List<Guid>()
                    };
    }
  }
}