class StudentsController < ApplicationController
    def new 
        @student = Student.new #create new studnet
        @students = Student.all #get all students
        @teacher = Teacher.new
        @teachers = Teacher.all
        @question = Question.new
        @questions = Question.all
        @answer = Answer.new
        @answers = Answer.all
    end

    def index
        if session[:user_id].nil?
            redirect_to root_url
        end
        @student = Student.new #create new studnet
        @students = Student.all #get all students
        @question = Question.new
        @questions = Question.all
        @answer = Answer.new
        @answers = Answer.all
    end

    def check_credentials
        username = params[:student][:username]
        password = params[:student][:password]
      
        # Query the database to find a teacher with the provided username
        student = Student.find_by(username: username)
      
        if student && student.password == password
          session[:user_id] = student.id
          redirect_to student_index_path, notice: "Welcome back, #{student.username}!"
        else
          flash.now[:alert] = "Invalid login credentials."
          render :login
        end
    end

    def login
        session[:user_id] = nil
        @student = Student.new #create new studnet
        @students = Student.all
    end

    def create
        @student = Student.new(student_params)
        if @student.save #save into sql
            redirect_to root_url
        end
    end
    private
    def student_params
        params.require(:student).permit(:username, :password)
    end
end