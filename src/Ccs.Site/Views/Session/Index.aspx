<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Ccs.Site.Models.Session>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Sessions Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  
		<h2>Sessions</h2>
    <% foreach (var item in Model) { %>
<div class="container">
    <h2><%= Html.ActionLink(item.Name, "Details", "Session", new{id=item.Name})%></h2>
    <h3><%= Html.ActionLink(item.Speaker, "Details", "Speaker", new{id=item.Speaker})%></h3>
    <p>
        <%= Html.Encode(item.Abstract) %>
    </p>
    <div>
    <!--
        <%= Html.ActionLink("Edit", "Edit", new { /* id=item.PrimaryKey */ }) %> |
        <%= Html.ActionLink("Details", "Details", new { /* id=item.PrimaryKey */ })%>
        -->
    </div>

    <% } %>
    <!--
    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>
    -->
</div>
</asp:Content>

