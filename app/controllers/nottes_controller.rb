class NottesController < ApplicationController
  before_action :set_notte, only: [:show, :update, :destroy]

  # GET /nottes
  def index
    @nottes = Notte.where(user_id: @user.id)

    render json: @nottes
  end

  # GET /nottes/1
  def show
    render json: @notte
  end

  # POST /nottes
  def create
    @notte = Notte.new(notte_params)
    @notte.user_id = @user.id

    if @notte.save
      render json: @notte, status: :created, location: @notte
    else
      render json: @notte.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /nottes/1
  def update
    if @notte.update(notte_params)
      render json: @notte
    else
      render json: @notte.errors, status: :unprocessable_entity
    end
  end

  # DELETE /nottes/1
  def destroy
    @notte.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notte
      @notte = Notte.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notte_params
      params.require(:notte).permit(:title, :body, :user_id)
    end
end
