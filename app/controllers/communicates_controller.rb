class CommunicatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_communicate, only: [:show]

  def new
    @communicate = Communicate.new
  end

  def create
    @communicate = Communicate.new(communicate_params)

    respond_to do |format|
      if @communicate.save
        format.js

        CommunicateMailer.send_aviso_message(@communicate).deliver_now
      else
        format.json { render json: @communicate.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_communicate
    @communicate = Communicate.find(params[:id])
  end

  def communicate_params
    params.require(:communicate).permit(:aviso_id, :sender_id, :publisher_id, :message)
  end
end
