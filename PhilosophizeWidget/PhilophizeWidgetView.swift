import WidgetKit
import SwiftUI

struct PhilophizeWidgetView: View {
    var entry: PhilosophizeProvider.Entry
    
    var body: some View {
        ZStack {
            Text(entry.quote.text)
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
        }
        .foregroundStyle(.white)
        .containerBackground(for: .widget) {
            Color.black
        }
        // TODO: fix opening the widget
        .widgetURL(URL(string: "philosophize://quote?id=\(entry.quote.id)")!)
    }
    
    // TODO: family size based font size rendering
    
    // TODO: creative background
}
