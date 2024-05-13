//
//  ContentView.swift
//  caoculadora
//
//  Created by Sofia Izabella Tenório Chaves on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var years: Int?
    @State var months:Int?
    @State var result : Int?
    @State var porteSelecionado = "Pequeno"
    let portes = ["Pequeno", "Médio", "Grande"]
    var body: some View {
        VStack (alignment: . leading){
            Text ("Qual a idade do seu cão?")
            Text ("Anos")
            TextField ("Quantos anos completos tem seu dog?",
                value: $years,
                format: .number
            )
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
            Text ("Meses")
            TextField (
                "E quantos meses além disso ele tem?", value: $months,
                format: .number)
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
            Text ("Porte")
            Picker("Portes", selection: $porteSelecionado) {
                ForEach(portes, id: \.self) {
                    porte in Text (porte)
                }
            }
            .pickerStyle(.segmented)
            
            Divider()
            
            Spacer()
            
            if let result {
                Text ("Seu cachorro tem idade humana...")
                    .foregroundStyle(.indigo)
                Text ("\(result) anos")
                    .bold()
                    .foregroundStyle(.indigo)
                    .frame(maxHeight:150)
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 50))
            } else {
                Image (ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight:150)
                    .frame(maxWidth: .infinity)
                    .shadow(radius: 10)
                
            }
            Spacer()
            Button("Cãocular", action:processYears)
                .frame(maxWidth: .infinity)
                .frame (height: 50)
                .background(.indigo)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .bold()
        }
        .padding()
    }
    func processYears () {
        print ("cãocular")
        //resultado vai ser os anos vezes 7 +  meses * 7 / 12
        guard let years, let months else {
            print ("Campos não preenchidos")
            return  }
        guard months > 0 || years > 0 else {
            print ("Pelo menos um campo deve ser maior que zero")
            return
        }
        //multiplicador: pequeno 6, médio 7 e se for grande 8
        let multiplicador:Int
        switch porteSelecionado {
        case "Pequeno":
            multiplicador = 6
        case "Médio":
            multiplicador = 7
        case "Grande":
            multiplicador = 8
        default:
            multiplicador = 0
        }
    result = years * 7 + months * 7/12 *
        multiplicador / 12
    }
}

#Preview {
    ContentView()
}
