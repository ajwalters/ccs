using System;
using System.Collections.Generic;

using Ccs.Domain;


using Xunit;

namespace Ccs.Tests.Facts
{
  public class SpeakerFacts
  {
    [Fact]
    public void CreateNewSpeaker()
    {
      var speaker = new Speaker
                    {
                      Key = Guid.NewGuid(),
                      Name = "Penelope Hall",
                      Biography =
                        @"Penelope has been developing in the C[ute] for over 20 months. And has a passing knowledge of a Lisp dialect. Her hobbies include Mommy, Daddy, Apple and Moon.",
                      //The image is the raw image name of the speakers profile picture.
                      ImageName = "penelope_hall.jpg",
                      //Sessions takes a List of Session.Id guids
                    };


    }
  }
}