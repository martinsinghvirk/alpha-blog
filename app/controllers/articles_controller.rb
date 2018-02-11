class ArticlesController < ApplicationController
    # Private metoden set_article exekveras innan de definierade metoderna i listan.
    before_action :set_article, only: [:edit, :update, :show, :destroy]

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        # render plain: params[:article].inspect
        @article = Article.new(article_params)
        if @article.save
            # Skriver ut ett status meddelande.
            flash[:notice] = "Article was successfully created"
            redirect_to article_path(@article)
        else
            # Kör metoden new.
            render 'new'
        end
    end

    def update
        if @article.update(article_params)
            flash[:notice] = "Article was sucessfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def show        
    end

    def destroy
        @article.destroy
        flash[:notice] = "Article was successfully deleted"
        redirect_to articles_path
    end

    private
        def set_article
            @article = Article.find(params[:id])
        end

        def article_params
            params.require(:article).permit(:title, :description)
        end
end