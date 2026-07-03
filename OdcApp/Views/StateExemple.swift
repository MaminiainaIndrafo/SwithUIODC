//
//  StateExemple.swift
//  OdcApp
//
//  Created by Maminiaina Indrafo on 02/07/2026.
//

import SwiftUI

struct StateExemple: View {
    @Bindig var iterator = 0
    
    var body: some View {
        
        HStack(){
            Button(action: {
                    iterator = iterator + 1
                        }) {
                            Text("Next Item")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
            
            Text("Your score is \(iterator)")
            
            

        }
        
        
        
        
        
    }
}



#Preview {
    StateExemple()
}
