//
//  TLButton.swift
//  toDoApp
//
//  Created by Arika I on 2024-05-06.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button{
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
                                 
            }
        }
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "Value",
              background: .pink){
            //action
        }
    }

}
