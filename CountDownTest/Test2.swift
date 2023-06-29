import SwiftUI

struct FilledCircle: View {
    var fillPercentage: CGFloat

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 2)

            GeometryReader { geometry in
                let rect = CGRect(x: 0, y: geometry.size.height * (1 - fillPercentage), width: geometry.size.width, height: geometry.size.height * fillPercentage)
                Circle()
                    .fill(Color.green)
                    .clipShape(Rectangle().path(in: rect))
            }
        }
    }
}

struct Heart: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height

        let topLeft = CGPoint(x: width * 0.4, y: height * 0.3)
        let topRight = CGPoint(x: width * 0.6, y: height * 0.3)
        
        var path = Path()
        
        path.addArc(center: topLeft, radius: width * 0.3, startAngle: .init(radians: .pi), endAngle: .init(radians: 0), clockwise: false)
        
        path.addArc(center: topRight, radius: width * 0.3, startAngle: .init(radians: .pi), endAngle: .init(radians: 0), clockwise: false)
        
        path.addLine(to: CGPoint(x: width * 0.5, y: height))
        path.addLine(to: CGPoint(x: width * 0.1, y: height * 0.3))
        
        return path
    }
}


struct FilledHeart: View {
    var fillPercentage: CGFloat

    var body: some View {
        ZStack {
            Heart().stroke(lineWidth: 2)
            GeometryReader { geometry in
                let rect = CGRect(x: 0, y: geometry.size.height * (1 - fillPercentage), width: geometry.size.width, height: geometry.size.height * fillPercentage)
                Heart()
                    .fill(Color.green)
                    .clipShape(Rectangle().path(in: rect))
            }
        }
    }
}

struct DateEntryView: View {
    @Binding var anniversary: Date

    var body: some View {
        DatePicker("Enter your anniversary", selection: $anniversary, in: Date()..., displayedComponents: .date)
            .datePickerStyle(GraphicalDatePickerStyle())
    }
}

struct AnniversaryView: View {
    @State private var anniversary = Calendar.current.date(byAdding: .day, value: 7, to: Date()) ?? Date()
    @State private var currentDate = Date()

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            DateEntryView(anniversary: $anniversary)
//            FilledCircle(fillPercentage: fillPercentage)
//                .frame(width: 100, height: 100)
            FilledHeart(fillPercentage: fillPercentage)
                .frame(width: 100, height: 100)
        }
        .onReceive(timer) { _ in
            self.currentDate = Date()
        }
    }

    var fillPercentage: CGFloat {
        let daysUntilAnniversary = Calendar.current.dateComponents([.day], from: currentDate, to: anniversary).day!
        let totalDaysInYear = Calendar.current.range(of: .day, in: .year, for: currentDate)!.count
        return CGFloat(1) - CGFloat(daysUntilAnniversary) / CGFloat(totalDaysInYear)
    }
}

struct AnniversaryView_Previews: PreviewProvider {
    static var previews: some View {
        AnniversaryView()
    }
}
