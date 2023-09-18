class McdsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]

    def index
      @mcds = Mcd.all
        if params[:tag_ids]
        @mcds = []
        params[:tag_ids].each do |key, value|      
          @mcds += Tag.find_by(name: key).mcds if value == "1"
        end
        @mcds.uniq!
      end
    end

    def new
        @mcd = Mcd.new
    end
    
    def create
      mcd = Mcd.new(mcd_params)
      mcd.user_id = current_user.id
      if mcd.save!
        redirect_to :action => "index"
      else
        redirect_to :action => "new"
      end
    end

    def show
      @mcd = Mcd.find(params[:id])
    end

    def edit
      @mcd = Mcd.find(params[:id])
    end

    def update
      mcd = Mcd.find(params[:id])
      if mcd.update(mcd_params)
        redirect_to :action => "show", :id => mcd.id
      else
        redirect_to :action => "new"
      end
    end

    def destroy
      mcd = Mcd.find(params[:id])
      mcd.destroy
      redirect_to action: :index
    end
    
    private
    def mcd_params
      params.require(:mcd).permit(:main_item, :about, :image, tag_ids: [])
    end

    def article_params
      params.require(:article).permit(:body, tag_ids: [])
    end
end
