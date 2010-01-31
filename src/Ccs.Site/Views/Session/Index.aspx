<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Ccs.Site.Models.Session>>" %>
<%@ Import Namespace="Ccs.Site.Models"%>

<asp:Content ID="SessionTitle" ContentPlaceHolderID="TitleContent" runat="server">Sessions</asp:Content>

<asp:Content ID="SessionContent" ContentPlaceHolderID="MainContent" runat="server">
  <h2 class="span-6">Sessions</h2>
  <div class="span-10 last" style="text-align: right;"><% if(Page.User.IsInRole(Role.Administrators)) { %><%= Html.ActionLink("CREATE NEW Session.", "Create") %><% } %></div>
  <div class="container span-17">
  <% foreach (var item in Model) { %>
  <% Html.RenderPartial("Profile", item); %>
  <% } %>
  </div>
</table>
</asp:Content>