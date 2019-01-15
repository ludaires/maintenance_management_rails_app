class InspectionsController < ApplicationController


    def new
        @maintenance = Maintenance.find_by(params[:maintenance_id])
        @inspection = @maintenance.inspections.build
    end

    def create
        @maintenance = Maintenance.find_by(params[:maintenance_id])
        @inspection = @maintenance.inspections.create(inspections_params)
       
        redirect_to maintenance_inspection_path(@inspection.maintenance, @inspection)
    end

    def show
        @maintenance = Maintenance.find_by(id: params[:maintenance_id])
        @inspection = Inspection.find_by(id: params[:id])
    end
    
    def edit
        @maintenance = Maintenance.find_by(id: params[:maintenance_id])
        @inspection = @maintenance.inspections.find_by(id: params[:id])
    end

    def update
        @maintenance = Maintenance.find_by(id: params[:maintenance_id])
        @inspection = @maintenance.inspections.find_by(id: params[:id])
        @inspection.update(inspections_params)
        redirect_to maintenance_path(@maintenance)
    end

    private

        def inspections_params
            params.require(:inspection).permit(:part_id, :issue_id, :cause_id, :action_id)
        end



end