class JokesController < ApplicationController
    before_action :authenticate_user, except: [:index]
    before_action :set_joke, only: [:show, :update, :destroy]
    def index 
        @jokes = Joke.all
        render json: @jokes
    end 

    def create 
        @joke = Joke.create(joke_params)
        if @joke.errors.any? 
            render json: @joke.errors, status: :unprocessable_entity 
        else  
            render json: @joke, status: 201
        end 
    end 

    def show 
        render json: @joke, status: 200
    end

    def update 
        @joke.update(joke_params)
        if @joke.errors.any? 
            render json: @joke.errors, status: :unprocessable_entity 
        else  
            render json: @joke, status: 200
        end 
    end 

    def destroy 
        @joke.delete 
        render status: 204
    end 

    private
    def set_joke
        @joke = Joke.find(params[:id])
    end

    def joke_params 
        params.require(:joke).permit(:body, :category_id)
    end 
end
