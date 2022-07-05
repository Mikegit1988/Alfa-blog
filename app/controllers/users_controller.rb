class UsersController < ApplicationController
   
   def show
      @user = User.find(params[:id])
      @articles = @user.articles
   end
   #Define action of index
   def index
      @users = User.all
   end
   
   def new
      @user = User.new
   end
   
   def edit
      @user = User.find(params[:id])
   end
   
   def update
      @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
      
   end
   
   
   def create #the method is for user creation action
      @user = User.new(user_params)
      if @user.save
         flash[:notice] = "Welcome to Alpha Blog #{@user.username} you are successfully signed up"
         redirect_to articles_path
      else
         render 'new' #render the phone allover again
      end
   end
   
   private
      def user_params
         params.require(:user).permit(:username, :email, :password)
      end
end