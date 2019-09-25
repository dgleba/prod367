class MorningMeetingsController < ApplicationController
before_filter :authenticate_user!
  # before_action :set_morning_meeting, only: [:show, :edit, :update, :destroy]

  #cancancan
  load_and_authorize_resource

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  autocomplete :vw_eam_asset, :asset_title, :full => true,  :limit => 30 

  
  def reset_reviewed
    # no - use the model method..
    # Pfeature.update_all(
      # ActiveRecord::Base.send(:sanitize_sql_for_assignment, {:name => "'color_wow'"})
    # )

    # reset all colors to colorWow
    MorningMeeting.reset_reviewed_sql
  end
 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 
  # GET /morning_meetings
  def index
    @q = @morning_meetings.search params[:q]
    
    # https://github.com/activerecord-hackery/ransack/wiki/Sorting-in-the-Controller
    # no... @q.sorts = 'updated_at desc' if @q.present? 
    @q.sorts = [ 'is_closed asc' , 'created_at desc' , 'id desc' ] if (params[:q]).present? 

    @morning_meetings = @q.result.page(params[:page])
    
    # scope for is_closed - see model.
    @morning_meetings = @morning_meetings.closeditemsnot(params[:closeditemsnot]) if params[:closeditemsnot].present?

    @morning_meetings = @morning_meetings.priorityorder(params[:priorityorder]) if params[:priorityorder].present?

    # scope for isclosed and reviewed_mark - see model.
    @morning_meetings = @morning_meetings.notreviewed(params[:notreviewed]) if params[:notreviewed].present?
    
    
    @morning_meetings = @morning_meetings.notreviewedpriority(params[:notreviewedpriority]) if params[:notreviewedpriority].present?

    
  end

  # GET /morning_meetings/1
  def show
  end

  # GET /morning_meetings/new
  def new
  end

  # GET /morning_meetings/1/edit
  def edit
  end

  # POST /morning_meetings
  def create
    respond_to do |format|
      if @morning_meeting.save
        format.html { redirect_to @morning_meeting, notice: t('success_create') }
        format.json { render :show, status: :created, location: @morning_meeting }
      else
        format.html { render :new }
        format.json { render json: @morning_meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /morning_meetings/1
  def update
    respond_to do |format|
      if @morning_meeting.update(morning_meeting_params)
        format.html { redirect_to @morning_meeting, notice: t('success_update') }
        #  This can't work as I don't know what review type is needed next...  format.html { redirect_to morning_meetings_url(param1 => 'blah blah'), notice: t('success_update') }
        format.json { render :show, status: :ok, location: @morning_meeting }
      else
        format.html { render :edit }
        format.json { render json: @morning_meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /morning_meetings/1
  def destroy
    @morning_meeting.destroy
    respond_to do |format|
      format.html { redirect_to morning_meetings_url, notice: t('success_destroy') }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def morning_meeting_params
    params.require(:morning_meeting).permit(:name, :priority, :machine_id, :problem_description, :running, :responsibility, :timing_plan_for_repair, :followup_comments, :is_closed, :reviewed_mark)
  end
end
