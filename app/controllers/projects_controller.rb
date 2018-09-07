class ProjectsController < ApplicationController
    before_action :find_project, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    

    def index
        @projects = Project.all.order("created_at desc")
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)

        if @project.save
            redirect_to @project, notice: "Saved Succesfully"
        else

            Please choose an image that's at least 400 pixels wide and at least 150 pixels tall.
            render 'new'
        end
    end

    def show
    end
    
    def edit
    end

    def update
        if @project.update project_params
            redirect_to @project, notice: "Project Successfully Updated $$$"
        else
            render 'edit'
        end
    end

    def destroy
        @project.destroy
        redirect_to projects_path
    end

    def delete_image_attachment
        @image = Project.last.images
        @image.purge
        redirect_back(fallback_location: projects_path)
    end

    private

    def find_project
        @project = Project.friendly.find(params[:id])
    end

    def project_params
        params.require(:project).permit(:title, :description, :link, images: [])
    end   
end

