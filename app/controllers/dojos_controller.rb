class DojosController < ApplicationController
    def index
        @all_dojos = Dojo.all
        render "dojos/index.html.erb"
    end
    def new
        render "dojos/new.html.erb"
    end
    def create
        @dojo = Dojo.create(dojo_params)
        if @dojo.errors.any?
            render "dojos/errors.html.erb"
        else
            redirect_to "/"
        end
    end
    def show
        @show_dojo = Dojo.find(params[:id])
        @all_students = Dojo.find(params[:id]).students
        render "dojos/show.html.erb"
    end
    def edit
        @edit_dojo = Dojo.find(params[:id])
        render "dojos/edit.html.erb"
    end
    def destroy
        Dojo.find(params[:id]).destroy
        redirect_to "/"
    end
    def update
        @dojo = Dojo.update(params[:id], dojo_params)
        if @dojo.errors.any?
            render "dojos/errors.html.erb"
        else
            redirect_to "/"
        end
    end
    private
        def dojo_params
            params.require(:dojo).permit(:branch, :street, :city, :state)
        end
end
