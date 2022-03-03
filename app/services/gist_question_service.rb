class GistQuestionService
  attr_reader :client

  #ACCESS_TOKEN = ENV['TOKEN_TEST_GURU']
  ACCESS_TOKEN = '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'

  def initialize(question, client = client_octokit)
    @question = question
    @test = @question.test
    @client = client
  end


  def success?
    @client.last_response.status == 201
  end

  def call
    @client.create_gist(gist_params) 
  end

  private

  def gist_params
  {
    description: I18n.t('services.gist_question_service.desc'),
    files: {
      'test-guru-question.txt' => {
        content: gist_content
      }
    }
  }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def client_octokit
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end 