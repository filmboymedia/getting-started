class ArticlesController < ApplicationController
	def index
    @articles = Article.all
  end

	#This will generate each post "[:id]" will be replaced with post ID number
	def show
		@article = Article.find(params[:id])
	end

	def new
	  @article = Article.new
	end

	def edit
  	@article = Article.find(params[:id])
	end

	def create
	  @article = Article.new(article_params)
	 
	  if @article.save
    	redirect_to @article
	  else
	    render 'new'
	  end
	end

	def update
	  @article = Article.find(params[:id])
	 
	  if @article.update(article_params)
	    redirect_to @article
	  else
	    render 'edit'
	  end
	end

	def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end

	private
	  def article_params
	  	# ".permit()" is used for security...you need to explicitly tell tails what fields can be accepted. 
			# This helps keep hackers from creating their own.
	    params.require(:article).permit(:title, :text, :author, :date)
	  end
end
