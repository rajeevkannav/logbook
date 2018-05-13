class HomeController < ApplicationController

  def main
    @result_set = Room.all_result_set
  end

  def upload
    unless upload_params[:file].nil?
      accounted, notice = VisitorEntry.make_entries(upload_params[:file].path)
    else
      notice = 'Not able to upload file, please try with a valid file.'
    end
    redirect_to root_path, notice: notice
  end

  private

  def upload_params
    params.permit(:file)
  end

end
