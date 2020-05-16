class SettingsController < Users::ApplicationController
  before_action :set_setting, only: [:show, :edit, :update, :destroy]

  # GET /settings/1
  # GET /settings/1.json
  def show
  end

  # PATCH/PUT /settings/1
  # PATCH/PUT /settings/1.json
  def update
    respond_to do |format|
      if @setting.update(setting_params)
        format.html { redirect_to @setting, notice: 'Setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @setting }
      else
        format.html { render :edit }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  def facebook
    Rails.logger.info params.inspect
    redirect_to settings_path(params[:id]), notice: '連携しました'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @setting = Setting.find_by_user_id(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def setting_params
      params.require(:setting).permit(:is_insta, :display_mode, :user_id)
    end
end
