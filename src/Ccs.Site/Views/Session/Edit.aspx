<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Ccs.Site.Models.Session>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Edit Session
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <h2>Edit Session</h2>
  <% using (Html.BeginForm()) {%>
  <fieldset>
    <%= Html.HiddenFor(model => model.Id) %>
    <legend>Edit Session</legend>
    <div>
      <%= Html.LabelFor(model => model.Name) %>
    </div>
    <div class="editor-field">
      <%= Html.TextBoxFor(model => model.Name) %>
      <%= Html.ValidationMessageFor(model => model.Name) %>
    </div>
    <div class="editor-label">
    <%= Html.LabelFor(model => model.Abstract) %>
    </div>
    <div class="editor-field">
      <%= Html.TextBoxFor(model => model.Abstract) %>
      <%= Html.ValidationMessageFor(model => model.Abstract) %>
    </div>
    <p><input type="submit" value="Save" /></p>
  </fieldset>
  <% } %>
  <div>
  <%=Html.ActionLink("Back to Sessions.", "Index") %>
  </div>
</asp:Content>

