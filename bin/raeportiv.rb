require 'bundler'
Bundler.require

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))
require 'raeportiv'

get "/" do
  slim :index
end

post "/resolve" do
  Raepist.raep(params[:first_name], params[:last_name], params[:domain], middle_name: params[:middle_name])
end
