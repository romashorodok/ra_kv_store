%%%-------------------------------------------------------------------
%% @doc ra_experiment public API
%% @end
%%%-------------------------------------------------------------------

-module(ra_experiment_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    ra_experiment_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
