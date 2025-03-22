class EmployeesController < ApplicationController
    before_action :authorize
  
    def index
      render json: @current_user.employees
    end

    def show
      employee = @current_user.employees.find(params[:id])
      render json: employee
    end
  
    def create
      employee = @current_user.employees.create(employee_params)
      render json: employee
    end
  
    def update
      employee = @current_user.employees.find(params[:id])
      employee.update(employee_params)
      render json: employee
    end
  
    def destroy
      unless @current_user.role == "admin"
        return render json: { error: "Non autorisé" }, status: :unauthorized
      end
    
      employee = @current_user.employees.find(params[:id])
      employee.destroy
      head :no_content
    end
    
  
    private
  
    def employee_params
      params.require(:employee).permit(:name, :position, :department)
    end
  
    def authorize
      header = request.headers['Authorization']
      token = header.split(' ').last if header
      begin
        decoded = JWT.decode(token, Rails.application.secret_key_base)[0]
        @current_user = User.find(decoded['user_id'])
      rescue
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end
  end