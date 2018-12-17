module AssemblyGenerator where

import Control.Monad.Error
import Control.Monad.State
import Control.Monad.Writer
 
import System.IO
import System.Exit
import System.Environment

import AbsLatte

type ErrorMsg = String
type AssemlyLine = String
type AssemlyLines = [AssemlyLine]
type CompilerState = ()

type CompilerM a = ErrorT ErrorMsg (WriterT (Endo AssemlyLines) (StateT CompilerState IO)) a

runCompiler :: CompilerState -> CompilerM a -> IO (Either ErrorMsg a, Endo AssemlyLines)
runCompiler st ev = evalStateT (runWriterT (runErrorT ev)) st

generateAssembly :: Program -> IO (Either ErrorMsg (), Endo AssemlyLines)
generateAssembly (Program topDefs) = runCompiler () (compileTopDefs topDefs)

compileTopDefs :: [TopDef] -> CompilerM ()
compileTopDefs [] = return ()
compileTopDefs (h:t) = return ()