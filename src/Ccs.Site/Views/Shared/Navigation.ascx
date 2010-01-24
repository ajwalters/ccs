<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div class="span-24 last">
  <div class="span-2 colborder" style="text-align: center;"><%= Html.ActionLink("Home","Index", "Home") %></div>
  <div class="span-2 colborder" style="text-align: center;"><%= Html.ActionLink("Sessions","Index", "Session") %></div>
  <div class="span-2 colborder" style="text-align: center;"><%= Html.ActionLink("Agenda","Agenda", "Session") %></div>
  <div class="span-2 last" style="text-align: center;"><%= Html.ActionLink("Contact","Contact", "Home") %></div>
</div>
