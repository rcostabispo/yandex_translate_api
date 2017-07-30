require "yandex_translate_api/version"
require "rest-client"
require "json"

module YandexTranslateApi
  class Yandex

    YANDEX_API_URL = "https://translate.yandex.net/api/v1.5/tr.json"

    def initialize(api_key)
      @api_key = api_key
    end

    def translate(text, language)
      data   = { params: { key: @api_key, text: text, format: 'plain', lang: language } }
      result = RestClient.get("#{YANDEX_API_URL}/translate", data)

      JSON.parse(result.body)
    end

    def langs
      data   = { params: { key: @api_key } }
      result = RestClient.get("#{YANDEX_API_URL}/getLangs", data)

      JSON.parse(result.body)
    end

    def detect(text)
      data   = { params: { key: @api_key, text: text } }
      result = RestClient.get("#{YANDEX_API_URL}/detect", data)

      JSON.parse(result.body)
    end

  end
end
