class GithubClient
  ROOT_ENDPOINT = 'https://api.github.com'

  def initialize
    @http_cllient = setup_http_client
  end

  def create_gist(params)
    @http_cllient.post('/gists', params) do |requests|
      requests.headers['Authorization'] = "token #{ENV['GITHUB_TOKEN']}"
      requests.headers['Content-Type']  = "application/json"
      requests.body                     = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
