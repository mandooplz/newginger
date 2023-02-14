import SwiftUI

struct Vendor: View {
    @ObservedObject var manager : VendorManager = VendorManager.shared
    
    @State var sortOrder: [KeyPathComparator<VendorData>] = [
        .init(\.elementName, order: SortOrder.forward)
    ]
    @State var selection : VendorData.ID?
    @State var showInsepector : Bool = false
    
    var body: some View {
        Table(manager.vendorDatas, selection: $selection,sortOrder : $sortOrder) {
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
        }.sheet(isPresented: $showInsepector) {
            vendorDataEditor
        }
    }
}
extension Vendor {
    var uploadButton : some View {
        Button {
            print("업로드합니다.")
        } label: {
    Label("Upload", systemImage: "square.and.arrow.up")
        }
    }
    var editButton : some View {
        Button {
            print("수정 패널을 엽니다.")
            withAnimation {
                showInsepector.toggle()
            }
        } label: {
            Label("Edit", systemImage: "square.and.pencil")
        }

    }
    var vendorDataEditor : some View {
        Text("Minwo")
            .frame(width: 400, height: 400)
    }
}


struct Vendor_Previews: PreviewProvider {
    static var previews: some View {
        Vendor()
    }
}
