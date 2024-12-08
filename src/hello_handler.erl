-module(hello_handler).

-export([init/2]).
-export([content_types_provided/2]).
-export([hello_handler_to_html/2]).
-export([hello_handler_to_json/2]).
-export([hello_handler_to_text/2]).

init(Req, Opts) ->
    {cowboy_rest, Req, Opts}.

content_types_provided(Req, State) ->
    {[{<<"text/html">>, hello_handler_to_html},
      {<<"application/json">>, hello_handler_to_json},
      {<<"text/plain">>, hello_handler_to_text}],
     Req,
     State}.

hello_handler_to_html(Req, State) ->
    Body =
        <<"<html>\n<head>\n\t<meta charset=\"utf-8\">\n\t<title>REST Hello "
          "World!</title>\n</head>\n<body>\n\t<p>REST Hello World as HTML!</p>\n"
          "</body>\n</html>">>,
    {Body, Req, State}.

hello_handler_to_json(Req, State) ->
    Body = <<"{\"rest\": \"Hello World!\"}">>,
    {Body, Req, State}.

hello_handler_to_text(Req, State) ->
    {<<"REST Hello World as text!">>, Req, State}.
