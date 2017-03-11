%% -*- mode: erlang; erlang-indent-level: 2 -*-
%%% Created : 11 Jul 2015 by mats cronqvist <masse@klarna.com>

%% @doc
%% @end

-module('prfTime').
-export([ts/0]).

-ifdef(NO_ERLANG_TIMESTAMP).
ts() -> erlang:now().
-else.
ts() -> erlang:timestamp().
-endif.
