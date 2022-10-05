# frozen_string_literal: true

class Api::Admin::LensesController < Api::Admin::BaseController
	before_action :set_lense, only: %i[update destroy]

	def index
		lenses = Lense.all

		render json: lenses
	end

	def create
		@lense = Lense.new(lense_params)

		if @lense.save
			render json: @lense
		else
			render_errors(@lense.errors.full_messages.presence, :unprocessable_entity)
		end
	end

	def update
		if @lense.update(lense_params)
			render json: @lense
		else
			render_errors(@lense.errors.full_messages.presence, :unprocessable_entity)
		end
	end

	def destroy
		if @lense.destroy
			render json: @lense
		else
			render_errors(@lense.errors.full_messages.presence || 'Failed to delete lense',
										:unprocessable_entity)
		end
	end

	private

		def lense_params
			params.require(:lense).permit(:id, :name)
		end

		def set_lense
			@lense = Lense.find_by(id: params[:id])
			return render_errors('Lense not found!', :not_found) if @lense.nil?
		end
end
