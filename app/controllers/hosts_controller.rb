class HostsController < ApplicationController
  before_action :set_host, only: [:show, :update, :destroy]
  before_action :authorized

  # GET /hosts
  def index
    @hosts = Host.where user: @user.id

    render json: @hosts
  end

  # GET /hosts/1
  def show
    render json: @host
  end

  # POST /hosts
  def create
    @host = Host.new(host_params)
    @host.user = @user

    if @host.save
      render json: @host, status: :created, location: @host
    else
      render json: @host.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hosts/1
  def update
    if @host.update(host_params)
      render json: @host
    else
      render json: @host.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hosts/1
  def destroy
    @host.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_host
      @host = Host.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def host_params
      params.require(:host).permit(:name, :zipcode, :rate, :animals, :walker, :host, :grooming, :travel, :user_id)
    end
end
