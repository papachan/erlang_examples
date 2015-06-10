-module(personRecord).

-export([
    lookup/0,
    demo/0
    ]).

-include("person.hrl").

demo() ->
    P = create_record(),
    print_record(P),
    io:format("record size: ~p~n",[record_info(size,person)]),
    io:format("record fields: ~p~n",[record_info(fields,person)]),
    P1 = update_record(P),
    print_record1(P1).


%% Create a Reecord
create_record() -> 
    #person{name = "John",
            phone = "333-555-2222", 
            address = "Street 100th"
            }.


update_record(Record) -> 
    Record#person{  name = "Tom",
                    phone = "333-555-2222",
                    address = "5th Avenue"
                }.  

print_record(#person{name=Name, phone=phone, address=AddressRecord}) -> 
                    io:format("Name: ~p phone: ~p Address: ~p ~n", 
                              [Name, phone, AddressRecord]).


print_record1(Record) when is_record(Record, person) -> 
                        io:format("Name: ~p ~n", [Record#person.name]),
                        io:format("phone: ~p ~n", [Record#person.phone]),
                        io:format("Address: ~p ~n", [Record#person.address]).

lookup() ->
    io:format("result ~n").


% > rd(person, {name = "", phone = [], address}).
% > P = #person{name = "Joe", phone = [0,8,2,3,4,3,1,2]}.
% > P#person.name.                                       
% "Joe"
