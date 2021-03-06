get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.new(email: params[:email],
                   password: params[:password],
                   password_confirmation: params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect to '/'
  else
    flash.now[:errors] = @user.errors.full_messages
    erb :'users/new'
  end
end

# get '/users/reset_password/:token' do
#   token = Token.first(token: params[:token])
#   @links = tag ? tag.links : []
#   erb :index
# end
