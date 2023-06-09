class MatesController < ApplicationController
  before_action :set_mate, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /mates or /mates.json
  def index
    @mates = Mate.all
  end

  # GET /mates/1 or /mates/1.json
  def show
  end

  # GET /mates/new
  def new
    # @mate = Mate.new
    @mate = current_user.mates.build
  end

  # GET /mates/1/edit
  def edit
  end

  # POST /mates or /mates.json
  def create
    # @mate = Mate.new(mate_params)
    @mate = current_user.mates.build(mate_params)

    respond_to do |format|
      if @mate.save
        format.html { redirect_to mate_url(@mate), notice: "Mate was successfully created." }
        format.json { render :show, status: :created, location: @mate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mates/1 or /mates/1.json
  def update
    respond_to do |format|
      if @mate.update(mate_params)
        format.html { redirect_to mate_url(@mate), notice: "Mate was successfully updated." }
        format.json { render :show, status: :ok, location: @mate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mates/1 or /mates/1.json
  def destroy
    @mate.destroy

    respond_to do |format|
      format.html { redirect_to mates_url, notice: "Mate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @mate = current_user.mates.find_by(id: params[:id])
    redirect_to mates_path, notice: "Not authorized to edit this friend" if @mate.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mate
      @mate = Mate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mate_params
      params.require(:mate).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id)
    end
end
