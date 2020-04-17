class SongsController < ApplicationController
  before_action :set_song!, only: [:show, :edit, :update]
  
  def index 
    @songs = Song.all
  end 
  
  def new 
    @song = Song.new
  end 
  
  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to songs_path(@song)
    else 
      render :new 
    end
  end 
  
  def show 
    
  end 
  
  def edit 
    
  end 
  
  def update
    if @song.update(song_params)
      redirect_to songs_path(@song)
    else
      render :edit
    end
  end 
  
  def delete 
    
  end
  
  private
    
    def song_params
      params.require(:song).permit(:title, :released, :released_year, :artist_name, :genre)
    end
    
    def set_song!
      @song = Song.find(params[:id])
    end
      
end
