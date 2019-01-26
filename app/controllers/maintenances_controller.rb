class MaintenancesController < ApplicationController
    before_action :redirect_if_not_logged_in!, only: [:new, :index, :show, :edit]
    before_action :set_maintenance, :redirect_if_not_authorized!, only: [:show, :edit, :update, :destroy]
    before_action :delete_inspections, only: [:destroy]

    def index
        @maintenances = Maintenance.all
    end

    def new
        @maintenance = Maintenance.new
        @inspection = @maintenance.inspections.build
        @user = current_user
    end

    def create
        @maintenance = current_user.maintenances.build(maintenance_params)
        if @maintenance.equipment.in_progress? 
            flash[:message] = "This equipment: #{@maintenance.equipment.name} has already an open maintenance. It needs to be closed first to open a new one."
            redirect_to user_path(current_user)
        elsif !@maintenance.equipment.in_progress?
            @maintenance.save
            if @maintenance.save
                redirect_to maintenance_path(@maintenance)
            end
        else
            flash[:message] = "Something went wrong."
            redirect_to new_maintenance_path
        end         
    end

    def show
       
    end

    def edit
        @inspection = @maintenance.inspections
    end 

    def update
        if @maintenance.update(maintenance_params)
            redirect_to maintenance_path(@maintenance)
        end
    end

    def destroy
        @maintenance.inspections.each { |i| i.delete }
        @maintenance.delete
        redirect_to user_path(current_user)
    end

    private

    def set_maintenance
        @maintenance = Maintenance.find_by(id: params[:id])
    end

    def maintenance_params
        params.require(:maintenance).permit(
            :user_id, 
            :equipment_id, 
            :status, 
            :next_maintenance_date,
            :notes,
            :maintenance_type,
            inspections_attributes: [
                :part_id,
                :issue_id,
                :cause_id,
                :action_id
            ]
        )
    end

    def redirect_if_not_authorized!
        if @maintenance.user != current_user && !current_user.admin
            flash[:message] = "You user don't have the permission to access this maintenance!"
            redirect_to user_path(current_user)
        end
    end

    def delete_inspections
        @maintenance.inspections.each do |i|
            i.delete
        end
    end
end