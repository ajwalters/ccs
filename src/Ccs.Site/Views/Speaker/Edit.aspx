<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Ccs.Site.Models.Speaker>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <h2>Edit Speaker</h2>
  <% using (Html.BeginForm()) {%>
  <fieldset>
    <legend>Edit Speaker</legend>
    <div>
      <%= Html.LabelFor(model => model.Name) %>
    </div>
    <div class="editor-field">
      <%= Html.TextBoxFor(model => model.Name) %>
      <%= Html.ValidationMessageFor(model => model.Name) %>
    </div>
    <div class="editor-label">
    <%= Html.LabelFor(model => model.Biography) %>
    </div>
    <div class="editor-field">
      <%= Html.TextBoxFor(model => model.Biography) %>
      <%= Html.ValidationMessageFor(model => model.Biography) %>
    </div>
    <p><input type="submit" value="Save" /></p>
  </fieldset>
  <% } %>
  <div>
  <%=Html.ActionLink("Back to Speakers.", "Index") %>
  </div>
</asp:Content>

