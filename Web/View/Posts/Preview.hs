module Web.View.Posts.Preview where
import Web.View.Prelude

data PreView = PreView { posts :: [Post] }

instance View PreView ViewContext where
    html PreView { .. } = [hsx|
        <h1>News from the Blog</h1>
        {forEach posts renderPost}
    |]

renderPost :: Post -> Html
renderPost post = [hsx|
    <div class="card" style="max-width: 520px; max-height: 320px;">
      <div class="card-body">
        <h5 class="card-title">{get #title post}</h5>
        <h6 class="card-subtitle mb-2 text-muted">{get #createdAt post |> timeAgo}</h6>
        <p class="card-text">{get #body post}</p>
        <a href={ShowPostAction (get #id post)} class="card-link">Read more</a>
      </div>
    </div>
|]
