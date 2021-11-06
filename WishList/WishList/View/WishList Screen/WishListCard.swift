//
//  WishListCard.swift
//  WishList
//
//  Created by Claudia Maciel on 11/5/21.
//

import SwiftUI

struct WishListCard: View {
    var wishListItem: WishListItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Spacer()
            HStack{
                Spacer()
                Image("\(wishListItem.image)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 250, alignment: .center)
                Spacer()
            }
            Spacer()
            Text(wishListItem.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            
            Text(wishListItem.description)
                .font(.footnote)
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
        }
        .padding(16)
        .frame(width: 252, height: 300, alignment: .top)
        .background(Color.black)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .shadow(color: Color.gray.opacity(0.5), radius: 20, x: 0, y: 10 )
    }
}

struct WishListCard_Previews: PreviewProvider {
    static var previews: some View {
        WishListCard(wishListItem: WishListItem(title: "Mac Book Pro", description: "With M1 Chip", image: "M1_Mac_Book_Pro"))
    }
}
