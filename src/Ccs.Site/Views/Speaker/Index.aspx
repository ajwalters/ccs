<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Ccs.Site.Models.Speaker>>" %>

<asp:Content ID="SpeakerTitle" ContentPlaceHolderID="TitleContent" runat="server">Speakers</asp:Content>

<asp:Content ID="SpeakerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Speakers</h2>
    <% foreach (var item in Model) { %>
        <% Html.RenderPartial("Profile", item); %>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

