class AnswersController < ApplicationController
    def new
      @answer = Answer.new
      @answers = Answer.all
    end
  
    def create
      answers_params = params[:answers]
      ##Checks to see if there are any questions answered at all
      if answers_params.present?
        answers_params.each do |answer_params| #Will loop through each answer and create a new answer from it
          @answer = Answer.new(answer_params.permit(:response, :student_id, :question_id))
  
          #If the answer is not saved it will output error
          if !@answer.save
            flash[:error] = @answer.errors.full_messages.join(", ")
            render 'student/index'
            return
          end
        end
        #notifi user answers have been sumbitted
        flash[:notice] = "All answers were successfully submitted."
        redirect_to root_path
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