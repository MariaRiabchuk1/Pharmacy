//
//  DrugDomainView.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 10.09.2022.
//

import SwiftUI
import ComposableArchitecture

public struct DrugDomainView: View {
    private let store: Store<DrugState, DrugAction>

    public init(store: Store<DrugState, DrugAction>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Text(viewStore.state.drug.name)
            }
            .onTapGesture {
                viewStore.send(.openDetail)
            }
            .fullScreenCover(isPresented: viewStore.binding(get: \.detailSheetisActive,
                                                           send: DrugAction.dismiss)) {
                DrugDetailDomainView(store: store)
            }
        }
    }
}


public struct DrugDetailDomainView: View {
    private let store: Store<DrugState, DrugAction>

    public init(store: Store<DrugState, DrugAction>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store) { viewStore in
            HStack {
                
                VStack {
                    if let url = URL(string: viewStore.drug.image) {
                        AsyncImage(url: url) { image in
                            image.resizable()
                        } placeholder: {
                            Color.white
                        }
                        .frame(width: 250, height: 500)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    }
                }
                
                Divider()
                Spacer()
                
                VStack(alignment: .leading) {
                    Text(viewStore.drug.name)
                        .padding()
                        .font(.system(size: 30, weight: .bold, design: .default))
                    
                    Text(viewStore.drug.description)
                        .padding()
                        .font(.system(size: 16))
                    
                    
                    Group {
                        VStack {
                            Text("\(viewStore.drug.dvCount)")
                            
                            HStack {
                                Button {
                                    viewStore.send(.incrButtonTapped)
                                } label: {
                                    Text("+")
                                        .frame(width: 30, height: 30, alignment: .center)
                                        .background(Color.green)
                                }
                                
                                Button {
                                    viewStore.send(.decrButtonTapped)
                                } label: {
                                    Text("-")
                                        .frame(width: 30, height: 30, alignment: .center)
                                        .background(Color.red)
                                }
                            }
                        }
                    }
                    
                    
                    Spacer()
                    
                    Button {
                        viewStore.send(.dismiss(false))
                    } label: {
                        Text("Закрити")
                    }
                    .frame(width: 100, height: 40, alignment: .center)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                }
                .padding(30)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding(30)
                
            }
            .padding()
        }
    }
}

struct DrugDetailDomainView_Previews: PreviewProvider {
    static var previews: some View {
        DrugDetailDomainView(store: Store(
            initialState: DrugState(drug: .init(name: "Амброксол-Дарниця таблетки по 30 мг №20 (10х2)", image: "https://cdn.tabletki.ua/img/goods/83506529-4f76-4cad-a38e-7b9e4c923275/img_0.jpeg?v=AAAAAAi+BKE", description: "Спосіб застосування та дози Дорослим та дітям віком від 12 років застосовувати по 1 таблетці 3 рази на добу протягом перших 2–3 днів (еквівалентно 90 мг амброксолу гідрохлориду на добу). Лікування продовжувати застосуванням 1 таблетки 2 рази на добу (еквівалентно 60 мг амброксолу гідрохлориду на добу).  Дітям віком від 6 до 12 років застосовувати по 1/2 таблетки 2–3 рази на добу (еквівалентно 30–45 мг амброксолу гідрохлориду на добу).  У разі необхідності терапевтичний ефект для дорослих та дітей віком від 12 років може бути підсилений застосуванням 2 таблеток 2 рази на добу (еквівалентно 120 мг амброксолу гідрохлориду на добу).  Таблетки слід ковтати цілими з достатньою кількістю рідини (наприклад, з водою, чаєм або фруктовим соком) після прийому їжі.  Лікарський засіб не слід застосовувати довше 4–5 днів без консультації лікаря.  Діти.  Застосовувати дітям віком від 6 років у разі неможливості застосовування інших лікарських форм.", totalCount: 0, dvCount: 0, edaCount: 0, edsCount: 0, fvCount: 0, ivCount: 0, nvCount: 0, pgvCount: 0, pvCount: 0, rvCount: 0, trvCount: 0, tvCount: 0, vaitCount: 0, vpdCount: 0, xvCount: 0)),
            reducer: drugReducer,
            environment: .init(mainQueue: .main)
        ))
        .previewInterfaceOrientation(.landscapeRight)
    }
}
