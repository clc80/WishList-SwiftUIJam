//
//  ItemDetail.swift
//  WishList
//
//  Created by claudia maciel on 11/8/21.
//

import SwiftUI

struct ItemDetail: View {
    var item: WishListItem
    var namespace: Namespace.ID
    
    @State var showModal = false
    
    var body: some View {
        VStack {
            ScrollView {
                Text("Item will go here!")
            }
        }
        .background(Color.blue)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .matchedGeometryEffect(id: "container\(item.id)", in: namespace)
        .edgesIgnoringSafeArea(.all)
    }
}

extension String: Identifiable {
    public var id: String { self }
}

struct ItemDetail_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        ItemDetail(item: itemsPreviewData, namespace: namespace)
    }
}
