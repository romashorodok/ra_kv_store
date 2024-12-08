%%%-------------------------------------------------------------------
%% @doc ra_experiment public API
%% @end
%%%-------------------------------------------------------------------

-module(ra_experiment_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_Type, _Args) ->
    Dispatch = cowboy_router:compile([{'_', [{"/", hello_handler, []}]}]),
    {ok, _} = cowboy:start_clear(http, [{port, 8081}], #{env => #{dispatch => Dispatch}}),
    ra_experiment_sup:start_link().

stop(_State) ->
    ok = cowboy:stop_listener(http).%% internal functions
