class ToDosController < ApplicationController
  def index
    @to_dos = ToDo.all
  end

  def new
    @to_do = ToDo.new
  end

  def create
    @to_do = ToDo.new(to_do_params)

    if @to_do.save
      redirect_to(to_dos_path)
    else
      render(:new)
    end
  end

  private

  def to_do_params
    params.require(:to_do).permit(:task)
  end
end
