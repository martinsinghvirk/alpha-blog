class ArticlesController < ApplicationController
    # Private metoden set_article exekveras innan de definierade funktioner nedan.
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    # Kräver en inloggade user förutom nedan definierade funktioner.
    before_action :require_user, except: [:index, :show]
    # Kräver en specifik user som publiserat artikeln för att ändra och ta bort.
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        # Delar upp sidan baserat på antalet artiklar som satts till 5 stycken.
        @articles = Article.paginate(page: params[:page], per_page: 5)
        # @articles = Article.all # Tidigare anrop till modellen.
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        # render plain: params[:article].inspect
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save
            # Skriver ut ett status meddelande.
            flash[:success] = "Article was successfully created"
            redirect_to article_path(@article)
        else
            # Kör metoden new.
            render 'new'
        end
    end

    def update
        if @article.update(article_params)
            flash[:success] = "Article was sucessfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def show        
    end

    def destroy
        @article.destroy
        flash[:danger] = "Article was successfully deleted"
        redirect_to articles_path
    end

    private
        def set_article
            @article = Article.find(params[:id])
        end

        def article_params
            params.require(:article).permit(:title, :description)
        end

        def require_same_user
            if current_user != @article.user
                flash[:danger] = "You can only edit or delete your own articles"
                redirect_to root_path
            end
        end


end