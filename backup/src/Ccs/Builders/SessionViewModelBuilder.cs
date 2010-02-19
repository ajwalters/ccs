#region

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

using Ccs.Domain;
using Ccs.Models;

#endregion

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

    public List<SessionViewModel> Build()
    {
      var list = new List<SessionViewModel>();

      _sessionRepository.FetchAll().ToList().ForEach(x => list.Add(Build(x.Key)));

      return list;
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
                 Sessions =
                   entity.SpeakerKeys.Count == 0
                     ? null
                     : new SelectList(_speakerRepository.FetchByKeys(entity.SpeakerKeys)),
               };

      return vm;
    }
  }
}