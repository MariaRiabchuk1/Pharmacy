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
                    .background(Color.customYellow)
                Spacer()
                
                ScrollView {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text(viewStore.drug.name)
                                .padding()
                                .font(.system(size: 30, weight: .bold, design: .default))
                            
                            Text(viewStore.drug.description)
                                .padding()
                                .font(.system(size: 16))
                        }
                        .padding(10)
                        
                        VStack(alignment: .leading) {
                            Text("Залишок")
                                .font(.system(size: 24, weight: .bold, design: .default))
                            Spacer()
                            HStack {
                                allCountsView(viewStore)
                            }
                        }
                        .padding(.horizontal, 30)
                        
                        
                        Spacer()
                        
                        HStack(spacing: 0) {
                            Button {
                                viewStore.send(.dismiss(false))
                            } label: {
                                Text("Закрити")
                            }
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .foregroundColor(Color.white)
                            .font(.system(size: 18, weight: .bold, design: .default))
                            .background(Color.gray)
                            
                            Button {
                                viewStore.send(.save)
                            } label: {
                                Text("Save")
                            }
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .foregroundColor(Color.white)
                            .font(.system(size: 18, weight: .bold, design: .default))
                            .background(Color.customYellow)
                        }
                        .padding(.top, 50)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 10)
                
            }
            .padding()
        }
    }
    
    @ViewBuilder
    func allCountsView(_ viewStore: ViewStore<DrugState, DrugAction>,
                       department: Departments? = nil) -> some View {
        
        if department == nil {
            // return all count because we hope this is admin or moderator.
            VStack {
                Group {
                    drugCountView(viewStore, title: "Дитяче відділення", count: viewStore.drug.drugCount.dvCount) {
                        viewStore.send(.incrButtonTapped(.dv))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.dv))
                    }
                    
                    drugCountView(viewStore, title: "Терапевтичне відділення", count: viewStore.drug.drugCount.tvCount) {
                        viewStore.send(.incrButtonTapped(.tv))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.tv))
                    }
                    
                    drugCountView(viewStore, title: "Реабілітаційне відділення", count: viewStore.drug.drugCount.rvCount) {
                        viewStore.send(.incrButtonTapped(.rv))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.rv))
                    }
                    
                    drugCountView(viewStore, title: "Реанімаційне відділення", count: viewStore.drug.drugCount.vaitCount) {
                        viewStore.send(.incrButtonTapped(.vait))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.vait))
                    }
                    
                    drugCountView(viewStore, title: "Відділення паліативної допомоги", count: viewStore.drug.drugCount.vpdCount) {
                        viewStore.send(.incrButtonTapped(.vpd))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.vpd))
                    }
                    
                    drugCountView(viewStore, title: "Інфекційне відділення", count: viewStore.drug.drugCount.ivCount) {
                        viewStore.send(.incrButtonTapped(.iv))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.iv))
                    }
                    
                    drugCountView(viewStore, title: "Неврологічне відділення", count: viewStore.drug.drugCount.nvCount) {
                        viewStore.send(.incrButtonTapped(.nv))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.nv))
                    }
                    
                }
                
                Group {
                    drugCountView(viewStore, title: "Поліклінічне відділення", count: viewStore.drug.drugCount.pvCount) {
                        viewStore.send(.incrButtonTapped(.pv))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.pv))
                    }
                    
                    drugCountView(viewStore, title: "Пологово-гінекологічне відділення", count: viewStore.drug.drugCount.pgvCount) {
                        viewStore.send(.incrButtonTapped(.pgv))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.pgv))
                    }
                    
                    drugCountView(viewStore, title: "Травматологічне відділення", count: viewStore.drug.drugCount.trvCount) {
                        viewStore.send(.incrButtonTapped(.trv))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.trv))
                    }
                    
                    drugCountView(viewStore, title: "Фізіотерапевтичне відділення", count: viewStore.drug.drugCount.fvCount) {
                        viewStore.send(.incrButtonTapped(.fv))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.fv))
                    }
                    
                    drugCountView(viewStore, title: "Хірургічне відділення", count: viewStore.drug.drugCount.xvCount) {
                        viewStore.send(.incrButtonTapped(.xv))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.xv))
                    }
                    
                    drugCountView(viewStore, title: "Відділення екстренної(невідкладної) медичної допомоги (амб)", count: viewStore.drug.drugCount.edaCount) {
                        viewStore.send(.incrButtonTapped(.eda))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.eda))
                    }
                    
                    drugCountView(viewStore, title: "Відділення екстренної(невідкладної) медичної допомоги (стац)", count: viewStore.drug.drugCount.edsCount) {
                        viewStore.send(.incrButtonTapped(.eds))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.eds))
                    }
                }
            }
        } else {
            switch department {
            case .dv:
                VStack {
                    drugCountView(viewStore, title: "Дитяче відділення", count: viewStore.drug.drugCount.dvCount) {
                        viewStore.send(.incrButtonTapped(.dv))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.dv))
                    }
                }
            case .eda:
                VStack {
                    drugCountView(viewStore, title: "Відділення екстренної(невідкладної) медичної допомоги (амб)", count: viewStore.drug.drugCount.edaCount) {
                        viewStore.send(.incrButtonTapped(.eda))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.eda))
                    }
                }
            case .eds:
                VStack {
                    drugCountView(viewStore, title: "Відділення екстренної(невідкладної) медичної допомоги (стац)", count: viewStore.drug.drugCount.edsCount) {
                        viewStore.send(.incrButtonTapped(.eds))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.eds))
                    }
                }
            case .fv:
                VStack {
                    drugCountView(viewStore, title: "Фізіотерапевтичне відділення", count: viewStore.drug.drugCount.fvCount) {
                        viewStore.send(.incrButtonTapped(.fv))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.fv))
                    }
                }
            case .iv:
                VStack {
                    drugCountView(viewStore, title: "Інфекційне відділення", count: viewStore.drug.drugCount.ivCount) {
                        viewStore.send(.incrButtonTapped(.iv))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.iv))
                    }
                }
            case .nv:
                VStack {
                    drugCountView(viewStore, title: "Неврологічне відділення", count: viewStore.drug.drugCount.nvCount) {
                        viewStore.send(.incrButtonTapped(.nv))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.nv))
                    }
                }
            case .pgv:
                VStack {
                    drugCountView(viewStore, title: "Пологово-гінекологічне відділення", count: viewStore.drug.drugCount.pgvCount) {
                        viewStore.send(.incrButtonTapped(.pgv))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.pgv))
                    }
                }
            case .pv:
                VStack {
                    drugCountView(viewStore, title: "Поліклінічне відділення", count: viewStore.drug.drugCount.pvCount) {
                        viewStore.send(.incrButtonTapped(.pv))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.pv))
                    }
                }
            case .rv:
                VStack {
                    drugCountView(viewStore, title: "Реабілітаційне відділення", count: viewStore.drug.drugCount.rvCount) {
                        viewStore.send(.incrButtonTapped(.rv))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.rv))
                    }
                }
            case .trv:
                VStack {
                    drugCountView(viewStore, title: "Травматологічне відділення", count: viewStore.drug.drugCount.trvCount) {
                        viewStore.send(.incrButtonTapped(.trv))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.trv))
                    }
                }
            case .tv:
                VStack {
                    drugCountView(viewStore, title: "Терапевтичне відділення", count: viewStore.drug.drugCount.tvCount) {
                        viewStore.send(.incrButtonTapped(.tv))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.tv))
                    }
                }
            case .vait:
                VStack {
                    drugCountView(viewStore, title: "Реанімаційне відділення", count: viewStore.drug.drugCount.vaitCount) {
                        viewStore.send(.incrButtonTapped(.vait))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.vait))
                    }
                }
            case .vpd:
                VStack {
                    drugCountView(viewStore, title: "Відділення паліативної допомоги", count: viewStore.drug.drugCount.vpdCount) {
                        viewStore.send(.incrButtonTapped(.vpd))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.vpd))
                    }
                }
            case .xv:
                VStack {
                    drugCountView(viewStore, title: "Хірургічне відділення", count: viewStore.drug.drugCount.xvCount) {
                        viewStore.send(.incrButtonTapped(.xv))
                    } decreaseAction: {
                        viewStore.send(.decrButtonTapped(.xv))
                    }
                }
            default:
                EmptyView()
            }
        }
        
    }
    
    @ViewBuilder
    func drugCountView(_ viewStore: ViewStore<DrugState, DrugAction>,
                       title: String,
                       count: Int,
                       increaseAction: @escaping () -> Void,
                       decreaseAction: @escaping () -> Void) -> some View {
        HStack(alignment: .firstTextBaseline) {
            Text(title)
            Spacer()
            
            increaseButton(action: increaseAction)
            
            Text("\(count)")
                .frame(width: 70, height: 35, alignment: .center)
                .font(.system(.title2))
            
            decreaseButton(action: decreaseAction)
        }
    }
    
    func increaseButton(action: @escaping () -> Void) -> some View {
        Button("←", action: action)
            .frame(width: 70, height: 35, alignment: .center)
            .background(Color.customYellow)
            .foregroundColor(Color.black)
            .cornerRadius(10)
            .font(.system(size: 25))
    }
    
    func decreaseButton(action: @escaping () -> Void) -> some View {
        Button("→", action: action)
            .frame(width: 70, height: 35, alignment: .center)
            .background(Color.customYellow)
            .foregroundColor(Color.black)
            .cornerRadius(10)
            .font(.system(size: 25))
    }
}

