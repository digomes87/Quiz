/*
    Este aquivo existe porque por padrao swift nao embaralha as informaçoes do vetor
    Como temos um quiz aqui é interressante criamos um arquivos que relaize essa funcao
*/

import Foundation

extension Array
{
    /** Randomizes the order of an array's elements. */
    mutating func shuffle()
    {
        for _ in 0..<10
        {
            sortInPlace { (_,_) in arc4random() < arc4random() }
        }
    }
}