class DocsController < ApplicationController
  before_action :find_doc, except: ['index','create']
  def index
    @docs = Doc.order('id desc')
  end

  def show
  end

  def new
  end

  def create
    @doc = Doc.new(doc_params)
    if @doc.save
      redirect_to @doc
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @doc.update(doc_params)
      redirect_to @doc
    else
      render 'edit'
    end
  end

  def destroy
    begin
      @doc.destroy
    rescue      
    end
    redirect_to docs_path
  end

  private 

  def find_doc
    @doc = params[:id].present? ? Doc.find(params[:id]) : Doc.new()
  end

  def doc_params
    params.require(:doc).permit(:title,:content)
  end
end
