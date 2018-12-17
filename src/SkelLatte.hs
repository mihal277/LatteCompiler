module SkelLatte where

-- Haskell module generated by the BNF converter

import AbsLatte
import ErrM
type Result = Err String

failure :: Show a => a -> Result
failure x = Bad $ "Undefined case: " ++ show x

transIdent :: Ident -> Result
transIdent x = case x of
  Ident string -> failure x
transUIdent :: UIdent -> Result
transUIdent x = case x of
  UIdent string -> failure x
transProgram :: Program -> Result
transProgram x = case x of
  Program topdefs -> failure x
transTopDef :: TopDef -> Result
transTopDef x = case x of
  FnDef type_ ident args block -> failure x
  ClassDef classheader classfields -> failure x
  StructDef structheader structfields -> failure x
transArg :: Arg -> Result
transArg x = case x of
  Arg type_ ident -> failure x
transClassHeader :: ClassHeader -> Result
transClassHeader x = case x of
  ClassDec uident -> failure x
  ClassDecExt uident type_ -> failure x
transClassField :: ClassField -> Result
transClassField x = case x of
  ClassFieldVar type_ items -> failure x
  ClassFieldMeth topdef -> failure x
transStructHeader :: StructHeader -> Result
transStructHeader x = case x of
  StructDec ident -> failure x
transStructField :: StructField -> Result
transStructField x = case x of
  StructField type_ items -> failure x
transBlock :: Block -> Result
transBlock x = case x of
  Block stmts -> failure x
transStmt :: Stmt -> Result
transStmt x = case x of
  Empty -> failure x
  BStmt block -> failure x
  Decl type_ items -> failure x
  Ass ident expr -> failure x
  ArrAss ident dimexpr expr -> failure x
  StructAss ident1 ident2 expr -> failure x
  Incr ident -> failure x
  Decr ident -> failure x
  Ret expr -> failure x
  VRet -> failure x
  Cond expr stmt -> failure x
  CondElse expr stmt1 stmt2 -> failure x
  While expr stmt -> failure x
  For type_ ident1 ident2 stmt -> failure x
  SExp expr -> failure x
transItem :: Item -> Result
transItem x = case x of
  NoInit ident -> failure x
  Init ident expr -> failure x
transType :: Type -> Result
transType x = case x of
  Int -> failure x
  Str -> failure x
  Bool -> failure x
  Void -> failure x
  Arr type_ -> failure x
  Class uident -> failure x
  Struct ident -> failure x
  Fun type_ types -> failure x
transExpr :: Expr -> Result
transExpr x = case x of
  EVar ident -> failure x
  ELitInt integer -> failure x
  ELitTrue -> failure x
  ELitFalse -> failure x
  EApp ident exprs -> failure x
  EAppMeth ident1 ident2 exprs -> failure x
  EObjVar ident1 ident2 -> failure x
  ENewArr type_ dimexpr -> failure x
  ENewObj uident -> failure x
  ENewSObj ident -> failure x
  EArrElem ident dimexpr -> failure x
  EString string -> failure x
  ENullSim ident -> failure x
  ENullCl uident -> failure x
  Neg expr -> failure x
  Not expr -> failure x
  EMul expr1 mulop expr2 -> failure x
  EAdd expr1 addop expr2 -> failure x
  ERel expr1 relop expr2 -> failure x
  EAnd expr1 expr2 -> failure x
  EOr expr1 expr2 -> failure x
transDimExpr :: DimExpr -> Result
transDimExpr x = case x of
  EDim expr -> failure x
transAddOp :: AddOp -> Result
transAddOp x = case x of
  Plus -> failure x
  Minus -> failure x
transMulOp :: MulOp -> Result
transMulOp x = case x of
  Times -> failure x
  Div -> failure x
  Mod -> failure x
transRelOp :: RelOp -> Result
transRelOp x = case x of
  LTH -> failure x
  LE -> failure x
  GTH -> failure x
  GE -> failure x
  EQU -> failure x
  NE -> failure x

