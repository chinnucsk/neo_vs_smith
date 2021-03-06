-module(smith_clone_srv).

-behaviour(gen_server).

-export([start_link/0]).

-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

start_link() ->
    gen_server:start_link(?MODULE, [], []).

init(_) ->
    {ok, ok}.

handle_call(eval, _From, State) ->
    {reply, State}.

handle_cast({beat}, State) ->
    erlang:display("Smith's clone " ++ pid_to_list(self()) ++ ": attacking Neo"),

    {noreply, State};
handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
