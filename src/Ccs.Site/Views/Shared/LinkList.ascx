<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Links>" %>
<%@ Import Namespace="Ccs.Site.Models"%>

    <ul>
        
        
        
        <%=Html.Encode(Model.Name)%>
        
        <%
          foreach (var item in Model.Items)
          {%>
            <li><a href="<%=Html.Encode(item.Href)%>"><%=Html.Encode(item.Text)%></a></li>
        <%
          }%>
        
    </ul>
    <% if(Page.User.IsInRole(Role.Administrators)) { %>
        <%=Html.ActionLink("EDIT", "Edit", new {id=Model.Id})%> |
    <%
          }%>


