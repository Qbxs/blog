module Web.View.Users.New where
import Web.View.Prelude

data NewView = NewView { user :: User }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active">New User</li>
            </ol>
        </nav>
        <h1>Create Account</h1>
        {renderForm user}
    |]

renderForm :: User -> Html
renderForm user = formFor user [hsx|
   {textField #email}
   {textField #passwordHash}
   {textField #passwordHash}
   {hiddenField #lockedAt}
   {hiddenField #failedLoginAttempts}
   {submitButton}
|]
