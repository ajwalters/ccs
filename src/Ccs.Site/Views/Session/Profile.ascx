<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Ccs.Site.Models.Session>" %>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">Name</div>
        <div class="display-field"><%= Html.Encode(Model.Name) %></div>
        
        <div class="display-label">Speaker</div>
        <div class="display-field"><%= Html.Encode(Model.Speaker) %></div>
        
        <div class="display-label">Abstract</div>
        <div class="display-field"><%= Html.Encode(Model.Abstract) %></div>
        
        <div class="display-label">Description</div>
        <div class="display-field"><%= Html.Encode(Model.Description) %></div>
        
        <div class="display-label">Room</div>
        <div class="display-field"><%= Html.Encode(Model.Room) %></div>
        
        <div class="display-label">Start</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.Start)) %></div>
        
        <div class="display-label">End</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.End)) %></div>
        
    </fieldset>
    <p>
        <%=Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
        <%=Html.ActionLink("Back to List", "Index") %>
    </p>


