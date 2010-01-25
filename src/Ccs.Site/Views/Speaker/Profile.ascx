<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Ccs.Site.Models.Speaker>" %>

<div class="container">
<div class="span-3"><img src="../../Content/Images/Speakers/<%= Model.ImageName %>" style="width: 100%;" /></div>
<div class="span=7">
  <h3><%= Html.Encode(Model.Name) %></h3>
  <p><%= Html.Encode(Model.Biography) %></p>
      <p>
        <%=Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
        <%=Html.ActionLink("Back to List", "Index") %>
    </p>

</div>
</div>


