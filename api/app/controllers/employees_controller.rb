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
      params.require(:employee).permit(
        :name, :position, :department,
        :first_name, :birth_date, :gender, :nationality, :social_number,
        :personal_address, :personal_phone, :personal_email, :emergency_contact,
        :rib, :manager, :hire_date, :contract_type, :status, :location,
        :salary, :payment_frequency, :benefits,
        :performance_reviews, :goals, :feedback,
        :education, :trainings, :skills, :past_experience,
        :payroll_documents, :leave_balance, :leave_taken, :leave_requests, :absences,
        :tax_id, :diversity_info, :system_access_log, :permissions, :gdpr_compliance
      )
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