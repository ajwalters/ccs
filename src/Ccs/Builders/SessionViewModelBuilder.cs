using System;
using System.Web.Mvc;

using Ccs.Domain;
using Ccs.Models;

namespace Ccs.Builders
{
  public class SessionViewModelBuilder
  {
    readonly IRoomRepository _roomRepository;

    readonly ISessionRepository _sessionRepository;

    readonly ISpeakerRepository _speakerRepository;

    public SessionViewModelBuilder(ISessionRepository sessionRepository,
                                   IRoomRepository roomRepository,
                                   ISpeakerRepository speakerRepository)
    {
      _sessionRepository = sessionRepository;
      _roomRepository = roomRepository;
      _speakerRepository = speakerRepository;
    }

    public SessionViewModel Build(Guid key)
    {
      var entity = _sessionRepository.FetchByKey(key);

      var vm = new SessionViewModel
               {
                 Abstract = entity.Abstract,
                 Description = entity.Description,
                 End = entity.End,
                 Key = entity.Key,
                 Name = entity.Name,
                 Room = _roomRepository.FetchByKey(entity.Room),
                 Start = entity.Start,
                 Sessions = new SelectList(_speakerRepository.FetchByKeys(entity.SpeakerKeys)),
               };

      return vm;
    }
  }
}