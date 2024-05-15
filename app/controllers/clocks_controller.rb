class ClocksController < ApplicationController
  before_action :set_clock, only: %i[ show update destroy ]
  before_action :authenticate_user!

  # GET /clocks
  def index
    @clocks = Clock.all

    render json: @clocks
  end

  # GET /clocks/1
  def show
    render json: @clock
  end

  # POST /clocks
  def create
    @clock = Clock.new(clock_params)
	@clock.user_id = current_user.id
	@clock.save

    if @clock.save
      render json: @clock, status: :created, location: @clock
    else
      render json: @clock.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clocks/1
  def update
    if @clock.user_id == current_user.id and @clock.update(clock_params)
      render json: @clock
    else
      render json: @clock.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clocks/1
  def destroy
	if @clock.user_id == current_user.id
		@clock.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clock
      @clock = Clock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def clock_params
      params.require(:clock).permit(:name, :desc, :category, :price, :photo_url)
    end
end
