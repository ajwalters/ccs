<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div class="container span-24 last" style="text-align: center; background-color: #CFB9A8; padding-top: 1px; padding-bottom: 1px;">
  <div class="prepend-5 span-2 colborder" style="text-align: center;"><%=Html.ActionLink("Home", "Index", "Home")%></div>
  <div class="span-2 colborder" style="text-align: center;"><%=Html.ActionLink("Sessions", "Index", "Session")%></div>
  <div class="span-2 colborder" style="text-align: center;"><%=Html.ActionLink("Agenda", "Agenda", "Session")%></div>
  <div class="span-2 colborder" style="text-align: center;"><%=Html.ActionLink("Speakers", "Index", "Speaker")%></div>
  <div class="span-2 last" style="text-align: center;"><%=Html.ActionLink("Contact", "Contact", "Home")%></div>
</div>