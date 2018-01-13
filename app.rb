require 'bundler'

Bundler.require(:default)

require 'sinatra/reloader'
require 'fast_secure_compare/fast_secure_compare'

enable :sessions

get '/' do
  if session[:loggedin]
    redirect '/logged'
  else
    erb :index
  end
end

post '/logged' do
  line = File.read('password.txt')
  pass = line.split(':')
  to_hash = pass[0] + '#' + params[:password] + '#' + pass[2]
  hashed = Digest::SHA512.hexdigest(to_hash)
  comp = FastSecureCompare.compare(pass[1], hashed)
  if comp
    session[:loggedin] = true
  else
    session[:loggedin] = false
  end
  if session[:loggedin]
    erb :hello
  else
    redirect '/'
  end
end

get '/logged' do
  if session[:loggedin]
    erb :hello
  else
    redirect '/'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
