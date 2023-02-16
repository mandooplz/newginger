import SwiftUI

struct VendorDetail: View {
    @ObservedObject var manager : VendorManager = VendorManager.shared
    
    @State var sortOrder: [KeyPathComparator<VendorData>] = [.init(\.elementName, order: SortOrder.forward)]
    @State var selection : VendorData.ID?
    @Binding var showInsepector : Bool
    
    var body: some View {
        HStack{
            Table(manager.vendorDatas, selection: $selection, sortOrder : $sortOrder) {
                TableColumn("이름", value: \.elementName)
                TableColumn("단위", value: \.calculationUnit) { data in
                    Text(data.calculationUnit)
                }
                TableColumn("가격", value: \.price) { data in
                    Text("\(data.price)")
                }
                TableColumn("구매 단위") { data in
                    Text("\(data.purchaseUnitMass)")
                }
                TableColumn("판매처") { data in
                    Text("\(data.vendorCategory.rawValue)")
                }
            }
                .toolbar {
                    uploadButton
                    editButton
                    inspectorButton
                }
            if showInsepector { inspector }
        }
        
    }
}

extension VendorDetail {
    var inspector : some View {
        VStack {
            Text("Inspector").font(.title)
            Text("구현 예정입니다.")
        }.frame(width: 200)
    }
    var uploadButton : some View {
        Button {
            print("업로드합니다.")
        } label: {
    Label("Upload", systemImage: "square.and.arrow.up")
        }
    }
    var editButton : some View {
        Button {
            withAnimation {
                print("수정 버튼 구현 예정입니다.")
            }
        } label: {
            Label("Edit", systemImage: "square.and.pencil")
        }

    }
    var inspectorButton : some View {
        Button {
            withAnimation {
                showInsepector.toggle()
            }
        } label: {
            Label("rightsidebar", systemImage: "sidebar.right")
        }
    }
}


struct Vendor_Previews: PreviewProvider {
    static var previews: some View {
        VendorDetail(showInsepector: .constant(true))
    }
}
