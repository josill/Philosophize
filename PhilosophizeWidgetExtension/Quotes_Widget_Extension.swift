import WidgetKit
import SwiftUI

//In this case, we are using the StaticConfiguration object because this widgethas no user-configurable options.
//If your application requires a user-configurable option,
//like in the Stocks app which allows the user to choose which stocks to show in the widget, use IntentConfiguration.

@main
struct Quotes_Widget_Extension: Widget {
    let kind = "PhilosophizeWidgetExtension"
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: PhilosophizeProvider(),
            content: { PhilophizeWidgetView(entry: $0) }
        )
        .configurationDisplayName("Quotes")
        .description("Fight for your philosophy!")
        .supportedFamilies([
            .systemSmall,
            .systemMedium,
            .systemLarge,
            .systemExtraLarge,
            .accessoryInline,
            .accessoryCircular,
            .accessoryRectangular
        ])
    }
}

#Preview(as: .systemMedium) {
    Quotes_Widget_Extension()
} timeline: {
    PhilosophizeEntry(date: .now, quote: "The unexamined life is not worth living. - Socrates")
    PhilosophizeEntry(date: .now + 1, quote: "It is wrong always, everywhere, and for anyone, to believe anything upon insufficient evidence. - William Kingdon Clifford")
}
