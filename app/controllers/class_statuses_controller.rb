class ClassStatusesController < ApplicationController
  before_action :set_class_status, only: [:show, :edit, :update, :destroy]

  # GET /class_statuses
  # GET /class_statuses.json
  def index
    @class_statuses = ClassStatus.all
  end

  # GET /class_statuses/1
  # GET /class_statuses/1.json
  def show
  end

  # GET /class_statuses/new
  def new
    @class_status = ClassStatus.new
  end

  # GET /class_statuses/1/edit
  def edit
  end

  # POST /class_statuses
  # POST /class_statuses.json
  def create
    @class_status = ClassStatus.new(class_status_params)
	  
	user_id = @class_status.user_id
	class_id = @class_status.class_list_id
	  
	user = User.find(user_id)
	class_list = ClassList.find(class_id)
	  
	current_credits = user.current_credits
	new_credits = class_list.credits || 0
	  
	respond_to do |format|
		if ClassStatus.applied?(user_id, class_id)
			format.html { redirect_to root_path, notice: '중복신청은 되지 않습니다.' }
			
		elsif ClassStatus.exceeds_capacity?(class_id)
			format.html { redirect_to root_path, notice: '수강인원을 초과할 수 없습니다.' }
			
		elsif !user.can_add_credits?(new_credits)
			format.html { redirect_to class_lists_path, notice: '한 사람당 최대 학점 수를 초과할 수 없습니다.'}
			
		else
			@class_status.save
			format.html { redirect_to class_lists_path, notice: '강의 신청이 완료되었습니다.' }
      end
    end
  end

  # PATCH/PUT /class_statuses/1
  # PATCH/PUT /class_statuses/1.json
  def update
    respond_to do |format|
      if @class_status.update(class_status_params)
        format.html { redirect_to @class_status, notice: '강의 신청이 완료되었습니다.' }
        format.json { render :show, status: :ok, location: @class_status }
      else
        format.html { render :edit }
        format.json { render json: @class_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_statuses/1
  # DELETE /class_statuses/1.json
  def destroy
    @class_status.destroy
    respond_to do |format|
      format.html { redirect_to class_lists_path, notice: '강의신청 취소가 완료되었습니다.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_status
      @class_status = ClassStatus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def class_status_params
      params.require(:class_status).permit(:user_id, :class_list_id)
    end
end
