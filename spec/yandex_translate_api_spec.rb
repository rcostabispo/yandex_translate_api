require "spec_helper"

describe YandexTranslateApi do

  describe "GET api/v1.5/tr.json/translate (Translate)" do
    it "Api response == 200" do
      textPt = "Nós estamos testando o tradutor"
      yandexApi = YandexTranslateApi::Yandex.new TEST_API_KEY
      response = yandexApi.translate textPt, "en"
      expect(response["code"]).to eq(200)
    end

    it "translated text match" do
      textPt = "Nós estamos testando o tradutor"
      textEn = "We are testing the translator"
      yandexApi = YandexTranslateApi::Yandex.new TEST_API_KEY
      response = yandexApi.translate textPt, "en"

      expect(response["text"].first).to eq(textEn)
    end
  end

  describe "GET api/v1.5/tr.json/getLangs (Supported List)" do
    it "Api response not equal nil or empty '' " do
      yandexApi = YandexTranslateApi::Yandex.new TEST_API_KEY
      response = yandexApi.langs
      expect(response).not_to eq(nil)
      expect(response).not_to eq("")
    end
  end

  describe "GET api/v1.5/tr.json/detect (Detect)" do
    it "Api response == 200" do
      textPt = "Nós estamos testando o tradutor"
      yandexApi = YandexTranslateApi::Yandex.new TEST_API_KEY
      response = yandexApi.detect textPt
      expect(response["code"]).to eq(200)
    end

    it "detect language match with right language" do
      textPt = "Nós estamos testando o tradutor"
      yandexApi = YandexTranslateApi::Yandex.new TEST_API_KEY
      response = yandexApi.detect textPt
      expect(response["lang"]).to eq("pt")
    end
  end
end
