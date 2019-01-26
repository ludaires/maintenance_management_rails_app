class InspectionsController < ApplicationController
    before_action :set_maintenance, only: [:new, :create, :show, :edit, :update, :destroy]

    def new
        @inspection = @maintenance.inspections.build
    end

    def create
        @inspection = @maintenance.inspections.create(inspections_params)
       
        redirect_to maintenance_inspection_path(@inspection.maintenance, @inspection)
    end

    def show
        @inspection = Inspection.find_by(id: params[:id])
    end
    
    def edit
        @inspection = @maintenance.inspections.find_by(id: params[:id])
    end

    def update
        @inspection = @maintenance.inspections.find_by(id: params[:id])
        @inspection.update(inspections_params)
        redirect_to maintenance_path(@maintenance)
    end

    def destroy
        @inspection = Inspection.find_by(id: params[:id])
        @inspection.delete
        redirect_to maintenance_path(@maintenance)
    end

    private
    def inspections_params
        params.require(:inspection).permit(:part_id, :issue_id, :cause_id, :action_id)
    end

    def set_maintenance
        @maintenance = Maintenance.find_by(id: params[:maintenance_id])
    end
end