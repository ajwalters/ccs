<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Speaker>" %>
<%@ Import Namespace="Ccs.Domain"%>
<%@ Import Namespace="Ccs.Models"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Create Speaker
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  <h2>Create New Speaker</h2>

  <% using (Html.BeginForm()) {%>

  <fieldset>
    <div class="editor-label"><%= Html.LabelFor(model => model.Name) %></div>
    <div class="editor-field">
      <%= Html.TextBoxFor(model => model.Name) %>
      <%= Html.ValidationMessageFor(model => model.Name) %>
    </div>

    <div class="editor-label"><%= Html.LabelFor(model => model.Biography) %></div>
    <div class="editor-field">
    <%= Html.TextBoxFor(model => model.Biography) %>
    <%= Html.ValidationMessageFor(model => model.Biography) %>
    </div>
    
    <div class="editor-label"><%= Html.LabelFor(model => model.ImageName) %></div>
    <div class="editor-field">
    <%= Html.TextBoxFor(model => model.ImageName) %>
    <%= Html.ValidationMessageFor(model => model.ImageName) %>
    </div>

    <p><input type="submit" value="Create Speaker" /></p>
  </fieldset>

  <% } %>

  <div><%=Html.ActionLink("Back to List", "Index") %></div>

</asp:Content>

