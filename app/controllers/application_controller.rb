class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/users" do
    @users = User.all
    @users.to_json
  end

  post "/users" do
    @users = User.create(params)
    if @users.id
      serialized_user
    else
      @users.errors.full_messages.to_sentence
    end
  end

  post "/posts" do
    post= Post.create(
      image: params[:image],
      caption: params[:caption],
      likes: params[:likes],
      user_id: params[:user_id]
    )
    if post.id
      post.to_json(include: :user)
    else
      post.errors.full_messages.to_sentence
      {errors: post.errors.full_messages.to_sentence}.to_json
    end
  end

  get '/users/:username' do
    user = User.find_by_username(params[:username])
    if user
      user.to_json(include: :posts)
    else
      {errors: "Record not found with id #{params['username']}"}.to_json
    end
  end

  patch "/users/:id" do
    @user = User.find_by_id(params[:id])
    if @user && @user.update(params)
      serialized_user
    elsif !@user
      {errors: "Record not found with id #{params['id']}"}.to_json
    else
      {errors: @user.errors.full_messages.to_sentence}.to_json
    end
  end

  delete "/users/:id" do
    @user = User.find(params[:id])
    @user.destroy
    @user.to_json
  end

  delete "/posts/:id" do
    @post = Post.find(params[:id])
    @post.destroy
    @post.to_json
  end

  get "/posts" do

    Post.all.to_json(include: :user )
    end
  
    get "/posts/:id" do
      post = Post.find_by(id: params[:id])
     if post
        post.to_json(include: :user)
      else
        {errors: "Record not found with id #{params['id']}"}.to_json
      end
    end


    

  def serialized_user
    @users.to_json(include: :posts)
  end
end