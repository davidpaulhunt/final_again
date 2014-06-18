class PandaController < ApplicationController

  skip_filter :verify_authenticity_token
          
  # override rails' default csrf check to use the json encoded payload instead of params
  def authorize_upload
    payload = JSON.parse(params['payload'])
    upload = Panda.post('/videos/upload.json', {
      file_name: payload['filename'],
      file_size: payload['filesize'],
      profiles: "h264",
    })

    render :json => {:upload_url => upload['location']}
  end

end