<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:content ID="indexLeft" ContentPlaceHolderID="LeftContent" runat="server">
  <h3 class="leftbox">Products</h3>
  <ul class="leftbox borderedlist">
	  <li><a href="#" title="Garden Tools">Garden Tools</a></li>
	  <li><a href="#" title="Organic Foods">Organic Foods</a></li>
	  <li><a href="#" title="Planter Boxes">Planter Boxes</a></li>
	  <li><a href="#" title="Landscape Services">Landscape Services</a></li>
	  <li><a href="#" title="Help Hotline">Help Hotline</a></li>
	  <li><a href="#" title="Weekly Specials">Weekly Specials</a></li>
  </ul>
  <h3 class="leftbox header_small">Features</h3>
  <div class="leftbox features">
	  <p>This week we have our one of a kind sale. Pick your one of a kind plant from our great selection and combine that with a planter box for $5.99.</p>
	  <p>Native plant seeds on sale!</p>
  </div>
  <hr />
</asp:Content>

<asp:content id="indexRight" contentplaceholderid="RightContent" runat="server">
  <div class="rightbox_wrapper">
	  <div class="rightbox">
		  <img src="../../Content/Images/product.jpg" alt="Image:product" class="product_image" />
		  <div class="product_wrapper">
			  <h4>Product Sales</h4>
			  <p>Lorem ipsum dolor sit amet, consecing elit, sed diam nonummy nibh dunt ut laoreet dolore magna aliqupat. Ut wisi enim ad minim veniam,  exerci tation ullamcorper s... <a href="#" title="Read More">more</a></p>
		  </div>
	  </div>
  </div>
  <div class="rightbox_wrapper">
	  <div class="rightbox">
		  <img src="../../Content/Images/product.jpg" alt="Image:product" class="product_image" />
		  <div class="product_wrapper">
			  <h4>Product Sales</h4>
			  <p>Lorem ipsum dolor sit amet, consecing elit, sed diam nonummy nibh dunt ut laoreet dolore magna aliqupat. Ut wisi enim ad minim veniam,  exerci tation ullamcorper s... <a href="#" title="Read More">more</a></p>
		  </div>
	  </div>
  </div>
  <div class="rightbox_wrapper lastbox">
	  <div class="rightbox">
		  <img src="../../Content/Images/product.jpg" alt="Image:product" class="product_image" />
		  <div class="product_wrapper">
			  <h4>Product Sales</h4>
			  <p>Lorem ipsum dolor sit amet, consecing elit, sed diam nonummy nibh dunt ut laoreet dolore magna aliqupat. Ut wisi enim ad minim veniam,  exerci tation ullamcorper s... <a href="#" title="Read More">more</a></p>
		  </div>
	  </div>
  </div>
  <hr />
</asp:content>

<asp:Content ID="indexCenter" ContentPlaceHolderID="CenterContent" runat="server">
	<div class="article_wrapper">
		<h2>Weekly News Updates</h2>
		<p>Lorem ipsum dolor sit amet, consectetuer adipis cing elit, sed diam nonummy nibh euismod tinci dunt ut laorenim ad minim veniam, quis nostrud exerci tation ullam corper suscipit lobortis nisl ut aliq eet dolore magna aliquam erat volut pat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet.</p>
	</div>
	<div class="article_wrapper">
		<h2>Current Employment News</h2>
		<p>Lorem ipsum dolor sit amet, consectetuer adipis cing elit, sed diam nonummy nibh euismod tinci dunt ut laorenim ad minim veniam, quis nostrud exerci tation ullam corper suscipit lobortis nisl ut aliq eet dolore magna aliquam erat volut pat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetuer adipis cing elit.</p>
	</div>
	<hr />
</asp:Content>
