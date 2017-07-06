import Html exposing (text)

-- Tipos
type alias Ambiente = (String -> Int)
type Exp = Num Int | Add Exp Exp | Var String
      {-A partir daqui não foi tirado dos exemplos em aula -}
           | Mult Exp Exp | Divi Exp Exp | Dim Exp Exp
type Comando = Attr String Exp | Seq Comando Comando 
      {-A partir daqui não foi tirado dos exemplos em aula -}
            | IF Exp Comando Comando | WHILE Exp Comando 

-- Funções

avaliaExp: Ambiente -> Exp -> Int
avaliaExp amb e =
    case e of
        Num v      -> v
        Add e1 e2  ->(avaliaExp amb e1) + (avaliaExp amb e2)
        Var nome   ->(amb nome)
        {-A partir daqui não foi tirado dos exemplos em aula -}
        Dim e1 e2  ->(avaliaExp amb e1) - (avaliaExp amb e2)
        Mult e1 e2  ->(avaliaExp amb e1) * (avaliaExp amb e2)
        Divi e1 e2  ->(avaliaExp amb e1) // (avaliaExp amb e2)

avaliaComando: Ambiente -> Comando -> Ambiente
avaliaComando amb cmd = 
            case cmd of
                    Attr nome e    ->  (\nome1 -> if nome == nome1 then 
                                                    (avaliaExp amb e)
                                                  else
                                                    (amb nome1))
                    Seq cmd1 cmd2   -> (avaliaComando (avaliaComando amb cmd1) cmd2)
                    {-A partir daqui não foi tirado dos exemplos em aula -}
                    IF e1 cmd1 cmd2 -> if (avaliaExp amb e1) == 0 then
                                            (avaliaComando amb cmd2)
                                       else
                                            (avaliaComando amb cmd1)
                    WHILE e1 cmd1   -> if (avaliaExp amb e1) == 0 then
                                         (amb)
                                       else
                                         (avaliaComando amb cmd1)
                                         
inicial: Ambiente
inicial nome = 0

prog: Comando
prog = (Seq
            (Attr "ret" (Num 50))
            (Seq
              (WHILE (Var "ret") (Attr "ret" (Dim (Var "ret") (Num 1))))))
             
