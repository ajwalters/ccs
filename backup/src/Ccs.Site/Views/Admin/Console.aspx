<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Console
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Administrator Console</h2>
    
    <div class="container span-6">
      <h4>Speaker</h4>
      <ul>
        <li><%= Html.ActionLink("View speakers.", "Index", "Speaker") %></li>
        <li><%= Html.ActionLink("Create new speaker.", "Create", "Speaker") %></li>
        <li><%= Html.ActionLink("Edit a speaker.", "Edit", "Speaker") %></li>
        <li><%= Html.ActionLink("Delete a speaker.", "Delete", "Speaker") %></li>
      </ul>
    </div>
    
    <div class="container span-6">
      <h4>Sessions</h4>
      <ul>
        <li><%= Html.ActionLink("View sessions.", "Index", "Session") %></li>
        <li><%= Html.ActionLink("Create new session.", "Create", "Session") %></li>
        <li><%= Html.ActionLink("Edit a session.", "Edit", "Session") %></li>
        <li><%= Html.ActionLink("Delete a session.", "Delete", "Session") %></li>
      </ul>
    </div>

</asp:Content>
