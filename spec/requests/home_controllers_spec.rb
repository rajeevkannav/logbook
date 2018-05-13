require 'rails_helper'

RSpec.describe "HomeControllers", type: :request do

  describe "GET #main" do
    it 'returns an 200 OK' do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #update' do

    context 'with in-valid params nil log file' do
      it 'returns an 302 with flash message Not able to upload file, please try with a valid file.' do
        post upload_home_index_path, params: {file: nil}
        expect(flash[:notice]).to match(/Not able to upload file, please try with a valid file./)
        expect(response).to have_http_status(302)
      end
    end

    context 'with in-valid log file with no records' do
      it 'returns an 302 with flash message Not data found to account.' do
        include Rack::Test::Methods
        post upload_home_index_path, params: {"file" => Rack::Test::UploadedFile.new(file_fixture('sample-blank.log'))}
        expect(flash[:notice]).to match(/Not data found to account./)
        expect(response).to have_http_status(302)
      end
    end

    context 'with valid log file' do
      it 'returns an 302 with flash message Log file accounted successfully.' do
        include Rack::Test::Methods
        post upload_home_index_path, params: {"file" => Rack::Test::UploadedFile.new(file_fixture('sample.log'))}
        expect(flash[:notice]).to match(/Log file accounted successfully./)
        expect(response).to have_http_status(302)
      end
    end

  end

end
