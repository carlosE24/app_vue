class OrdensController < ApplicationController
    before_action only: [:show,:create,:update,:destroy]

    def index
        ordens = Orden.all
        render json: ordens
    end

    def show
        orden = Orden.find(params[:id])
        render json: orden
    end

    def create
        orden = Orden.new(orden_params)
        if orden.save
            render json: orden, status: :created
        else
            render_error(orden, :unprocessable_entity)
        end
    end

    def update
        orden = Orden.find(params[:id])
        if orden.update(orden_params)
            render json: orden, status: :ok
        else
            render json: orden.errors, status: :unprocessable_entity
        end
    end

    def destroy
        orden = Orden.find(params[:id])
        orden.destroy
        ordens = Orden.all
        render json: ordens
    end

    private
    def render_error(resource, status)
        render json: resource, status: status, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
    end

    def orden_params
        params.require(:orden).permit(:cliente_id, :fecha)
    end
end
