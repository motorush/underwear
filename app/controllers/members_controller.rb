class MembersController < ApplicationController
  before_filter :authenticate_admin!
  def index
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end
    def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(members_url) }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  def destroy
    @user =User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(members_url) }
    end
  end
end

