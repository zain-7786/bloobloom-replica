# frozen_string_literal: true

class Api::Admin::FramesController < Api::Admin::BaseController
	before_action :set_frame, only: %i[update destroy]

	def index
		frames = Frame.all

		render json: frames
	end

	def create
		@frame = Frame.new(frame_params)

		if @frame.save
			render json: @frame
		else
			render_errors(@frame.errors.full_messages.presence, :unprocessable_entity)
		end
	end

	def update
		if @frame.update(frame_params)
			render json: @frame
		else
			render_errors(@frame.errors.full_messages.presence, :unprocessable_entity)
		end
	end

	def destroy
		if @frame.destroy
			render json: @frame
		else
			render_errors(@frame.errors.full_messages.presence || 'Failed to delete frame',
										:unprocessable_entity)
		end
	end

	private

		def frame_params
			params.require(:frame).permit(:id, :name)
		end

		def set_lense
			@lense = Lense.find_by(id: params[:id])
			return render_errors('Lense not found!', :not_found) if @lense.nil?
		end
end
