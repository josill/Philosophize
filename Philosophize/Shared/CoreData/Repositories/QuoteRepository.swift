import CoreData

// TODO: Add interface (protocol) implementation and create generic repostiory classes
class QuoteRepository {
    private let coreDataService: CoreDataService
    
    init(coreDataService: CoreDataService) {
        self.coreDataService = coreDataService
    }
    
    func get(byId id: UUID) -> Quote? {
        let context = coreDataService.mainContext
        let fetchRequest = NSFetchRequest<Quote>(entityName: "Quote")
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        do {
            let results = try context.fetch(fetchRequest)
            return results.first
        } catch {
            print("Failed to fetch quote: \(error)")
            return nil
        }
    }
}
