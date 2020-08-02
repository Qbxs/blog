module Web.FrontController where
import IHP.RouterPrelude
import IHP.ControllerSupport
import Generated.Types
import Web.Types

-- Controller Imports
import Web.Controller.Comments
import Web.Controller.Posts
import IHP.Welcome.Controller
import IHP.LoginSupport.Middleware
import Web.Controller.Sessions
import Web.Controller.Users

instance FrontController WebApplication where
    controllers =
        [ startPage WelcomeAction
        -- Generator Marker
        , parseRoute @CommentsController
        , parseRoute @PostsController
        , parseRoute @SessionsController
        , parseRoute @UsersController
        ]

instance InitControllerContext WebApplication where
    initContext =
        initAuthentication @User
