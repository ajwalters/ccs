<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Speaker>" %>
<%@ Import Namespace="Ccs.Domain"%>
<%@ Import Namespace="Ccs.Models"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Edit Speaker
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <h2>Edit Speaker</h2>
  <% using (Html.BeginForm()) {%>
  <fieldset>
    <%= Html.HiddenFor(model => model.Key) %>
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

