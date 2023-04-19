require 'httparty'

notion = YAML.load(File.open('notion.secrets.yml').read)

opts = {
	headers: {
		"Authorization" => "Bearer #{notion['token']}",
		"Notion-Version" => "2022-06-28",
		"Content-Type" => "application/json"
	}
}
db = 'e6108956af784a2b85076471a9954458'
url = "https://api.notion.com/v1/databases/#{db}/query"

response = HTTParty.get(url, headers: {
	"Authorization" => "Bearer #{notion['token']}",
	"Notion-Version" => "2022-06-28",
	"Content-Type" => "application/json"
})

binding.irb