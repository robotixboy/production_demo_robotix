class TeacherController < ApplicationController
    def new 
        @teacher = Teacher.new #create new teacher
        @teachers = Teacher.all #get all teachers
    end

    def login
        @teacher = Teacher.new
    end

    def show

    end

    def check_credentials
        username = params[:teacher][:username]
        password = params[:teacher][:password]
      
        # Query the database to find a teacher with the provided username
        teacher = Teacher.find_by(username: username)
      
        if teacher && teacher.password == password
          session[:user_id] = teacher.id
          redirect_to teacher_index_path, notice: "Welcome back, #{teacher.username}!"
        else
          flash.now[:alert] = "Invalid login credentials."
          render :login
        end
    end

    def index 
        @teachers = Teacher.all #get all teachers
        #@question = Question.new
        #@questions = Question.all
        #@answers = Answer.all
    end

    def create
        @teacher = Teacher.new(teacher_params)
        if @teacher.save #save into sql
            redirect_to :back
        end
    end

    private
    def teacher_params
        params.require(:teacher).permit(:username, :password)
    end
end

