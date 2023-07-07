class EmployeeRolesController < ApplicationController
    def index
        render json: EmployeeRole.all, status: 200
    end
    
    def show
        employee_role = EmployeeRole.find(params[:id])
        render json: employee_role, status: 200
    end
    
    def create
        employee_role = EmployeeRole.create(employee_params)
        if employee_role.save
            render json: employee_role, status: 200
        else
            render json: {message: "EmployeeRole Cannot be created", error: employee_role.errors.full_messages}
        end
    end

    def update
        employee_role = EmployeeRole.find(params[:id])
        if employee_role.update(employee_params)
            render json: employee_role, status: 200
        else
            render json: {message: "Employee Rolecannot be updated", error: employee_role.errors.full_messages}
        end
    end

    def destroy
        employee_role = EmployeeRole.find(params[:id])
        employee_role.destroy
        render json: {message: "Record Destroyed Successfully"}
    end

    private
    def employee_params
        params.require(:employee_role).permit(:employee_id,:role_id,:assigned_to,:role_name)
    end
end
