import WidgetKit

struct PhilosophizeProvider: TimelineProvider {
    private let quotes = Quotes()
    
    private let placeholderEntry = PhilosophizeEntry(date: Date(), quote: "")
    
    func placeholder(in context: Context) -> PhilosophizeEntry {
        return placeholderEntry
    }
    
    func getSnapshot(in context: Context, completion: @escaping (PhilosophizeEntry) -> ()) {
         completion(placeholderEntry)
     }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<PhilosophizeEntry>) -> Void) {
        let currentDate = Date()
        var entries : [PhilosophizeEntry] = []
        
        for minuteOffset in 0 ..< 60 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset, to: currentDate)!
            let quote = quotes.list[Int.random(in: 0...quotes.list.count-1)]
            let entry = PhilosophizeEntry(date: entryDate, quote: quote)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        
        completion(timeline)
    }
}
