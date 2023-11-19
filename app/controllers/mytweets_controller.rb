class MytweetsController < ApplicationController
  before_action :set_mytweet, only: %i[ show edit update destroy ]

  # GET /mytweets or /mytweets.json
  def index
    @mytweets = Mytweet.all
  end

  # GET /mytweets/1 or /mytweets/1.json
  def show
  end

  # GET /mytweets/new
  def new
    @mytweet = Mytweet.new
  end

  # GET /mytweets/1/edit
  def edit
  end

  # POST /mytweets or /mytweets.json
  def create
    @mytweet = Mytweet.new(mytweet_params)

    respond_to do |format|
      if @mytweet.save
        format.html { redirect_to hashtag_url(@mytweet.hashtag), notice: "Mytweet was successfully created." }
        format.json { render :show, status: :created, location: @mytweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mytweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mytweets/1 or /mytweets/1.json
  def update
    respond_to do |format|
      if @mytweet.update(mytweet_params)
        format.html { redirect_to hashtag_url(@mytweet.hashtag), notice: "Mytweet was successfully updated." }
        format.json { render :show, status: :ok, location: @mytweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mytweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mytweets/1 or /mytweets/1.json
  def destroy
       mytweet=Xclient.delete("tweets/#{@mytweet.tweet_id}")
       p mytweet
       p mytweet['data']['deleted']
       p "tweet deleted"
             if mytweet["data"]["deleted"]
                       mymessage="le tweet a bien été supprimé sur twitter"
                                       @mytweet.destroy
                                             else
                                                     mymessage="le tweet n'a pas bien été supprimé sur twitter"
                                                           end


    respond_to do |format|
      format.html { redirect_to mytweets_url, notice: "Mytweet was successfully destroyed. #{mymessage}" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mytweet
      @mytweet = Mytweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mytweet_params
      params.require(:mytweet).permit(:content, :hashtag_id, :tweet_id,:myhashtag)
    end
end
