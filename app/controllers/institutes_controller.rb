class InstitutesController < ApplicationController
  before_action :set_institute, only: [:show, :edit, :update, :destroy]

  # GET /institutes
  # GET /institutes.json
  def index
    @institutes = Institute.all
  end

  # GET /institutes/1
  # GET /institutes/1.json
  def show
   # @institute = Institute.new
    #@institutes = Institute.all
    #@institute = institute.find(params[:id])
    # @departments = Department.all
    #@department = department.find(params[:id])
  end

  # GET /institutes/new
  def new
    @institute = Institute.new
  end

  # GET /institutes/1/edit
  def edit
  end

  # POST /institutes
  # POST /institutes.json
  def create
    @institute = Institute.new(institute_params)

    respond_to do |format|
      if @institute.save
        format.html { redirect_to @institute, notice: 'Instituto criado com sucesso.' }
        format.json { render :show, status: :created, location: @institute }
      else
        format.html { render :new }
        format.json { render json: @institute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /institutes/1
  # PATCH/PUT /institutes/1.json
  def update
    respond_to do |format|
      if @institute.update(institute_params)
        format.html { redirect_to @institute, notice: 'Instituto editado com sucesso.' }
        format.json { render :show, status: :ok, location: @institute }
      else
        format.html { render :edit }
        format.json { render json: @institute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /institutes/1
  # DELETE /institutes/1.json
  def destroy
    @institute.destroy
    respond_to do |format|
      format.html { redirect_to institutes_url, notice: 'Instituto destruído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_institute
      @institute = Institute.find(params[:id])
      @departments = @institute.departments.all
      @department = @institute.departments.build
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def institute_params
      params.require(:institute).permit(:name, :description, :picture)
    end
end
