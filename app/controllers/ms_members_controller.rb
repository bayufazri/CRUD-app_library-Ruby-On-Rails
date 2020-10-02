class MsMembersController < ApplicationController
  before_action :ms_member, only: [:show, :edit, :update, :destroy]
  def index
    @ms_members = MsMember.where(is_active: true)
  end

  def show
  end

  def edit
  end

  def update
    @ms_member.update(ms_member_params)

    redirect_to ms_members_path
  end

  def new
    @ms_member = MsMember.new
  end

  def create
    @ms_member = MsMember.new(ms_member_params)
    @ms_member.save

    redirect_to ms_members_path
  end

  def destroy
    @ms_member.update(is_active: false)
  end

  private
    def ms_member_params
      params.require(:ms_member).permit(:name, :age, :address, :phone, :email)
    end

    def ms_member
      @ms_member = MsMember.find (params[:id])
    end

end
