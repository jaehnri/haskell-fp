{-* 

Demonstracão de que  3 * a ≡ a + a + a

---------------------------------------------------------------------------

Para essa prova, vamos criar os dois tipos a seguir:
*-}

data Choice one two three = OneOf3 one | TwoOf3 two | ThreeOf3 three

data ChoiceOperation = One | Two | Three 

{-*
Caso consigamos provar que esses tipos são isomorfos entre si, podemos
concluir diretamente que 3 * a ≡ a + a + a

O tipo Choice, acima, foi baseado nas seguintes referências:
- https://stackoverflow.com/questions/38814022/standard-name-of-a-sum-type-like-either-but-for-3-cases
- http://hackage.haskell.org/package/oneOfN-0.1.0.1/docs/Data-OneOfN.html

---------------------------------------------------------------------------
 
Sabemos que:
- Choice a a a ≡ (3, a) 
- Choice a a a ≡ (One | Two | Three, a);

Sendo assim, nossas funcões ida e volta são:
*-}

ida :: (ChoiceOperation, a) -> Choice a a a
ida (operation, a) =
  case operation of
    One -> OneOf3 a
    Two -> TwoOf3 a
    Three -> ThreeOf3 a

volta :: Choice a a a -> (ChoiceOperation, a)
volta operation =
  case operation of
    OneOf3 a -> (One, a)
    TwoOf3 a -> (Two, a)
    ThreeOf3 a -> (Three, a)

---------------------------------------------------------------------------

{-* 

Para provar o isomorfismo entre as duas estruturas acima, precisamos provar que: 
- ida(volta) é a funcão identidade
- volta(ida) é a funcão identidade


Vamos então comecar pela ida:

ida (volta OneOf3 a) 
=> ida (One, a) 
=> OneOf3 a

ida (volta TwoOf3 a) 
=> ida (Two, a) 
=> TwoOf3 a

ida (volta ThreeOf3 a) 
=> ida (Three, a) 
=> ThreeOf3 a

Ou seja, do L.H.S., podemos concluir que ida (volta operation) = operation
Agora, precisamos voltar também a volta (R.H.S):

volta (ida (One, a))
=> volta OneOf3 a
=> (One, a)

volta (ida (Two, a))
=> volta TwoOf3 a
=> (Two, a)

volta (ida (Three, a))
=> volta ThreeOf3 a
=> (Three, a)

Sendo assim, mostramos que, tanto do L.H.S. quanto to R.H.S., temos que a 
composicão da ida e da volta age como a funcão identidade.

Como provamos que (One, Two, Three, a) e Choice a a a são isomorfas entre si,
temos que 3 * a ≡ a + a + a

                                                                        Q.E.D