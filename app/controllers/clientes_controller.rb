class ClientesController < ApplicationController
    before_action only: [:show,:create,:update,:destroy]

    def index
        clientes = Cliente.all
        render json: clientes
    end

    def show
        cliente = Cliente.find(params[:id])
        render json: cliente
    end

    def create
        cliente = Cliente.new(cliente_params)
        if cliente.save
          render json: cliente, status: :created
        else
          render_error(cliente, :unprocessable_entity)
        end
    end

    
    def update
        cliente = Cliente.find(params[:id])
        if cliente.update(cliente_params)
            render json: cliente, status: :ok
        else
            render json: cliente.errors, status: :unprocessable_entity
        end
    end

    
    def destroy
        cliente = Cliente.find(params[:id])
        cliente.destroy
        clientes = Cliente.all
        render json: clientes
    end

    def cliente_params
        params.require(:cliente).permit(:rfc, :nombre_cliente)
    end

    private
    def render_error(resource, status)
        render json: resource, status: status, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
    end
end
