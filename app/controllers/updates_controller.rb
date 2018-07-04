class UpdatesController < ApplicationController
  before_action :set_updateable
  before_action :set_update, only: [:reply, :edit, :update, :destroy ]


  def reply
    @updatereply = @updateable.updates.build(updateparent: @update)
  end

  def create
    @update = @updateable.updates.new(update_params)
    @update.user = current_user
    respond_to do |format|
      if @update.save
        format.html { redirect_to @updateable}
        format.json { render json: @update}
        format.js
      else
        format.html { render :back}
        format.json { render json: @update.errors }
        format.js
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @update.update(update_params)
        format.html { redirect_to @updateable}
        format.json { render json: @update}
        format.js
      else
        format.html { render :back}
        format.json { render json: @update.errors }
        format.js
      end
    end
  end

  def destroy
    @update.destroy if @update.errors.empty?
    respond_to do |format|
      format.html { redirect_to @updateable}
      format.json { head :no_content }
      format.js
    end
  end

  private

  def set_updateable
    resource, id = request.path.split('/')[1,2]
    @updateable = resource.singularize.classify.constantize.find(id)
  end

  def set_update
    begin
      @update = @updateable.updates.find(params[:id])
    rescue => e
      logger.error "#{e.class.name} : #{e.message}"
      @update = @updateable.updates.build
      @update.errors.add(:base, :recordnotfound, message: "That record doesn't exist. Maybe, it is already destroyed.")
    end
  end

  def update_params
    params.require(:update).permit(:content, :updateparent_id)
  end


end
