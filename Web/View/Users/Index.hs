module Web.View.Users.Index where
import Web.View.Prelude

data IndexView = IndexView { users :: [User] }

instance View IndexView ViewContext where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={UsersAction}>Users</a></li>
            </ol>
        </nav>
        <h1>Users</h1>
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Email</th>
                        <th>Failed Logins</th>
                        <th>Locked for</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>{forEach users renderUser}</tbody>
            </table>
        </div>
    |]

renderUser :: User -> Html
renderUser user = [hsx|
    <tr>
        <td>{get #email user}</td>
        <td>{get #failedLoginAttempts user}</td>
        <td>{get #lockedAt user}</td>
        <td><a href={DeleteUserAction (get #id user)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
