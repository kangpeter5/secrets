class SecretsController < ApplicationController
	def index
		@secrets = Secret.all
	end

	def create
		secret = Secret.new(content: secret_params["content"], user: current_user)
		if secret.save
			flash[:success] = "Secret Added"
			redirect_to "/users/#{current_user.id}"
		else
			flash[:errors] = "Type something in secrets!"
			redirect_to :back
		end
	end

	def destroy
		secret = Secret.find(params[:id])
		secret.destroy if secret.user == current_user
		redirect_to "/users/#{current_user.id}"
	end

	private
		def secret_params
			params.require(:secret).permit(:content)
		end
end
