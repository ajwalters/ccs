<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Ccs.Site.Models.Speaker>" %>
<%@ Import Namespace="Ccs.Site.Models"%>

<div class="container span-17">
  <div class="span-3"><img src="../../Content/Images/Speakers/<%= Model.ImageName %>" style="width: 100%;" /></div>
  <% if(Page.User.IsInRole(Role.Administrators)) { %>
  <div class="span=7 last">
    <%= Html.ActionLink("EDIT", "Edit", new {id=Html.Encode(Model.Id)})%> | 
    <%= Html.ActionLink("DELETE", "Delete", new {id=Html.Encode(Model.Id)})%>
  </div>
  <% } %>
  <div class="span-7 last">
    <h3><%= Html.Encode(Model.Name) %></h3>
    <p><%= Html.Encode(Model.Biography) %></p>
  </div>
</div>