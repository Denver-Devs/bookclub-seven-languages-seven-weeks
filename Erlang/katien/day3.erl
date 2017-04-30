% Find:
% An OTP service that will restart a process if it dies
% http://erlang.org/doc/design_principles/sup_princ.html - "The basic idea of a supervisor is that it is to keep its child processes alive by restarting them when necessary."
% Documentation for building a simple OTP server
% http://erlang.org/doc/design_principles/gen_server_concepts.html#ex

% Do:
% Monitor the translate_service and restart it should it die.
% Make the Doctor process restart itself if it should die.
% Make a monitor for the Doctor monitor. If either monitor dies, restart it.

-module(day3).
-compile(export_all).

% the translator
translateLoop() ->
    receive
        { Pid, "casa" } ->
            io:format("translator recieved casa ~n", []),
            Pid ! { translation, "house" },
            translateLoop();
        { Pid, "blanca" } ->
            io:format("translator recieved blanca ~n", []),
            Pid ! { translation, "white" },
            translateLoop();
        kill ->
            io:format("Terminating translator.~n"),
            exit({ translateLoop })
    end.

% a monitor for the translator
translatorMonitor() ->
    process_flag(trap_exit, true),

    receive
        startTranslator ->
            io:format("Starting a translator process.~n"),
            register(translator, spawn_link(?MODULE, translateLoop, [])),
            translatorMonitor();
        startMonitorMonitor ->
            io:format("Starting a monitorMonitor process.~n"),
            register(monitorMonitor, spawn_link(?MODULE, monitorMonitor, [])),
            translatorMonitor();
        { 'EXIT', _, { translateLoop }} ->
            self() ! startTranslator,
            translatorMonitor();
        { 'EXIT', _, { monitorMonitor }} ->
            self() ! startMonitorMonitor,
            translatorMonitor();
        kill ->
            io:format("Terminating translatorMonitor.~n"),
            exit({ translatorMonitor })
    end.

% a monitor for the translatorMonitor
monitorMonitor() ->
    process_flag(trap_exit, true),

    receive
        startTranslatorMonitor ->
            io:format("Starting a translatorMonitor process.~n"),
            register(translatorMonitor, spawn_link(?MODULE, translatorMonitor, [])),
            % start a new translator linked to the new translatorMonitor
            translatorMonitor ! startTranslator,
            monitorMonitor();
        kill ->
            io:format("Terminating monitorMonitor.~n"),
            exit({ monitorMonitor });
        { 'EXIT', _, { translatorMonitor }} ->
            self() ! startTranslatorMonitor,
            monitorMonitor()
    end.

% c(day3).
% MonitorMonitor = spawn(day3, monitorMonitor, []).
% MonitorMonitor ! startTranslatorMonitor.
%
% translator ! { self(), "casa" }.
% flush().
% translator ! kill.
% translator ! { self(), "blanca" }.
% flush().
%
% translatorMonitor ! kill.
% translator ! kill.
% translator ! { self(), "casa" }.
% flush().
%
% MonitorMonitor ! kill.
% translatorMonitor ! kill.
% translator ! kill.
% translator ! { self(), "blanca" }.
% flush().


% The following bonus questions will take a little bit of research to com- plete:
% Create a basic OTP server that logs messages to a file. Make the translate_service work across a network.
