class MediaController < ApplicationController
  before_action :set_medium, only: %i[ show edit update destroy ]

  # GET /media or /media.json
  def index
    @media = Medium.all
  end

  # GET /media/1 or /media/1.json
  def show
  end

  # GET /media/new
  def new
    # @medium = Medium.new
    @medium = current_user.media.build
  end

  # GET /media/1/edit
  def edit
  end

  # POST /media or /media.json
  def create
    # @medium = Medium.new(medium_params)
    @medium = current_user.media.build(medium_params)

    respond_to do |format|
      if @medium.save
        format.html { redirect_to medium_url(@medium), notice: "Medium was successfully created." }
        format.json { render :show, status: :created, location: @medium }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media/1 or /media/1.json
  def update
    respond_to do |format|
      if @medium.update(medium_params)
        format.html { redirect_to medium_url(@medium), notice: "Medium was successfully updated." }
        format.json { render :show, status: :ok, location: @medium }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media/1 or /media/1.json
  def destroy
    @medium.destroy

    respond_to do |format|
      format.html { redirect_to media_url, notice: "Medium was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @media = current_user.media.find_by(id: params[:id])
    redirect_to media_path, notice: "Not Authorized To Edit This Media" if @media.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medium
      @medium = Medium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def medium_params
      params.require(:medium).permit(:title, :rating, :date_completed, :media_type, :first_time, :img_URL, :user_id)
    end
end
