class MaintenancesController < ApplicationController
    before_action :set_maintenance, only: [:show, :edit, :update]


    def index
        @maintenances = Maintenance.all
    end

    def new
        # fake user until I create a user and session controller.
        @maintenance = Maintenance.new
        @inspection = @maintenance.inspections.build
        @user = User.first
    end

    def create
        @maintenance = Maintenance.create(maintenance_params)
        redirect_to maintenance_path(@maintenance)
    end

    def show
    end

    def edit
        @inspection = @maintenance.inspections
        @user = User.first
    end 

    def update
        if @maintenance.update(maintenance_params)
            redirect_to maintenance_path(@maintenance )
        else
            render :edit
        end
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

end
