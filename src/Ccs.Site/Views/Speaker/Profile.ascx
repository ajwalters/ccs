<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Speaker>" %>
<%@ Import Namespace="Ccs.Models"%>

<div class="container span-17">
  <div class="span-3"><img src="../../Content/Images/Speakers/<%= Model.ImageName %>" style="width: 100%;" /></div>
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
  </div>
</div>