class ResponsesController < ApplicationController
  def show
    @all_creative_quality_names = CreativeQuality.all_names
    @response = Response
      .includes(question_responses: [question_choice: [question: :question_choices]])
      .find(params[:id])
  end

  def index
    @responses = Response.all
  end
end
