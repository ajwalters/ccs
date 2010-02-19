<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<SessionViewModel>" %>
<%@ Import Namespace="Ccs.Models"%>
<%@ Import Namespace="Ccs.Security.Models"%>


<div class="container span-17">
  <%
    if (Page.User.IsInRole(Role.Administrators))
    {%>
  <div class="span-10 last">
    <%=Html.ActionLink("EDIT", "Edit", new {key = Html.Encode(Model.Key)})%> | 
    <%=Html.ActionLink("DELETE", "Delete", new {key = Html.Encode(Model.Key)})%>
  </div>
  <%
    }%>
  <div class="span-7 last">
    <h3><%=Html.Encode(Model.Name)%></h3>
        <p><%=Html.Encode(Model.Description)%></p>
    <p><%=Html.Encode(Model.Abstract)%></p>
<%  foreach (var speaker in Model.Speakers)
    {
      Response.Output.WriteLine(Html.ActionLink(speaker.Name, "Details", "Speaker", new {speaker.Key}));
    } %>
  </div>
</div>
