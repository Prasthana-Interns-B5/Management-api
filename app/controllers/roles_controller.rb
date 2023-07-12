class RolesController < ApplicationController

    def index
        render json: Role.all
    end

    def show
        role =Role.find(params[:id])
        render json: r
    end

    def create
        role = Role.create(role_params)
        if role.save
            render json: role, status: 200
        else
            render json: {message: "Role Cannot be created", error: role.errors.full_messages}
        end
    end

    def update
        role = Role.find(params[:id])
        if role.update(role_params)
            render json: role, status: 200
        else
            render json: {message: "Role cannot be updated", error: role.errors.full_messages}
        end
    end

    def destroy
        role = Role.find(params[:id])
        role.destroy
        render json: {message: "Record Destroyed Successfully"}
      end

      private
      def role_params
        params.require(:role).permit(:role_name)
      end

end