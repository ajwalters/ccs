<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<SpeakerViewModel>>" %>
<%@ Import Namespace="Ccs.Models"%>
<%@ Import Namespace="Ccs.Security.Models"%>



<asp:Content ID="SpeakerTitle" ContentPlaceHolderID="TitleContent" runat="server">Speakers</asp:Content>

<asp:Content ID="SpeakerContent" ContentPlaceHolderID="MainContent" runat="server">
  <h2 class="span-6">Speakers</h2>
  <div class="span-10 last" style="text-align: right;"><% if(Page.User.IsInRole(Role.Administrators)) { %><%= Html.ActionLink("CREATE NEW SPEAKER.", "Create") %><% } %></div>
  <div class="container span-17">
<%
  if (0==Model.Count())
  {
    Response.Output.WriteLine("<h2>No speakers have been registered yet.</h2>");
  }
  else
  {
    foreach (var item in Model)
    {
      Html.RenderPartial("Profile", item);
    }
    
    
  }
%>

  </div>
</table>
</asp:Content>

