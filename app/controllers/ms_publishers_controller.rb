class MsPublishersController < ApplicationController
    before_action :ms_publisher, only: [:show, :edit, :update, :destroy]
    def index
      @ms_publishers = MsPublisher.where(is_active: true)
    end
  
    def show
    end
  
    def edit
    end
  
    def update
      @ms_publisher.update(ms_publisher_params)
  
      redirect_to ms_publishers_path
    end
  
    def new
      @ms_publisher = MsPublisher.new
    end
  
    def create
      @ms_publisher = MsPublisher.new(ms_publisher_params)
      @ms_publisher.save
  
      redirect_to ms_publishers_path
    end
  
    def destroy
      @ms_publisher.update(is_active: false)
    end
  
    private
      def ms_publisher_params
        params.require(:ms_publisher).permit(:name, :phone, :address)
      end
  
      def ms_publisher
        @ms_publisher = MsPublisher.find (params[:id])
      end
  
  end
  
