class AvisosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_aviso, only: [:show, :edit, :update, :destroy]
  before_action :set_user_id, only: [:new, :create, :edit, :update, :destroy]


  # GET /avisos
  # GET /avisos.json
  def index
    @avisos = Aviso.page(params[:page])
  end

  # GET /avisos/1
  # GET /avisos/1.json
  def show
    @communicate = Communicate.new
  end

  # GET /avisos/new
  def new
    @aviso = Aviso.new
  end

  # GET /avisos/1/edit
  def edit
  end

  # POST /avisos
  # POST /avisos.json
  def create
    @aviso = Aviso.new(aviso_params)

    respond_to do |format|
      if @aviso.save
        # Ensure relation for user
        @aviso.user_id = current_user.id
        @aviso.save

        #format.html { redirect_to @aviso, notice: 'Aviso was successfully created.' }
        format.html { redirect_to @aviso, notice: 'Aviso was successfully created.' }
        format.json { render :show, status: :created, location: @aviso }
      else
        format.html { render :new }
        format.json { render json: @aviso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avisos/1
  # PATCH/PUT /avisos/1.json
  def update
    respond_to do |format|
      if @aviso.update(aviso_params)
        format.html { redirect_to @aviso, notice: 'Aviso was successfully updated.' }
        format.json { render :show, status: :ok, location: @aviso }
      else
        format.html { render :edit }
        format.json { render json: @aviso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avisos/1
  # DELETE /avisos/1.json
  def destroy
    @aviso.destroy
    respond_to do |format|
      format.html { redirect_to avisos_url, notice: 'Aviso was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aviso
      @aviso = Aviso.find(params[:id])
    end

    def set_user_id
      @user_id = current_user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aviso_params
      params.require(:aviso).permit(:title, :description, :user_id, :category_id, :photo)
    end
end
