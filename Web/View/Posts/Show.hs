module Web.View.Posts.Show where
import Web.View.Prelude
import qualified Text.MMark as MMark

data ShowView = ShowView { post :: Include "comments" Post }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PostsAction}>Posts</a></li>
                <li class="breadcrumb-item active">Show Post</li>
            </ol>
        </nav>
        <div class="blog-header">
          <h1>{get #title post}</h1>
          <div class="createdAt"><p><i>{get #createdAt post |> timeAgo}</i></p></div>
          <div class="hide">{get #createdAt post}</div>
        </div>
        <div class="blogpost" style="overflow:auto">{get #body post |> renderMarkdown}</div>
        <div class="comment-section">
          <p/><a href={NewCommentAction (get #id post)}>Add Comment</a>
          <div class="comment">{forEach (get #comments post) renderComment}</div>
        </div>
    |]

renderMarkdown text =
    case text |> MMark.parse "" of
        Left error -> "Something went wrong"
        Right markdown -> MMark.render markdown |> tshow |> preEscapedToHtml

renderComment comment = [hsx|
        <div class="comment">
            <h5>{get #author comment ++ " "} says:</h5>
            <p><i>{get #body comment}</i></p>
        </div>
    |]
