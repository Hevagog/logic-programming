% Dynamic predicates used
% to store the contacts names
:- dynamic is_contact/1.
:- dynamic out/1.
% Main loop:
% - reads a command
% - processes the command
% - loops ;)
main :- 
    read_command(Command),
    process_command(Command),
    \+out(won),
    main.

% Predicate reading command from the standard input
% Available commands:
% - "add" - add contact
% - "del" - remove contact
% - "list" - print all the contacts
% - "help" - show help
% - "exit" - exit the program
read_command(Command) :- read(Command).

% Predicate responsible for the 'help' command
% You need to create four more `process_command` clauses,
% In case user choose an incorrect command, the program should
% inform user about his mistake and continue working


process_command(add) :-
    read(New_contact),
    \+is_contact(New_contact),
    write("Adding new Contact "), write(New_contact),nl,
    assert(is_contact(New_contact)).

process_command(del) :-
    read(Dontact),
    write("Deleting new Contact "), write(Dontact),nl,
    retract(is_contact(Dontact)).
    
process_command(list) :-
    is_contact(Contact),
    write(Contact), nl,
    fail.
          
process_command(help) :- 
    writeln("Available commands:"),
    writeln("- 'add' - add contact"),
    writeln("- 'del' - remove contact"),
    writeln("- 'list' - print all the contacts"),
    writeln("- 'help' - show help"),
    writeln("- 'exit' - exit the program").    

process_command(exit) :-
	retractall(is_contact),
	assert(out(won)).

process_command(Command) :-
    writeln("I don't understand").


% @tbd: write missing clauses to handle all the commands!
