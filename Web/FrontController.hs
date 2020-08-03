module Web.FrontController where
import IHP.RouterPrelude
import IHP.ControllerSupport
import Generated.Types
import Web.Types
import IHP.Welcome.Controller
import IHP.LoginSupport.Middleware

-- Controller Imports
import Web.Controller.Comments
import Web.Controller.Posts
import Web.Controller.Sessions
import Web.Controller.Users

instance FrontController WebApplication where
    controllers =
        [ startPage PostsPreviewAction
        , parseRoute @SessionsController
        -- Generator Marker
        , parseRoute @CommentsController
        , parseRoute @PostsController
        , parseRoute @UsersController
        ]

instance InitControllerContext WebApplication where
    initContext =
        initAuthentication @User
