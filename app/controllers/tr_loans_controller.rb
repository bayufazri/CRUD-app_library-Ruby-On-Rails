class TrLoansController < ApplicationController
  before_action :tr_loan, only: [:show, :edit, :update, :destroy]
  def index
    @tr_loans = TrLoan.where(is_active: true)
  end

  def show
  end

  def edit
  end

  def update
    @tr_loan.update(tr_loan_params)

    redirect_to tr_loans_path
  end

  def new
    @tr_loan = TrLoan.new
  end

  def create
    @tr_loan = TrLoan.new(tr_loan_params)
    @tr_loan.save

    redirect_to tr_loans_path
  end

  def destroy
    @tr_loan.update(is_active: false)
  end

  private
    def tr_loan_params
      params.require(:tr_loan).permit(:member_name, :member_phone, :member_email, :ms_book_id)
    end

    def tr_loan
      @tr_loan = TrLoan.find (params[:id])
    end

end

