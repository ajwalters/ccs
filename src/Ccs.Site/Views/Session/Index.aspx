<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Ccs.Site.Models.Session>>" %>
<%@ Import Namespace="Ccs.Site.Models"%>

<asp:Content ID="SessionTitle" ContentPlaceHolderID="TitleContent" runat="server">Sessions</asp:Content>
<asp:Content ID="SessionContent" ContentPlaceHolderID="MainContent" runat="server">
  <h2>Sessions</h2>
  <% foreach (var item in Model) { %>
  <div class="container" style="bor">
    <h2><%= Html.ActionLink(item.Name, "Details", "Session", new{id=item.Name})%></h2>
    <h3><%= Html.ActionLink(item.Speaker, "Details", "Speaker", null, new{id=Html.Encode(item.Speaker)})%></h3>
    <p><%= Html.Encode(item.Abstract) %></p>
    <% if(Page.User.IsInRole(Role.Administrators)) { %>
      <%= Html.ActionLink("Create New Session", "Create", "Session") %>
    <% } %>
  </div>
  <% } %>
</asp:Content>

