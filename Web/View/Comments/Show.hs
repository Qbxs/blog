module Web.View.Comments.Show where
import Web.View.Prelude

data ShowView = ShowView
    { comment :: Comment
    , post :: Post
    }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={CommentsAction}>Comments</a></li>
                <li class="breadcrumb-item active">Show Comment</li>
            </ol>
        </nav>
        <h1>Show Comment for Post <a href={ShowPostAction (get #id post)}>{get #title post}</a></h1>
        <p>{get #body comment}</p>
        <p>by {get #author comment},  <i>{get #createdAt comment |> timeAgo}</i></p>
        <p>Email: <a href={"mailto:" ++ get #email comment ++ "?Subject=Your Comment"}>{get #email comment}</a></p>
    |]
