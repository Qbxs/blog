module Web.View.Layout (defaultLayout, Html) where

import IHP.ViewPrelude
import IHP.Environment
import qualified Text.Blaze.Html5            as H
import qualified Text.Blaze.Html5.Attributes as A
import Web.Types
import Web.Routes
import qualified IHP.FrameworkConfig as FrameworkConfig
import Config ()

type Html = HtmlWithContext ViewContext

defaultLayout :: Html -> Html
defaultLayout inner = H.docTypeHtml ! A.lang "en" $ [hsx|
<head>
    {metaTags}

    {stylesheets}
    {scripts}

    <title>My Amazing Blog</title>
</head>
<body>
    <div class="header">
      <a>My Amazing Blog</a>
      <a href={NewSessionAction}>Login</a>
    </div>
    {carousel}
    <div class="main">
        {renderFlashMessages}
        {inner}
    </div>
    <div class="footer">
        Copyright 2020, Pascal Engel
    </div>
</body>
|]

carousel = [hsx|
	<div class="carousel">
		<div class="carousel slide" id="main-carousel" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#main-carousel" data-slide-to="0" class="active"></li>
				<li data-target="#main-carousel" data-slide-to="1"></li>
				<li data-target="#main-carousel" data-slide-to="2"></li>
				<li data-target="#main-carousel" data-slide-to="3"></li>
			</ol>

      <div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block img-fluid" src="saomiguel.jpeg" alt="">
					<div class="carousel-caption d-none d-md-block">
						<h3>Vila Franco do Campo</h3>
            <p>São Miguel, Portugal</p>
					</div>
				</div>
        <div class="carousel-item">
					<img class="d-block img-fluid" src="sevilla.jpeg" alt="">
					<div class="carousel-caption d-none d-md-block">
						<h3>Las Setas</h3>
            <p>Sevilla, Spain</p>
					</div>
				</div>
        <div class="carousel-item">
					<img class="d-block img-fluid" src="tuebingen.jpeg" alt="">
					<div class="carousel-caption d-none d-md-block">
						<h3>Neckarbrücke</h3>
            <p>Tübingen, Germany</p>
					</div>
				</div>
        <div class="carousel-item">
					<img class="d-block img-fluid" src="ledro.jpeg" alt="">
					<div class="carousel-caption d-none d-md-block">
						<h3>Valle di Ledro</h3>
            <p>Trentino, Italy</p>
					</div>
				</div>
			</div>

			<a href="#main-carousel" class="carousel-control-prev" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
				<span class="sr-only" aria-hidden="true">Prev</span>
			</a>
			<a href="#main-carousel" class="carousel-control-next" data-slide="next">
				<span class="carousel-control-next-icon"></span>
				<span class="sr-only" aria-hidden="true">Next</span>
			</a>
		</div>
	</div>
|]

stylesheets = do
    when (isDevelopment FrameworkConfig.environment) [hsx|
        <link rel="stylesheet" href="/vendor/bootstrap.min.css"/>
        <link rel="stylesheet" href="/vendor/flatpickr.min.css"/>
        <link rel="stylesheet" href="/app.css"/>
    |]
    when (isProduction FrameworkConfig.environment) [hsx|
        <link rel="stylesheet" href="/prod.css"/>
    |]

scripts = do
    when (isDevelopment FrameworkConfig.environment) [hsx|
        <script id="livereload-script" src="/livereload.js"></script>
        <script src="/vendor/jquery-3.2.1.slim.min.js"></script>
        <script src="/vendor/timeago.js"></script>
        <script src="/vendor/popper.min.js"></script>
        <script src="/vendor/bootstrap.min.js"></script>
        <script src="/vendor/flatpickr.js"></script>
        <script src="/helpers.js"></script>
        <script src="/vendor/morphdom-umd.min.js"></script>
    |]
    when (isProduction FrameworkConfig.environment) [hsx|
        <script src="/prod.js"></script>
    |]


metaTags = [hsx|
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta property="og:title" content="App"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="TODO"/>
    <meta property="og:description" content="TODO"/>
|]
