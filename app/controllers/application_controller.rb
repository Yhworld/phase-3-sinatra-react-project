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

  def serialized_user
    @users.to_json(include: :posts)
  end
end