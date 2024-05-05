//
//  TLBtn.swift
//  toDoApp
//
//  Created by Arika I on 2024-05-05.
//

import SwiftUI

struct TLBtn: View {
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

struct TLBtn_Previews: PreviewProvider {
    static var previews: some View {
        TLBtn(title: "Value",
              background: .pink){
            //action
        }
    }

}
