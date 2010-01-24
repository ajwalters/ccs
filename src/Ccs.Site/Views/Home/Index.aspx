<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="indexCenter" ContentPlaceHolderID="CenterContent" runat="server">
	<div class="article_wrapper">
		<h2>Chicago Code Camp 2</h2>
	  <p style="font-weight: bold;">Date: Spring/Summer 2010</p>		
		<p>We are hoping to get more than just the .Net community involved, we would love to get sessions from the Java, Ruby or anyone else.  We will be announcing more information in the coming weeks.</p>
		<h2>What is a CodeCamp?</h2>
		<p>Stealing from <a href="http://en.wikipedia.org/wiki/Code_Camp">Wikipedia:</a></p>
		<blockquote>
		  Like most unconferences, Code Camps are about your local or regional development community. Presenters are typically members of the community. Presentation topics are suggested by attendees, and often presented by those who originally suggest them.
		</blockquote> 
	</div>
</asp:Content>

<asp:content ID="indexLeft" ContentPlaceHolderID="LeftContent" runat="server"/>

<asp:content id="indexRight" contentplaceholderid="RightContent" runat="server"/>

