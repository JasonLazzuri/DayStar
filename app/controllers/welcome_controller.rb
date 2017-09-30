class WelcomeController < ApplicationController

  def index
    @welcome = Welcome.new
  end

  def create
    @welcome = Welcome.new(welcome_params)
    respond_to do |format|
        if @welcome.save
          format.html { redirect_to '/', notice: 'Message was successfully saved.' }
          format.json { render :show, status: :created, location: @welcome }
        else
          format.html { render :new }
          binding.pry
          format.json { render json: @welcome.errors, status: :unprocessable_entity }
        end
      end
    end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_welcome
      @welcome = Welcome.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def welcome_params
      params.fetch(:welcome).permit(:name, :email, :phone, :message)
    end
end
