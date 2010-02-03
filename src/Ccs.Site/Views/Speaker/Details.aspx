<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Speaker>" %>
<%@ Import Namespace="Ccs.Domain"%>
<%@ Import Namespace="Ccs.Models"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Speaker Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <% Html.RenderPartial("Profile", Model);%>
</asp:Content>

