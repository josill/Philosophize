import WidgetKit

struct PhilosophizeEntry: TimelineEntry {
    let date: Date
    let quote: Quote
}

struct Quote {
    let id: UUID
    let text: String
}
