class AnswersController < ApplicationController
    def new
      @answer = Answer.new
      @answers = Answer.all
    end
  
    def create
      answers_params = params[:answers]
    
      if answers_params.present?
        answers_params.each do |question_id, answer_param|
          # Ensure that the answer_param is an ActionController::Parameters object
          answer_param = answer_param.permit(:response, :student_id, :question_id)
    
          # Create a new Answer record for each answer_param
          @answer = Answer.new(answer_param)
    
          if !@answer.save
            flash[:error] = @answer.errors.full_messages.join(", ")
            render 'student/index'
            return
          end
        end
    
        flash[:notice] = "All answers were successfully submitted."
        redirect_to student_grade_path
      else
        flash[:alert] = "No answers were submitted."
        render 'student/index'
      end
    end
    
  
    def create_answer
      @answer = Answer.new(answer_params)
  
      if @answer.save
        flash[:notice] = "Answer was successfully created."
        redirect_to root_path 
      else
        flash.now[:alert] = "Failed to create the answer."
        render 'students/index'
      end
    end
  
    private
    def answer_params
      params.require(:answer).permit(:response, :student_id, :question_id)
    end
  end