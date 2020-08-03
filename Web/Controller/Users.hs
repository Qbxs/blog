module Web.Controller.Users where

import Web.Controller.Prelude
import Web.View.Users.New
import Web.View.Users.Index


instance Controller UsersController where
  action UsersAction = do
      users <- query @User |> fetch
      render IndexView { .. }

  action NewUserAction = do
    let user = newRecord
    render NewView { .. }

  action CreateUserAction = do
    let user = newRecord @User
    user
        |> fill @["email", "passwordHash"]
        |> validateField #email isEmail
        |> validateField #passwordHash nonEmpty
        |> ifValid \case
            Left user -> render NewView { .. }
            Right user -> do
                hashed <- hashPassword (get #passwordHash user)
                user <- user
                    |> set #passwordHash hashed
                    |> createRecord
                setSuccessMessage "You have registered successfully"
                redirectTo PostsAction

  action DeleteUserAction { .. } = do
    user <- fetch userId
    deleteRecord user
    setSuccessMessage "User deleted"
    redirectTo PostsAction
