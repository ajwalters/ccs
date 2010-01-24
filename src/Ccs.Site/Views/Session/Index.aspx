<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Ccs.Site.Models.Session>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <div class="article_wrapper">
		<h2>Sessions</h2>
		<table>
        <tr>
            <th>
                Name
            </th>
            <th>
                Speaker
            </th>
            <th>
                Abstract
            </th>
            <th>
                Description
            </th>
            <th></th>
        </tr>
    <% foreach (var item in Model) { %>
        <tr>
            <td>
                <%= Html.Encode(item.Name) %>
            </td>
            <td>
                <%= Html.Encode(item.Speaker) %>
            </td>
            <td>
                <%= Html.Encode(item.Abstract) %>
            </td>
            <td>
                <%= Html.Encode(item.Description) %>
            </td>
            <td><!--
                <%= Html.ActionLink("Edit", "Edit", new { /* id=item.PrimaryKey */ }) %> |
                <%= Html.ActionLink("Details", "Details", new { /* id=item.PrimaryKey */ })%>
                -->
            </td>
        </tr>   
    <% } %>
    </table>
    <!--
    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>
    -->
</div>
</asp:Content>

