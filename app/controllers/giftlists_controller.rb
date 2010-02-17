class GiftlistsController < ApplicationController
  # GET /giftlists
  # GET /giftlists.xml
  def index
    @giftlists = Giftlist.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @giftlists }
    end
  end

  # GET /giftlists/1
  # GET /giftlists/1.xml
  def show
    @giftlist = Giftlist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @giftlist }
    end
  end

  # GET /giftlists/new
  # GET /giftlists/new.xml
  def new
    @giftlist = Giftlist.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @giftlist }
    end
  end

  # GET /giftlists/1/edit
  def edit
    @giftlist = Giftlist.find(params[:id])
  end

  # POST /giftlists
  # POST /giftlists.xml
  def create
    @giftlist = Giftlist.new(params[:giftlist])

    respond_to do |format|
      if @giftlist.save
        flash[:notice] = 'Giftlist was successfully created.'
        format.html { redirect_to(@giftlist) }
        format.xml  { render :xml => @giftlist, :status => :created, :location => @giftlist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @giftlist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /giftlists/1
  # PUT /giftlists/1.xml
  def update
    @giftlist = Giftlist.find(params[:id])

    respond_to do |format|
      if @giftlist.update_attributes(params[:giftlist])
        flash[:notice] = 'Giftlist was successfully updated.'
        format.html { redirect_to(@giftlist) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @giftlist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /giftlists/1
  # DELETE /giftlists/1.xml
  def destroy
    @giftlist = Giftlist.find(params[:id])
    @giftlist.destroy

    respond_to do |format|
      format.html { redirect_to(giftlists_url) }
      format.xml  { head :ok }
    end
  end
end
