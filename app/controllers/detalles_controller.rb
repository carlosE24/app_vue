class DetallesController < ApplicationController
    before_action only: [:show,:create,:update,:destroy]

    def index
        detalles = Detalle.all
        render json: detalles
    end

    def show
        detalle = Detalle.where("orden_id="+params[:id])
        render json: detalle
    end

    def create
        detalle = Detalle.new(detalle_params)
        if detalle.save
          render json: detalle, status: :created
        else
          render_error(detalle, :unprocessable_entity)
        end
    end

    
    def update
        detalle = Detalle.find(params[:id])
        if detalle.update(detalle_params)
            render json: detalle, status: :ok
        else
            render json: detalle.errors, status: :unprocessable_entity
        end
    end

    
    def destroy
        detalle = Detalle.find(params[:id])
        detalle.destroy
        detalles = Detalle.all
        render json: detalles
    end

    def detalle_params
        params.require(:detalle).permit(:orden_id,:producto_id,:cantidad, :precio_venta)
    end

    private
    def render_error(resource, status)
        render json: resource, status: status, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
    end
end