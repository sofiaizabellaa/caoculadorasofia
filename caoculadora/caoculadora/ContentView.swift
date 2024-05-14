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
    @State var porteSelecionado: Portes = .pequeno
    
    var body: some View {
        VStack (alignment: . leading){
            Text ("Qual a idade do seu cão?")
                .font(.header5)
                .foregroundStyle(.indigo)
            
            Text ("Anos")
                .font(.body1)
                .foregroundStyle(.indigo)
            TextField ("Quantos anos completos tem seu dog?",
                       value: $years,
                       format: .number)
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
            
            Text ("Meses")
                .font(.body1)
                .foregroundStyle(.indigo)
            TextField (
                "E quantos meses além disso ele tem?", value: $months,
                format: .number)
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
            
            Text ("Porte")
                .foregroundStyle(.indigo)
                .font(.body1)
            
            Picker("Portes", selection: $porteSelecionado) {
                ForEach(Portes.allCases, id: \.self) {
                    porte in Text(porte.rawValue)
                }
            }
            .pickerStyle(.segmented)
            
            Divider()
            
            Spacer()
            
            if let result {
                Text ("Seu cachorro tem idade humana...")
                    .font(.body1)
                    .foregroundStyle(.indigo)
                Text ("\(result) anos")
                    .font(.display)
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
                .font(.body1)
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
        result = porteSelecionado.calcularIdade(deAnos: years, emeses: months)
    }
}

#Preview {
    ContentView()
}
