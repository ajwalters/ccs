<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Ccs.Site.Models.Session>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Name) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Name) %>
                <%= Html.ValidationMessageFor(model => model.Name) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Speaker) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Speaker) %>
                <%= Html.ValidationMessageFor(model => model.Speaker) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Abstract) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Abstract) %>
                <%= Html.ValidationMessageFor(model => model.Abstract) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Description) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Description) %>
                <%= Html.ValidationMessageFor(model => model.Description) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Room) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Room) %>
                <%= Html.ValidationMessageFor(model => model.Room) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Start) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Start) %>
                <%= Html.ValidationMessageFor(model => model.Start) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.End) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.End) %>
                <%= Html.ValidationMessageFor(model => model.End) %>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

