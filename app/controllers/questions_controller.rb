class QuestionsController < ApplicationController

  require 'csv'
  csv_text = File.read('additionalfiles/questions.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    row[0].capitalize!
    row[1].capitalize!
    # Question.create(row.to_hash) Not needed
    Question.create({question1: row[0], question2: row[1]})
  end

  # Not needed but this is the code to restart the primary keys
  # Question.connection.execute('ALTER SEQUENCE questions_id_seq RESTART 37;')


  def index
    @questions = Question.paginate(:page => params[:page], :per_page => 10)
    @questionsSearched = Question.text_search(params[:query])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Questions Added!"
      respond_to do |format|
        format.html { redirect_to questions_path }
        format.js
      end
    else
      redirect_to :back
    end
  end

  def edit
    @question = Question.find(params[:id])
    render :edit
  end

  def update
    @question = Question.find(params[:id])
    selected = params[:selected]
    if selected == "1"
      @question.update(question1vote: @question.question1vote + 1)
    else
      @question.update(question2vote: @question.question2vote + 1)
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end


  private
  def question_params
    params.require(:question).permit(:question1, :question2)
  end

end
