class UsersController < ApplicationController

	protect_from_forgery :only => [:update, :destroy]

  # GET /users
  # GET /users.xml
	def add_giftlist_dialog 
		@user = User.find(:first, :conditions => ["username = ?", session[:user]])
		render :layout => false	
	end

	def cancel_new_giftlist
		render :layout => false
	end

	def add_user
		@user = User.new
	end
	
	def add_giftlist
		@giftlist = Giftlist.new
		@giftlist.giftlist_name = params[:input_name]
		@giftlist.user_id = params[:input_user_id]
		@giftlist.hidden = params[:input_hidden]
		@giftlist.save
		render :controller => session[:user]
	end
	
	def delete_gift
		@giftlist = Giftlist.find(:first, :conditions => ["id = ?", params[:giftlist]])
		@user = User.find(:first, :conditions => ["id = ?", params[:id]])
		@gift = Gift.find(:first, :conditions => ["id = ?", params[:gift_id]])
		@gift.delete
		@gifts = Gift.find(:all, :conditions => ["user_id = ?", params[:id]])
		render :partial => "show_giftlist"
	end

  def index
    @users = User.all
		
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
	
	def search_users
		@users = User.find(:all, :conditions => ["username = ?", params[:search]])
		@farts = "farts"
	end

	def show_gifts
		if (params[:id])
			@user = User.find(:first, :conditions => ["username = ?", params[:id]])
		else
			@user = User.find(:first, :conditions => ["user_id = ?", params[:user_id]])
		end
		@gifts = Gift.find(:all, :conditions => ["user_id = ?", @user.id])
		@giftlists = Giftlist.find(:all, :conditions => ["user_id = ?", @user.id])

		#render(:inline => user.id)
		#render :layout => false

	end

	def add_gift_dialog
		@user = User.find(:first, :conditions => ["username = ?", session[:user]])
		@giftlist = Giftlist.find(:first, :conditions => ["id = ?", params[:giftlist_id]])
		render :partial => 'add_gift_dialog'

	end

	def rss
		@user = User.find(:first, :conditions => ["username = ?", params[:id]])
		@giftlist = Giftlist.find(:first, :conditions => ["giftlist_name = ? and user_id = ?", params[:giftlist], @user.id])
		@gifts = Gift.find(:all, :conditions => ["giftlist_id = ? and user_id = ?", @giftlist.id, @user.id])
		
		respond_to do |format|
			format.html
			format.xml { render :layout => false }
		end
	end

	def show_giftlist
		@user = User.find(:first, :conditions => ["username = ?", params[:id]])
		@giftlist = Giftlist.find(:first, :conditions => ["giftlist_name = ? and user_id = ?", params[:giftlist], @user.id])
		@gifts = Gift.find(:all, :conditions => ["giftlist_id = ? and user_id = ?", @giftlist.id, @user.id])
		
		#respond_to do |format|
		#	format.html
		#	format.xml { render :layout => false }
		#end
	end

	def show_giftlist_partial
		@user = User.find(:first, :conditions => ["username = ?", params[:id]])
		@giftlist = Giftlist.find(:first, :conditions => ["giftlist_name = ? and user_id = ?", params[:giftlist], @user.id])
		@gifts = Gift.find(:all, :conditions => ["giftlist_id = ? and user_id = ?", @giftlist.id, @user.id])
		
		#respond_to do |format|
		#	format.html
		#	format.xml { render :layout => false }
		#end
	end

	def show_gift
		@user = User.find(:first, :conditions => ["username = ?", params[:id]])
		@gift = Gift.find(params[:gift])
	end

	def purchased_gift
		@gift = Gift.find(params[:gift])
		@gift.num_purchased = @gift.num_purchased + 1
		@gift.save
		render :inline => @gift.num_purchased
	end

	def admin
		if(session[:user]) 
			@user = User.find(:first, :conditions => ["username = ?", session[:user]])
			@measurement = Measurement.find(:first, :conditions => ["user_id = ?", @user.id])
		else
			flash[:notice] = "You must be logged in to administer your account."
			redirect_to :action => "home"
		end
	end

	def manage_giftlists
		if(session[:user]) 
			@user = User.find(:first, :conditions => ["username = ?", session[:user]])
			@measurement = Measurement.find(:first, :conditions => ["user_id = ?", @user.id])
			@giftlists = Giftlist.find(:all, :conditions => ["user_id = ?", @user.id])
		else
			flash[:notice] = "You must be logged in to manage giftlists for your account."
			redirect_to :action => "home"
		end
	end

	def login
	if request.post?
			user = User.authenticate(params[:name], params[:password])
			if user
				session[:user] = user.username
				redirect_to :controller => session[:user]
			end 

			#redirect_to :action => "index"
		else
			flash.now[:notice] = "Invalid Username / Password"
		end
	

	end

	def user_gift_entry
		if session[:user]
			@user = User.find(:first, :conditions => ["username = ?", session[:user]])
			render :layout => false
		else
			flash.now[:notice] = "Not logged in"
			redirect_to :action => 'home'
		end
			
		@gift = Gift.new

	end

	def logout
		session[:user] = nil		
		render :action => 'home'
	end
  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = 'User was successfully created.'
        format.html { redirect_to(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

	def redirect_to_index(msg = nil)
		flash[:notice] = msg if msg
		redirect_to :action => 'index'
	end

	def add_new_gift()
		if (session[:user])
			@giftlist = Giftlist.find(:first, :conditions => ["id = ?", params[:giftlist_id]])
			@user = User.find(:first, :conditions => ["id = ?", params[:user_id]])				
			@gifts = Gift.find(:all, :conditions => ["giftlist_id = ? AND user_id = ?", params[:giftlist_id], params[:user_id]])
			@gift = Gift.new
			@gift.name = params[:name]
			@gift.price = params[:price]
			@gift.url = params[:url]
			@gift.user_id = params[:user_id]
			@gift.description = params[:description]
			@gift.giftlist_id = params[:giftlist_id]
			@gift.num_requested = params[:num_requested]
			@gift.num_purchased = 0
			@gift.ranking = find_next_ranking(params[:user_id], params[:giftlist_id])
			@gift.save		
			render :partial => "show_giftlist"
		else
			flash[:notice] = "You must be logged in to add a gift"
			redirect_to :controller => "", :action => ""
		end
	end
	
	def giftlist_hide
		list_item = Giftlist.find(:first, :conditions => ["id = ?", params[:giftlist]])
		user = User.find(:first, :conditions => ["id = ?", list_item.user_id])
		url = "/", user.username, "/manage_giftlists"
		list_item.hidden = 1
		list_item.save
		redirect_to :controller => url
	end	

	def giftlist_unhide
		list_item = Giftlist.find(:first, :conditions => ["id = ?", params[:giftlist]])
		user = User.find(:first, :conditions => ["id = ?", list_item.user_id])
		url = "/", user.username, "/manage_giftlists"
		list_item.hidden = 0
		list_item.save
		redirect_to :controller => url
	end	

	def find_next_ranking(user_id, giftlist_id)
		Gift.count(:all, :conditions => ["user_id = ? and giftlist_id = ?", user_id, giftlist_id]) + 1
	end
end
