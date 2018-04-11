class StudentsController < ApplicationController
    def new
        @branch = Dojo.find(params[:dojo_id])
        render "students/new.html.erb"
    end
    def create
        Dojo.find(params[:dojo_id]).students.create(student_params)
        redirect_to "/dojos/#{params[:dojo_id]}"
    end
    def show
        @dojo = Dojo.find(params[:dojo_id])
        @student = Student.find(params[:id])
        render "students/show.html.erb"
    end
    def edit
        @branch = Dojo.find(params[:dojo_id])
        @student = Dojo.find(params[:dojo_id]).students.find(params[:id])
        render "students/edit.html.erb"
    end
    def update
        Student.update(params[:id], student_params)
        redirect_to "/dojos/#{params[:dojo_id]}"
    end
    def destroy
        Student.find(params[:id]).destroy
        redirect_to "/dojos/#{params[:dojo_id]}"
    end
    private
        def student_params
            params.require(:student).permit(:first_name, :last_name, :email)
        end
end
