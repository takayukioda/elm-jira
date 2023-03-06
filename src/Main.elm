module Main exposing (..)

import Browser
import Html exposing (Attribute, Html, article, div, h1, node, section, span, text)
import Html.Attributes exposing (attribute, style)



-- Main


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- Model


type Model
    = None


init : () -> ( Model, Cmd Msg )
init _ =
    ( None, Cmd.none )



-- Update


type Msg
    = NoMsg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoMsg ->
            ( model, Cmd.none )



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- View


view : Model -> Html Msg
view model =
    div []
        [ viewCard
        , styleNode
        ]


viewCard : Html Msg
viewCard =
    article [ attribute "class" "card" ]
        [ h1 [ attribute "class" "title" ] [ text "title" ]
        , section [ attribute "class" "tags" ]
            [ span [ attribute "class" "tag epic" ] [ text "epic" ]
            , span [ attribute "class" "tag due" ] [ text "due" ]
            ]
        , section []
            [ span [ attribute "class" "icon issuetype" ] [ text "issuetype" ]
            , span [ attribute "class" "issuekey" ] [ text "issuekey" ]
            , span [ attribute "class" "icon priority" ] [ text "priority" ]
            , span [ attribute "class" "icon assignee" ] [ text "assignee" ]
            ]
        ]


styleNode : Html msg
styleNode =
    node "style"
        []
        [ text """
        .card {
            width: 270px;
            border: 1px solid black;
            border-radius: 5px;
            padding: 12px;
        }
        .card > .title {
            font-size: 1rem;
            margin: 0;
        }
        .card > .tags {
            display: flex;
            gap: 8px;
        }
        .card .tag {
            font-size: 0.75rem;
            border-radius: 3px;
            background-color: rgba(0,0,0,0.1);
            font-weight: bold;
            padding: 2px 2px 3px;
        }
        .tag.epic {
            background-color: #EAE6FF;
            color: #403294;
        }
        .tag.due {
            background-color: #FFEBE6;
            color: #DE350B;
        }
        """
        ]
