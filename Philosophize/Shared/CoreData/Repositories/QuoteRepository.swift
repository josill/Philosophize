import CoreData

// TODO: Add interface (protocol) implementation and create generic repostiory classes
class QuoteRepository {
    private let context: NSManagedObjectContext
    
    init(coreDataStack: CoreDataStack) {
        self.context = coreDataStack.context
    }
    
    func getQuoteById(id: UUID) -> Quote? {
        let request = Quote.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        do {
            let items = try context.fetch(request)
            return items.first
        } catch {
            print("Failed to fetch quote: \(error)")
            return nil
        }
    }
}
