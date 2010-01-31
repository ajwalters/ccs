<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Session>" %>
<%@ Import Namespace="Ccs.Site.Models"%>

<div class="container span-17">
  <%
    if (Page.User.IsInRole(Role.Administrators))
    {%>
  <div class="span-10 last">
    <%=Html.ActionLink("EDIT", "Edit", new {id = Html.Encode(Model.Id)})%> | 
    <%=Html.ActionLink("DELETE", "Delete", new {id = Html.Encode(Model.Id)})%>
  </div>
  <%
    }%>
  <div class="span-7 last">
    <h3><%=Html.Encode(Model.Name)%></h3>
        <p><%=Html.Encode(Model.Description)%></p>
    <p><%=Html.Encode(Model.Abstract)%></p>
  </div>
</div>
