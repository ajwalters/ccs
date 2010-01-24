<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<ul>
  <li><%= Html.ActionLink("Home","Index", "Home") %></li>
  <li><%= Html.ActionLink("Sessions","Index", "Session") %></li>
  <li><%= Html.ActionLink("Agenda","Agenda", "Session") %></li>
  <li><%= Html.ActionLink("Contact","Contact", "Home") %></li>
</ul>