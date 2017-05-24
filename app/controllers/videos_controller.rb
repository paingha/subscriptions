class VideosController < ApplicationController
	#before_action :authenticate_user!

	def index
		@video = Video.all
	end 

	def new
	end

	def create 
		@video = Video.new(video_params)

		if @video.save
			redirect_to @video, notice: 'Video created'
		else
			render "New"
		end
	end

	def update
		if @video.update(video_params)
			redirect_to @video
		else
			render "Edit"
		end
	end

	def show
	end

	def edit 
	end

	def destroy
    @video.destroy
	redirect_to root_path
  end

	private

	def video__params
		params.require(:video).permit(:name, :description, :url)
	end

	def find_video
		@video = Video.find(params[:id])
	end
end
