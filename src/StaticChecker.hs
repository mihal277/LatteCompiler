module StaticChecker where

import Control.Monad.Identity
import Control.Monad.Error
import Control.Monad.State
import Control.Monad.Reader
import Control.Monad

import Data.Maybe
import qualified Data.Map as Map

import AbsLatte

type Loc = Int
type VarsEnv = Map.Map PIdent Loc

type Store = Map.Map Loc Type
type Env = VarsEnv

type StaticCheck a = 
  ReaderT Env (StateT Store (ErrorT String Identity)) a

performStaticCheck :: Program -> Either String ()
performStaticCheck program = 
  runStaticCheck Map.empty Map.empty (checkProgram program)

runStaticCheck :: Env -> Store -> StaticCheck a -> Either String a
runStaticCheck env st ev = 
  runIdentity (runErrorT (evalStateT (runReaderT ev env) st))

checkProgram :: Program -> StaticCheck ()
checkProgram (Program topDefs) = return ()