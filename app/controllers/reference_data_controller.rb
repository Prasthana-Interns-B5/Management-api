class ReferenceDataController < ApplicationController
  def index
    roles = ReferenceDatum.where(data_type: 'role')
    render json: roles
  end

  def create
    role = ReferenceDatum.new(role_params)
    if role.save
      render json: { message: 'Role created', data: role }, status: 201
    else
      render json: { message: 'Role Cannot be created', error: role.errors.full_messages }
    end
  end

      private
  def role_params
    params.require(:reference_data).permit(:data_type, :key, :label)
  end
end
