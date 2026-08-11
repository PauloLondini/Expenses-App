class ExpensesController < ApplicationController

  def index
  @expense ||= Expense.new

  if params[:category].present?
    expenses = Expense.where(category: params[:category])
  else
    expenses = Expense.all
  end

  @total = expenses.sum(:amount)

  @expenses = expenses.group_by { |expense| expense.category }
  end

  def create
  @expense = Expense.new(
    title: params[:title],
    amount: params[:amount],
    category: params[:category],
    date: params[:date]
  )

  if @expense.save
    redirect_to "/expenses"
  else
    @total = Expense.sum(:amount)
    @expenses = Expense.all.group_by(&:category)

    render :index, status: :unprocessable_entity
  end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])

    @expense.update(
      title: params[:title],
      amount: params[:amount],
      category: params[:category],
      date: params[:date]
    )

    redirect_to "/expenses"
  end

  def destroy
    @expense = Expense.find(params[:id])

    @expense.destroy

    redirect_to "/expenses"
  end

end