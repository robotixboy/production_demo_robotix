class TeachersController < ApplicationController
    def new 
        @teacher = Teacher.new #create new teacher
        @teachers = Teacher.all #get all teachers
    end

    #Teacher/login.html.erb 
    def login
        @teacher = Teacher.new #Most likey not nessesary :I
        @teachers = Teacher.all
    end

    #Function in Teacher/login.html.erb [Takes in a user/pass and compares in the database it exists]
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

    #Teacher/index.html.erb
    def index 
        @teachers = Teacher.all #get all teachers
        @question = Question.new
        @questions = Question.all
        @answers = Answer.all
    end

    #Never used buy made to create a teacher login
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