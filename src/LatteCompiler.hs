module Main where
 
import Control.Monad.Error

import Data.List (intercalate)
import Data.Monoid (appEndo)

import System.Environment
import System.Exit (die)
import System.IO (readFile, writeFile)
import System.FilePath.Posix (replaceExtension)

import ParLatte
import AbsLatte 
import ErrM(Err(Bad), Err(Ok))

import AssemblyGenerator (generateAssembly)
import StaticChecker (performStaticCheck)

getPath :: [String] -> IO String
getPath [] = die "Error\nWrong number of parameters"
getPath (h:t) = 
  if null t then 
    return h 
  else 
    die "Error\nWrong number of parameters"

getProgramTree :: Err a -> IO a
getProgramTree parsingResult = 
  case parsingResult of
    Bad error -> die $ "Error\n" ++ error
    Ok parsed -> return parsed

validateStaticCheckResult :: Either String () -> IO ()
validateStaticCheckResult staticCheckResult = 
  case staticCheckResult of
    Left error -> die $ "Error\n" ++ error
    Right () -> return ()

getAssembly :: Program -> IO String
getAssembly program = do
  (errorData, result) <- generateAssembly program
  case errorData of
    Left error -> die $ "Error\n" ++ error
    Right () -> return $ intercalate "\n" $ appEndo result []

saveAssemblyFile :: String -> String -> IO ()
saveAssemblyFile inputPath code = do
  let assemblyExtension = replaceExtension inputPath ".s"
  writeFile assemblyExtension code
              
main = do
  args <- getArgs
  inputPath <- getPath args
  latteCode <- readFile inputPath
  let parsingResult = pProgram $ myLexer latteCode
  programTree <- getProgramTree parsingResult
  print programTree
  let staticCheckResult = performStaticCheck programTree
  validateStaticCheckResult staticCheckResult
  assemblyCode <- getAssembly programTree
  saveAssemblyFile inputPath assemblyCode



