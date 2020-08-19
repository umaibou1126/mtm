class Api::V1::MenuController < ApplicationController
protect_from_forgery
before_action :set_menu, only: [:show, :update, :destroy]

rescue_from Exception, with: :render_status_500

rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
end

def index
menu = Menu.select(:id, :discipline, :rep, :set, :weight, :calorie)
render json: menu
end

def show
render json: @menu
end

def update
if @menu.update_attributes(menu_params)
    head :no_content
else
    render json: { errors: @menu.errors.full_messages }, status: :unprocessable_entity
end
end

def destroy
@menu.destroy!
head :no_content
end

def create
menu = Menu.new(menu_params)
if menu.save
    render json: menu, status: :created
else
    render json: { errors: menu.errors.full_messages }, status: :unprocessable_entity
end
end


private

def set_menu
@menu = Menu.find(params[:id])
end

        def menu_params
          params.fetch(:menu, {}).permit(:id, :discipline, :rep, :set, :weight, :calorie)
        end

        def render_status_404(exception)
          render json: { errors: [exception] }, status: 404
        end

        def render_status_500(exception)
          render json: { errors: [exception] }, status: 500
        end
      end
