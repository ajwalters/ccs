<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<SpeakerViewModel>" %>
<%@ Import Namespace="Ccs.Models"%>
<%@ Import Namespace="Ccs.Security.Models"%>


<div class="container span-17">
  <div class="span-3"><img src="../../Content/Images/Speakers/<%=Model.ImageName%>" style="width: 100%;" />&nbsp;</div>
  <%
    if (Page.User.IsInRole(Role.Administrators))
    {%>
  <div class="span-7 last">
    <%=Html.ActionLink("EDIT", "Edit", new {key = Html.Encode(Model.Key)})%> | 
    <%=Html.ActionLink("DELETE", "Delete", new {key = Html.Encode(Model.Key)})%>
  </div>
  <%
    }%>
  <div class="span-7 last">
    <h3><%=Html.Encode(Model.Name)%></h3>
    <p><%=Html.Encode(Model.Biography)%></p>    
<% foreach (var session in Model.Sessions)
   {
     Response.Output.WriteLine(Html.ActionLink(session.Name, "Details", "Session", new {session.Key}));
   } %>
  </div>
</div>