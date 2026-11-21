% Name Game
% Lab 9 - IO Stream and Database Manipulation

:- dynamic letter/1.

% Start with initial letters

start :-
    retractall(letter(_)),
    assertz(letter(a)),
    assertz(letter(b)),
    assertz(letter(c)),
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters'), nl,
    write('in which you will add, delete or move to create your name.'), nl,
    menu.

% Display menu

menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice: '),
    read(Choice),
    option(Choice).

% Option 1: Display letters

option(1) :-
    findall(X, letter(X), L),
    write('Current set of letters: '),
    write(L), nl,
    menu.

% Option 2: Add a letter

option(2) :-
    write('Enter a letter: '),
    read(X),
    assert(letter(X)),
    write('Letter added successfully.'), nl,
    menu.

% Option 3: Add a letter at the top

option(3) :-
    write('Enter a letter: '),
    read(X),
    asserta(letter(X)),
    write('Letter added at the top.'), nl,
    menu.

% Option 4: Add a letter at the bottom

option(4) :-
    write('Enter a letter: '),
    read(X),
    assertz(letter(X)),
    write('Letter added at the bottom.'), nl,
    menu.

% Option 5: Delete a letter

option(5) :-
    write('Enter a letter to delete: '),
    read(X),
    ( retract(letter(X)) ->
        write('Letter deleted successfully.'), nl
    ;
        write('Letter not found.'), nl
    ),
    menu.

% Option 6: Delete all letters

option(6) :-
    retractall(letter(_)),
    write('All letters deleted.'), nl,
    menu.

% Option 7: Exit

option(7) :-
    write('Thank you for playing the Name Game!'), nl.

% Invalid choice

option(_) :-
    write('Invalid choice. Please try again.'), nl,
    menu.
