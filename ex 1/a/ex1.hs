module Ex1 where

-------- Capítulo 2 --------

-- Exercício 2.3:
revertList :: [String] -> [String]
revertList = map reverse

-- Exercício 2.4:
getLengths :: [String] -> [Int]
getLengths = map length 

-------- Capítulo 3 --------

-- Exercício 3.2
data Temperatura = Celsius | Fahrenheit | Kelvin
    deriving (Show, Eq)

converterCelsius :: Double -> Temperatura -> Double
converterCelsius temperatura escala
    | escala == Fahrenheit = (temperatura * 9/5) + 32 
    | escala == Kelvin = temperatura + 273.15
    | otherwise = temperatura

converterFahrenheit :: Double -> Temperatura -> Double
converterFahrenheit temperatura escala
    | escala == Celsius = (temperatura - 32) * 5/9 
    | escala == Kelvin = (temperatura - 32) * 5/9 + 273.15 
    | otherwise = temperatura

converterKelvin :: Double -> Temperatura -> Double
converterKelvin temperatura escala
    | escala == Celsius = temperatura - 273.15
    | escala == Fahrenheit = (temperatura - 273.15) * 9/5 + 32  
    | otherwise = temperatura

-- Exercício 3.3:
data RockPaperScissors = Rock | Paper | Scissors
    deriving (Show, Eq)

matchUp :: RockPaperScissors -> RockPaperScissors -> Maybe RockPaperScissors    
matchUp x y
    | x == Rock && y == Paper = Just Paper
    | x == Rock && y == Scissors = Just Rock
    | x == Paper && y == Rock = Just Paper
    | x == Paper && y == Scissors = Just Scissors
    | x == Scissors && y == Paper = Just Scissors
    | x == Scissors && y == Rock = Just Rock
    | otherwise = Nothing
