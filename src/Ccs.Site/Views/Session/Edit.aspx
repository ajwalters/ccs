<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Session>" %>
<%@ Import Namespace="Ccs.Models"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Update Session
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  <% using (Html.BeginForm()) {%>

  <%= Html.HiddenFor(model => model.Key) %>
  <legend>Edit Session</legend>
  <div><%= Html.LabelFor(model => model.Name) %></div>
  <div class="editor-field">
    <%= Html.TextBoxFor(model => model.Name) %>
    <%= Html.ValidationMessageFor(model => model.Name) %>
  </div>
  <div class="editor-label"><%= Html.LabelFor(model => model.Abstract) %></div>
  <div class="editor-field">
    <%= Html.TextBoxFor(model => model.Abstract) %>
    <%= Html.ValidationMessageFor(model => model.Abstract) %>
  </div>
  <p><input type="submit" value="Update Session" /></p>
  </fieldset>
  <% } %>
  <div><%=Html.ActionLink("Back to Sessions.", "Index") %></div>
</asp:Content>

