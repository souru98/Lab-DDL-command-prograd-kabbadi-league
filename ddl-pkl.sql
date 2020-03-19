-- PROGRESSION - 1


-- 1. **Create table city**

CREATE TABLE city(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
CONSTRAINT city PRIMARY KEY(id)
);

-- 2. **Create table referee**

CREATE TABLE referee(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
CONSTRAINT referee PRIMARY KEY(id)
);

-- 3. **Create table innings**

CREATE TABLE innings(
id NUMBER(11),
innings_number NUMBER(11) NOT NULL,
CONSTRAINT innings PRIMARY KEY(id)
);

-- 4. **Create table extra_type**

CREATE TABLE extra_type(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
CONSTRAINT extra_type PRIMARY KEY(id)
);

-- 5. **Create table skill**

CREATE TABLE skill(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
CONSTRAINT skill PRIMARY KEY(id)
);

-- 6. **Create table team**

CREATE TABLE team(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
coach VARCHAR(50) NOT NULL,
home_city NUMBER(11),
captain NUMBER(11) NOT NULL,
CONSTRAINT fk_CITY
FOREIGN KEY (HOME_CITY)
REFERENCES CITY(ID),
CONSTRAINT team PRIMARY KEY(id)
);

-- 7. **Create table player**
CREATE TABLE player(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL,
skill_id NUMBER(11),
team_id NUMBER(11),
CONSTRAINT FK_CITYID
FOREIGN KEY (CITY_ID)
REFERENCES CITY(ID),
CONSTRAINT player PRIMARY KEY(id)
);


-- 8. **Create table venue**

CREATE TABLE venue(
id NUMBER(11),
stadium_name VARCHAR(50) NOT NULL,
city_id NUMBER(11),
CONSTRAINT FK_CITYID
FOREIGN KEY (CITY_ID)
REFERENCES CITY(ID),
CONSTRAINT venue PRIMARY KEY(id)
);

-- 9. **Create table event**

CREATE TABLE event(
id NUMBER(11),
innings_id NUMBER(11),
events_no NUMBER(11) NOT NULL,
raide_id NUMBER(11),
raider_points NUMBER(11) NOT NULL,
defending_points NUMBER(11) NOT NULL,
clock_in_seconds NUMBER(11) NOT NULL,
team_one_score NUMBER(11) NOT NULL,
team_two_score NUMBER(11) NOT NULL,
 FOREIGN KEY (INNINGS_ID)
REFERENCES INNINGS(ID),
CONSTRAINT FK_PLAYER
FOREIGN KEY (RAIDER_ID)
REFERENCES PLAYER(ID),
CONSTRAINT event PRIMARY KEY(id)
);

-- 10. **Create table extra_event**

CREATE TABLE extra_event(
id NUMBER(11),
event_id NUMBER(11),
extra_type_id NUMBER(11),
points NUMBER(11) NOT NULL,
scoring_team_id NUMBER(11),
CONSTRAINT FK_EVENT
FOREIGN KEY (EVENT_ID)
REFERENCES EVENT(ID),
CONSTRAINT FK_EXTRA_TYPE
 FOREIGN KEY (EXTRA_TYPE_ID)
REFERENCES EXTRA_TYPE(ID),
CONSTRAINT FK_SCORING_TEAM,
FOREIGN KEY (SCORING_TEAM_ID)
REFERENCES TEAM(ID),
CONSTRAINT extra_event PRIMARY KEY(id)
);

-- 11. **Create table outcome**

CREATE TABLE outcome(
id NUMBER(11),
status VARCHAR(100) NOT NULL,
winner_team_id NUMBER(11),
score NUMBER(11) NULL,
player_of_match NUMBER(11),
 CONSTRAINT FK_WINNERTEAMID
    FOREIGN KEY (WINNER_TEAM_ID)
    REFERENCES TEAM(ID),
  CONSTRAINT FK_PLAYEROFMATCH
    FOREIGN KEY (PLAYER_OF_MATCH)
    REFERENCES PLAYER(ID),
CONSTRAINT outcome PRIMARY KEY(id)
);

-- 12. **Create table game**

CREATE TABLE game(
id NUMBER(11),
game_date DATE  NOT NULL,
team_id_1 NUMBER(11),
team_id_2 NUMBER(11),
venue_id NUMBER(11),
outcome_id NUMBER(11),
referee_id_1 NUMBER(11),
referee_id_2 NUMBER(11),
first_innings_id NUMBER(11),
second_innings_id NUMBER(11),
CONSTRAINT game PRIMARY KEY(id)
);

-- 13. **Drop table city**

DROP TABLE city;

-- 14. **Drop table innings**

DROP TABLE innings;

-- 15. **Drop table skill**

DROP TABLE skill;

-- 16. **Drop table extra_type**

DROP TABLE extra_type;
