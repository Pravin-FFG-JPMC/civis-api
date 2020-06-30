class Organisation::SettingsController < ApplicationController
	layout "organisation_sidenav"
  before_action :authenticate_user!
	before_action :set_organisation, only: [:edit, :update, :show, :publish, :reject, :destroy, :featured, :unfeatured, :check_active_ministry, :edit_hindi_summary]
	before_action :require_organisation_employee, only: [:index, :update, :edit, :show, :create]

	def index
    # @consultations = Consultation.all.includes(:ministry, :created_by).order(created_at: :desc).filter_by(params[:page], filter_params.to_h, sort_params.to_h)
    respond_to do |format|
      if request.xhr?
        format.html {render partial: "admin/consultations/table", locals: {consultations: @consultations}}
      else
        format.html
      end
    end
	end

	def show
		
	end

  def edit

  end

	def update
		if @organisation.update(secure_params)
			redirect_to organisation_setting_path(@organisation), flash_success_info: "Organisation details was successfully updated."
		else
			redirect_back fallback_location: root_path, flash_info: "Organisation details was not successfully updated."
		end
	end

	def new
    
  end

  def create
    
  end

	def destroy
		
	end

	private

	def secure_params
		params.require(:organisation).permit(:name, :logo)
	end

	def set_organisation
		@organisation = Organisation.find(params[:id])
		session[:organisation_id] = @organisation.id
	end

  def sort_params
    params.require(:sort).permit(:sort_column, :sort_direction) if params[:sort]
  end

  def filter_params
    params.require(:filters).permit(:search_query, :status_filter, :visibility_filter) if params[:filters]
  end
end
