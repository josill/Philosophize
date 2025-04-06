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
            // not supported on mac
//            .accessoryInline,
//            .accessoryCircular,
//            .accessoryRectangular
        ])
    }
}

#Preview(as: .systemSmall) {
    Quotes_Widget_Extension()
} timeline: {
    PhilosophizeEntry(date: .now, quote: Quote(id: UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")!, text: "The unexamined life is not worth living. - Socrates"));
    PhilosophizeEntry(date: .now, quote: Quote(id: UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5E")!, text:"It is wrong always, everywhere, and for anyone, to believe anything upon insufficient evidence. - William Kingdon Clifford"))
}

#Preview(as: .systemMedium) {
    Quotes_Widget_Extension()
} timeline: {
    PhilosophizeEntry(date: .now, quote: Quote(id: UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")!, text: "The unexamined life is not worth living. - Socrates"));
    PhilosophizeEntry(date: .now, quote: Quote(id: UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5E")!, text:"It is wrong always, everywhere, and for anyone, to believe anything upon insufficient evidence. - William Kingdon Clifford"))
}

//#Preview(as: .systemLarge) {
//    Quotes_Widget_Extension()
//} timeline: {
//    PhilosophizeEntry(date: .now, quote: "Happiness is not an ideal of reason but of imagination. - Immanuel Kant")
//}
//
//#Preview(as: .systemExtraLarge) {
//    Quotes_Widget_Extension()
//} timeline: {
//    PhilosophizeEntry(date: .now, quote: "Man is condemned to be free. - Jean-Paul Sartre")
//}
//
//#Preview(as: .accessoryInline) {
//    Quotes_Widget_Extension()
//} timeline: {
//    PhilosophizeEntry(date: .now, quote: "One cannot step twice in the same river. - Heraclitus")
//}
//
//#Preview(as: .accessoryCircular) {
//    Quotes_Widget_Extension()
//} timeline: {
//    PhilosophizeEntry(date: .now, quote: "I think, therefore I am. - René Descartes")
//}
//
//#Preview(as: .accessoryRectangular) {
//    Quotes_Widget_Extension()
//} timeline: {
//    PhilosophizeEntry(date: .now, quote: "To be is to be perceived. - George Berkeley")
//}
