module Web.View.Comments.Index where
import Web.View.Prelude

data IndexView = IndexView { comments :: [Comment] }

instance View IndexView ViewContext where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={CommentsAction}>Comments</a></li>
            </ol>
        </nav>
        <h1>Comments</h1>
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Author</th>
                        <th>Text</th>
                        <th>Email</th>
                        <th>Created</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>{forEach comments renderComment}</tbody>
            </table>
        </div>
    |]


renderComment comment = [hsx|
    <tr onclick={ShowCommentAction (get #id comment)} class="clickable">
        <td>{get #author comment}</td>
        <td><a href={ShowCommentAction (get #id comment)}>{get #body comment}</a></td>
        <td><a href={"mailto:" ++ get #email comment ++ "?Subject=Your Comment"}>{get #email comment}</a></td>
        <td>{get #createdAt comment |> dateTime}</td>
        <td><a href={EditCommentAction (get #id comment)} class="text-muted">Edit</a> /
            <a href={DeleteCommentAction (get #id comment)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
