//
//  WishListView.swift
//  WishList
//
//  Created by Claudia Maciel on 11/5/21.
//

import SwiftUI

struct WishListView: View {
    @State var show = false
    @Namespace var namespace
    @Namespace var namespace2
    @State var selectedItem: WishListItem? = nil
    @State var isDisabled = false
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
//    @EnvironmentObject var wishListItem: WishListItem
    @Environment(\.managedObjectContext) private var viewContext
    
    var items: [WishListItem]
    
    var body: some View {
        ZStack {
            if horizontalSizeClass == .compact {
                tabBar
            }
            fullContent
                .background(VisualEffectBlur(
                    blurStyle: .systemMaterial
                ).edgesIgnoringSafeArea(.all))
        }
        .navigationTitle("Wish List")
    }
    var content: some View {
        ScrollView {
            VStack(spacing: 0) {
                LazyVGrid(
                    columns: [
                        GridItem(.adaptive(minimum: 160), spacing: 16)
                    ],
                    spacing: 16) {
                    ForEach(items, id: \.id) { item in
                        VStack {
                            WishListCard(wishListItem: item)
                                .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                                .frame(height: 200)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.4,
                                                          dampingFraction: 0.7,
                                                          blendDuration: 0)) {
                                        show.toggle()
                                        selectedItem = item
                                        isDisabled = true
                                    }
                                }
                                .disabled(isDisabled)
                        }
                        .matchedGeometryEffect(id: "container\(item.id)", in: namespace, isSource: !show)
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity)
                
            }
        }
        .padding(.vertical, 5)
        .zIndex(1)
        .navigationTitle("WishList")
    }
    
    @ViewBuilder
    var fullContent: some View {
        if selectedItem != nil {
            ZStack(alignment: .topTrailing) {
                ItemDetail(item: selectedItem!, namespace: namespace)
                
                CloseButton()
                    .padding(.trailing, 16)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            show.toggle()
                            selectedItem = nil
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                isDisabled = false
                            }
                        }
                    }
            }
            .zIndex(2)
            .frame(maxWidth: 712)
            .frame(maxWidth: .infinity)
        }
    }
    
    var tabBar: some View {
        TabView {
            NavigationView {
                content
            }
            .tabItem {
                Image(systemName: "book.closed")
                Text("Stitches")
            }
            NavigationView {
//                WishListView()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
            NavigationView {
//                WishListView()
            }
            .tabItem {
                Image(systemName: "gearshape")
                Text("Settings")
            }
        }
    }
}

struct WishListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WishListView(items: [itemsPreviewData])
        }
    }
}
