class ProductosController < ApplicationController
    before_action  only: [:show,:create,:update,:destroy]
 
    # GET /productos    
    def index
        productos = Producto.all
        render json: productos
    end
    
    # GET /productos/1
    def show
        producto = Producto.find(params[:id])
        render json: producto
    end

    # POST /productos
    def create
        producto = Producto.new(producto_params)
        if producto.save
          render json: producto, status: :created
        else
          render_error(producto, :unprocessable_entity)
        end
    end

    def update
        producto = Producto.find(params[:id])
        if producto.update(producto_params)
            render json: producto, status: :ok
        else
            render json: producto.errors, status: :unprocessable_entity
        end
    end

    def destroy
        producto = Producto.find(params[:id])
        producto.destroy
        productos = Producto.all
        render json: productos
    end
    
    def producto_params
        params.require(:producto).permit(:nombre_producto,:precio)
    end
    
    private
    def render_error(resource, status)
        render json: resource, status: status, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
    end 
    
end
    
