class HomeController < ApplicationController
  def index
    @contents = Content.find(:all, :order => "sequence")

    respond_to do |format|
      format.html # index.html.haml
      format.xml  { render :xml => @contents }
    end
  end

  def directions
    respond_to do |format|
      format.html
    end
  end

  def info
    respond_to do |format|
      format.html
    end
  end
end
