drop table if exists `tic_tac_toe`;
create table `tic_tac_toe` (
`x` tinyint(1) not null, 
`content` enum ('x', 'o') default null,
PRIMARY KEY (`x`)
)
ENGINE=InnoDB DEFAULT charset=utf8;


insert into tic_tac_toe values (1, NULL), (2, NULL), (3, NULL), (4, NULL), (5, NULL), (6, NULL), (7, NULL), (8, NULL), (9, NULL);

drop table if exists `game_status`;
create table `game_status` (
`status` enum('not active', 'stated', 'ended') not null default 'not active',
`p_turn` enum('P', 'C') default null,
`result` enum ('P wins', 'C wins', 'Draw') default null,
`last_change` timestamp null default null,
ENGINE=InnoDB DEFAULT charset=utf8;


insert into `game_status` values ('not active', null, null, null);

create procedure `clean_board`()
begin
	update tic_tac_toe
	set content = null
    where content='x' or content='o';
end;;


create procedure `play`(x1 tinyint, c1 char)
begin 
	update board 
    set content = c1
    where x=x1;
end;;


    

