class QuestionsController < ApplicationController
  before_action :set_test,     except: [:show, :edit]
  before_action :set_question, only:   [:show, :edit, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_question_not_found

  def index
    respond_to do |format|
      format.json do
        render json: {
          data: {
              questions: @test.questions.all
          }
        }
      end

      format.html do
        render html: 'All Questions'
      end

      format.text do
        render plain: 'All Questions'
      end
    end
  end

  def new
    @question = @test.questions.new

    respond_to do |format|
      format.json do
        render json: {
            data: @question
        }
      end

      format.html do
        render html: 'New Question'
      end

      format.text do
        render plain: 'New Question'
      end
    end
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to test_question_path(@test)
    else
      respond_to do |format|
        format.json do
          render json: {
              errors: @question.errors
          }
        end

        format.html do
          render html: "Question params were invalid."
        end

        format.text do
          render plain: "Question params were invalid."
        end
      end
    end


  end

  def show
    respond_to do |format|
      format.json do
        render json: {
            data: @question
        }
      end

      format.html do
        render html: "Question #{@question.id}"
      end

      format.text do
        render plain: "Question #{@question.id}"
      end
    end
  end

  def edit
    respond_to do |format|
      format.json do
        render json: {
            data: @question
        }
      end

      format.html do
        render html: "Edit question #{@question.id}"
      end

      format.text do
        render plain: "Edit question #{@question.id}"
      end
    end
  end

  def update
    if @question.update(question_params)
      redirect_to test_question_path(@test, @question)
    else
      respond_to do |format|
        format.json do
          render json: {
              errors: @question.errors
          }
        end

        format.html do
          render html: "Question params were invalid."
        end

        format.text do
          render plain: "Question params were invalid."
        end
      end
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@test)
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id] || params[:question_id])
  end

  def question_params
    params.require(:test).permit(:body)
  end

  def rescue_question_not_found
    render plain: "There's no such question :'("
  end
end
