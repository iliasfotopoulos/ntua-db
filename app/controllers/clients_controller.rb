class ClientsController < ApplicationController
  def index
    @clients = Client.order("id")
  end

  def show
    @client = Client.find(params[:id])
    @reservations = @client.reservations
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to(clients_path)
    else
      render('new')
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])

    if @client.update_attributes(client_params)
      redirect_to(client_path(@client.id))
    else
      render('edit')
    end
  end

  def delete
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to(clients_path)
  end

  private

  def client_params
      params.require(:client).permit(:identity, :first_name, :last_name, :city, :street, :street_number, :zip_code, :credit_card_number)
  end

end
