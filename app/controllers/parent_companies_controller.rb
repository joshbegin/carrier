class ParentCompaniesController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user, only: [:new, :edit, :create, :update, :destroy]
  # GET /parent_companies
  # GET /parent_companies.json
  def index
    @parent_companies = ParentCompany.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @parent_companies }
    end
  end

  # GET /parent_companies/1
  # GET /parent_companies/1.json
  def show
    @parent_company = ParentCompany.find(params[:id])
    @companies = Company.where(:parent_company_id => @parent_company.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @parent_company }
    end
  end

  # GET /parent_companies/new
  # GET /parent_companies/new.json
  def new
    @parent_company = ParentCompany.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @parent_company }
    end
  end

  # GET /parent_companies/1/edit
  def edit
    @parent_company = ParentCompany.find(params[:id])
  end

  # POST /parent_companies
  # POST /parent_companies.json
  def create
    @parent_company = ParentCompany.new(params[:parent_company])

    respond_to do |format|
      if @parent_company.save
        format.html { redirect_to @parent_company, notice: 'Parent company was successfully created.' }
        format.json { render json: @parent_company, status: :created, location: @parent_company }
      else
        format.html { render action: "new" }
        format.json { render json: @parent_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /parent_companies/1
  # PUT /parent_companies/1.json
  def update
    @parent_company = ParentCompany.find(params[:id])

    respond_to do |format|
      if @parent_company.update_attributes(params[:parent_company])
        format.html { redirect_to @parent_company, notice: 'Parent company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @parent_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parent_companies/1
  # DELETE /parent_companies/1.json
  def destroy
    @parent_company = ParentCompany.find(params[:id])
    @parent_company.destroy

    respond_to do |format|
      format.html { redirect_to parent_companies_url }
      format.json { head :no_content }
    end
  end
end
