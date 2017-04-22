% An OTP service that will restart a process if it dies
% http://erlang.org/doc/man/supervisor.html

% Documentation for building a simple OTP server
% http://learnyousomeerlang.com/what-is-otp
% http://learnyousomeerlang.com/building-applications-with-otp
% http://learnyousomeerlang.com/building-otp-applications
% https://medium.com/@kansi/chatbus-build-your-first-multi-user-chat-room-app-with-erlang-otp-b55f72064901

-module(day3).
-export([monitorLoop/0]).

-behaviour(supervisor).
-export([init/1]).
-export([start/0]).

translateLoop() ->
    receive
        "nihao" ->
            io:format("nihao translates to hi~n"),
            translateLoop();
        "zaijian" ->
            io:format("zaijian translates to bye~n"),
            translateLoop();
        kill ->
            io:format("Translator process ~p killing self~n", [self()]),
            exit({ translator, die, at, erlang:time() });
        _ ->
            io:format("unknown word~n"),
            translateLoop()
    end.

% Monitor the translate_service and restart it should it die.
monitorLoop() ->
	io:fwrite("Starting monitorLoop~n"),
    process_flag(trap_exit, true),
    receive
        startTranslator ->
            io:format("monitorLoop reveived startTranslator message, creating and monitoring a new translator~n"),
            register(translator, spawn_link(fun translateLoop/0)),
            monitorLoop();

        { 'EXIT', From, Reason } ->
            io:format("a translator process ~p died with reason ~p.~n", [From,Reason]),
            self() ! startTranslator,
            monitorLoop();

        kill ->
            io:format("monitorLoop reveived kill message, monitorLoop process ~p killing self~n", [self()]),
            exit({ monitor })
    end.


% Make the Doctor process restart itself if it should die.
% Make a monitor for the Doctor monitor. If either monitor dies, restart it.

% implement the supervisor behaviour
start() ->
    io:fwrite("Starting supervisor demo.~nSpawn monitorLoop process and link to monitor atom.~nSend monitor a startTranslator message.~n"),
    Pid = spawn_link(day3, monitorLoop, []),
    register(monitor, Pid),
    monitor ! startTranslator,
    {ok, Pid}.

init(_Args) ->
	{ok, {{one_for_one, 1,60},
		[{day3, {day3, start, []},
			permanent, brutal_kill, worker, [day3]}]}}.


% c(day3).
% supervisor:start_link(day3,[]).

% these can't all be pasted in at once,
% enter them one at a time so erlang has time to restart the dead processes before messages are sent

% translator ! "nihao".
% translator ! kill.
% translator ! "zaijian".
% monitor ! kill.
