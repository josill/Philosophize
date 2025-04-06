import CoreData
import Foundation

class Seeder {
    static let shared = Seeder(coreDataStack: CoreDataStack.shared)
    
    private let context: NSManagedObjectContext
    
    /// Private initializer to enforce singleton pattern (users can't create this class but only used the shared instance)
    private init(coreDataStack: CoreDataStack) {
        self.context = coreDataStack.context
    }
    
    /// Seed application data
    func seedData() {
        if UserDefaults.standard.bool(forKey: "isDataSeeded") {
            return
        }
        
        seedQuotes()
        
        UserDefaults.standard.set(true, forKey: "isDataSeeded")
    }
    
    /// Reset seed flag
    func resetSeeding() {
        UserDefaults.standard.set(false, forKey: "isDataSeeded")
    }
    
    /// Seed quotes
    private func seedQuotes() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Quote")
        fetchRequest.fetchLimit = 1
        
        let quotes = Quotes.list

        for quoteData in quotes {
            let quote = Quote(context: context)
            quote.id = quoteData.id
            quote.text = quoteData.text
        }
       
        do {
            try context.save()
            print("successfully seeded data")
        } catch {
            print("Error seeding data: \(error)")

            #if DEBUG
            print("Error seeding data: \(error)")
            #endif
        }
    }
}
