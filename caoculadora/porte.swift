//
//  porte.swift
//  caoculadora
//
//  Created by Sofia Izabella Tenório Chaves on 13/05/24.
//

import Foundation
enum Portes: String, CaseIterable {
    case pequeno = "Pequeno"
    case medio = "Médio"
    case grande = "Grande"
    
    func calcularIdade (deAnos anosCaninos: Int, emeses mesesCaninos: Int) -> Int {
        return 1
        //multiplicador: pequeno 6, médio 7 e se for grande 8
       
        let multiplicador: Int
        switch self {
        case .pequeno:
            multiplicador = 6
        case .medio:
            multiplicador = 7
        case .grande:
            multiplicador = 8
        }
            
    let result = anosCaninos * multiplicador + mesesCaninos * multiplicador/12
        
        return result
        
    }
}


