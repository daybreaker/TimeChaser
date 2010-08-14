class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.xml
  def index
    params[:choose_company] = params[:company_id]
    @company = Company.find(params[:company_id])
    @projects = @company.projects
    render :layout => false
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find(params[:id])
    @company = @project.company
    params[:choose_company] = @company.id 
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @company = Company.find(params[:company_id])
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    @company = @project.company
  end

  # POST /projects
  # POST /projects.xml
  def create
    @company = Company.find(params[:company_id])
    @project = Project.new(params[:project].merge(:company => @company))

    respond_to do |format|
      if @project.save
        format.html { redirect_to(([@company, @project]), :notice => 'Project was successfully created.') }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find(params[:id])
    @company = @project.company

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(([@company, @project]), :notice => 'Project was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end
end