struct DrugDetailDomainView_Previews: PreviewProvider {
    static var previews: some View {
        DrugDetailDomainView(store: Store(
            initialState: DrugState(drug: .init(documentID: "", name: "Амброксол-Дарниця таблетки по 30 мг №20 (10х2)", image: "https://cdn.tabletki.ua/img/goods/83506529-4f76-4cad-a38e-7b9e4c923275/img_0.jpeg?v=AAAAAAi+BKE", description: "Спосіб застосування та дози Дорослим та дітям віком від 12 років застосовувати по 1 таблетці 3 рази на добу протягом перших 2–3 днів (еквівалентно 90 мг амброксолу гідрохлориду на добу). Лікування продовжувати застосуванням 1 таблетки 2 рази на добу (еквівалентно 60 мг амброксолу гідрохлориду на добу).  Дітям віком від 6 до 12 років застосовувати по 1/2 таблетки 2–3 рази на добу (еквівалентно 30–45 мг амброксолу гідрохлориду на добу).  У разі необхідності терапевтичний ефект для дорослих та дітей віком від 12 років може бути підсилений застосуванням 2 таблеток 2 рази на добу (еквівалентно 120 мг амброксолу гідрохлориду на добу).  Таблетки слід ковтати цілими з достатньою кількістю рідини (наприклад, з водою, чаєм або фруктовим соком) після прийому їжі.  Лікарський засіб не слід застосовувати довше 4–5 днів без консультації лікаря.  Діти.  Застосовувати дітям віком від 6 років у разі неможливості застосовування інших лікарських форм.", drugCount: .init(totalCount: 0, dvCount: 0, edaCount: 0, edsCount: 0, fvCount: 0, ivCount: 0, nvCount: 0, pgvCount: 0, pvCount: 0, rvCount: 0, trvCount: 0, tvCount: 0, vaitCount: 0, vpdCount: 0, xvCount: 0))),
            reducer: drugReducer,
            environment: .init(mainQueue: .main, apiManager: APIManager())
        ))
        .previewInterfaceOrientation(.landscapeRight)
    }
}
