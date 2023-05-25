//
//  ContentView.swift
//  HomeWork3
//
//  Created by Chinara on 5/22/23.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State private var data: [Product] = []
    @State private var selectedProduct: Product?
    
    @State var textFromTF: String = ""
    @State var selectIndex: Int = 0
    
    
    var iconArray: [Image] = [Image(systemName: "line.horizontal.3.decrease"),
                              Image("image4"),
                              Image("image5"),
                              Image("image6"),
                              Image("image7")]
    var iconTitle: [String] = ["Delivery", "Take Away Food", "Bell Service", "Delivery", "Price"]
    
    private let menu: [MenuModel] = [
        MenuModel(image: Image("image1"), title: "Tony Roma's", descriptionMenu: " Ribs&Steaks"),
        MenuModel(image: Image("image2"), title: "Momos", descriptionMenu: "Japanese"),
        MenuModel(image: Image("image3"), title: "Paul", descriptionMenu: "French pasta")]
    
    var body: some View {
        NavigationView {
            VStack {
                NavBarView()
                
                HStack {
                    ForEach(0..<5) { index in
                        HorizontalSliderView(image: iconArray[index],
                                             title: iconTitle[index], isSelect: selectIndex == index)
                        .padding()
                        .onTapGesture {
                            selectIndex = index
                        }
                    }
                }
                
                SearchBarView(textFromTF: $textFromTF)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(data, id: \.self) { index in
                            NavigationLink {
                                MenuSelected(image: getImage(url: index.thumbnail),
                                title: index.title ,
                                descriptionMenu: index.description)
                            } label: {
                                MenuSelected(image: getImage(url: index.thumbnail),
                                title: index.title,
                                descriptionMenu:index.description)
                            
                            }
                            
                        }
                        
                    }
                }
                
                
                CustomTextView(title: "For more information please call to our custome service", fontSize: 10, isBold: true, textColor: .pink)
                
                
                
            }
            .onAppear {
                APIManager.shared.getData { result in
                    switch result {
                        
                    case .success(let newsData):
                        DispatchQueue.main.async {
                            data  = newsData.products
                            print(data)
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                
            }
            
        }
    }
}

func getImage(url: String) -> KFImage {
    let urlImage = URL(string: url)
    let kfImage = KFImage(urlImage)
    return kfImage
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NavBarView: View {
    var body: some View {
        
            
        HStack {
            CustomButton(image:Image(systemName:"line.horizontal.decrease")) {
                //
            }
            Spacer()
            Button {
                //
            } label: {
                VStack {
                    CustomTextView(title: "Available Products", fontSize: 16, isBold:false, textColor: .pink)
                    HStack {
                        CustomTextView(title: "Delivering to", fontSize: 18, isBold: true, textColor: .black)
                                Image(systemName: "square.and.arrow.down.fill")
                            }
                        }
                        .foregroundColor(.pink)
                    }
                    Spacer()
                    CustomButton(image: Image("basket")) {
                       //
                    }
                    .padding(.all)
                    .background(.black)
                    .cornerRadius(20)
                    .shadow(radius: 3)
                    .frame(width: 50, height: 47)
                
                }
                .padding(.horizontal)
            }
        }

struct HorizontalSliderView: View {
    var image: Image
    var title: String
    var isSelect: Bool
    
    var body: some View {
        HStack {
            image
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(isSelect ? .white : .black)
            if isSelect {
                CustomTextView(title: title, fontSize: 12, isBold: true, textColor: .black)
            }
        }
        .frame(width: isSelect ? 100 : 30, height: 40)
        .background(isSelect ? .pink : .clear)
        .foregroundColor(isSelect ? .white : .black)
        .cornerRadius(10)
        
        
    }
}

        


struct SearchBarView: View {
    @Binding var textFromTF: String
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Find restaurant by name", text: $textFromTF)
            }
            .padding(.all)
            .background(.white)
            .cornerRadius(10)
            .shadow(radius: 3)
            
            
            
            Button {
                //
            } label: {
                VStack {
                    Image("vector1")
                        .resizable()
                        .frame(width: 24, height: 7.5)
                        .foregroundColor(.black)
                    Image("vector2")
                        .resizable()
                        .frame(width: 24, height: 7.5)
                        .foregroundColor(.black)
                    Image("vector1")
                        .resizable()
                        .frame(width: 24, height: 7.5)
                        .foregroundColor(.black)
                }
                .padding()
            }
            
        }
    }
}




        



