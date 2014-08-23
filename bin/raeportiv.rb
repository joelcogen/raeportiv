require 'bundler'
Bundler.require

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))
require 'raeportiv'

get "/" do
  slim :index
end

post "/do" do
  Raepist.raep(params[:first_name], params[:last_name], params[:company], middle_name: params[:middle_name])
end

enable :run
