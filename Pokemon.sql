--Creation
CREATE TABLE Pokemon
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    "Name" VARCHAR(50) NOT NULL,
    Height VARCHAR(25) NOT NULL,
    "Weight" VARCHAR(25) NOT NULL,
);

CREATE TABLE "Type"
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    "Name" VARCHAR(20) NOT NULL,
);

CREATE TABLE PokemonType 
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    PokemonId INT FOREIGN KEY REFERENCES Pokemon(Id),
    TypeId INT FOREIGN KEY REFERENCES "Type"(Id),
);

--Insertion
INSERT Pokemon
    ("Name", Height, "Weight")
VALUES
    ('Bulbasaur', '70', '7'),
    ('Ditto', '3', '40');

INSERT "Type"
    ("Name")
VALUES
    ('Normal'),
    ('Grass');

INSERT PokemonType
    (PokemonId, TypeId)
VALUES
    (1, 2),
    (2, 1);

SELECT p.Id, p.Name, p.Weight, p.Height, t.id, t."Name", t.Id
FROM Pokemon AS p
LEFT JOIN PokemonType AS pt
ON p.Id = pt.PokemonId
LEFT JOIN "Type" AS t
ON pt.TypeId = t.Id;