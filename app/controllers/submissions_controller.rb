class SubmissionsController < ApplicationController

  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :authorize, :only => [:edit, :update, :destroy]


  # GET /submissions
  # GET /submissions.xml
  def index
    @submissions = Submission.all

    respond_to do |format|
      format.html # index.html.haml
      format.xml  { render :xml => @submissions }
    end
  end

  # GET /submissions/1
  # GET /submissions/1.xml
  def show
    @submission = Submission.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.xml  { render :xml => @submission }
    end
  end

  # GET /submissions/new
  # GET /submissions/new.xml
  def new
    @submission = Submission.new

    respond_to do |format|
      format.html # new.html.haml
      format.xml  { render :xml => @submission }
    end
  end

  # GET /submissions/1/edit
  def edit
    @submission = Submission.find(params[:id])
  end

  # POST /submissions
  # POST /submissions.xml
  def create
    @submission = Submission.new(params[:submission])

    respond_to do |format|
      if @submission.save
        flash[:notice] = 'Submission was successfully created.'
        format.html { redirect_to(@submission) }
        format.xml  { render :xml => @submission, :status => :created, :location => @submission }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @submission.errors, :status => :unprocessable_entity }
      end
    end
  end

  def accept
    @submission = Submission.find(params[:id])
    logger.info "Accepted #{@submission}"
  end

  # PUT /submissions/1
  # PUT /submissions/1.xml
  def update
    @submission = Submission.find(params[:id])

    respond_to do |format|
      if @submission.update_attributes(params[:submission])
        flash[:notice] = 'Submission was successfully updated.'
        format.html { redirect_to(@submission) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @submission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.xml
  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy

    respond_to do |format|
      format.html { redirect_to(submissions_url) }
      format.xml  { head :ok }
    end
  end

  private
  def authorize
    puts "try to authorize the current user #{user}"
  end
end
