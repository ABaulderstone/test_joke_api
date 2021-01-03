# Things to remember

## adding jwt to signup
  ```Ruby
            @user = User.new(user_params)
        
        if @user.save
            auth_token = Knock::AuthToken.new payload: { sub: @user.id }
             render json: {username: @user.username, jwt: auth_token.token}, status: :created
        else
             render json: @user.errors, status: :unprocessable_entity
        end
```

## add migration 
`rails generate migration add_user_to_jokes user:references`
