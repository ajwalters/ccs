<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Session>" %>
<%@ Import Namespace="Ccs.Domain"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Create Session
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  <% using (Html.BeginForm()) {%>

    <div class="editor-label"><%= Html.LabelFor(model => model.Name) %></div>
    <div class="editor-field">
      <%= Html.TextBoxFor(model => model.Name) %>
      <%= Html.ValidationMessageFor(model => model.Name) %>
    </div>

    <div class="editor-label"><%= Html.LabelFor(model => model.Abstract) %></div>
    <div class="editor-field">
      <%= Html.TextBoxFor(model => model.Abstract) %>
      <%= Html.ValidationMessageFor(model => model.Abstract) %>
    </div>

    <p><input type="submit" value="Create" /></p>

  <% } %>

  <div><%=Html.ActionLink("Back to List", "Index") %></div>

</asp:Content>

