import WidgetKit
import SwiftUI

struct PhilophizeWidgetView: View {
    var entry: PhilosophizeProvider.Entry
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(entry.quote)
                .frame(width: UIScreen.main.bounds.width / 1.2)
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .border(Color.blue, width: 2)
            
            Spacer()
                        
            HStack{
                Spacer()
                Text("**Last Update:** \\(entry.date.formatted(.dateTime))")
                    .font(.caption2)
                
            }
        }
        .foregroundStyle(.white)
        .containerBackground(for: .widget) {
            Color.cyan
        }
    }
}
