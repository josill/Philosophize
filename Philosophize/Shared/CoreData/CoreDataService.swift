import CoreData

class CoreDataService {
    static let shared = CoreDataService()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Philosophize")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("CoreData error: \(error), \(error.userInfo)")
            } else {
                self.seedDatabase()
            }
        })
        return container
    }()
    
    // Private initializer to enforce singleton pattern (users can't create this class but only used the shared instance
    private init() {}
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private func seedDatabase() {
        seedQuotes()
    }
    
    private func seedQuotes() {
        let context = mainContext
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Quote")
        fetchRequest.fetchLimit = 1
        
        do {
            let count = try context.count(for: fetchRequest)
            if count == 0 {
               let quotes = Quotes.list
               
               for quoteData in quotes {
                   let quote = NSEntityDescription.insertNewObject(forEntityName: "Quote", into: context)
                   quote.setValue(quoteData.id, forKey: "id")
                   quote.setValue(quoteData.text, forKey: "text")
               }
               
               saveContext()
               print("Database seeded successfully with quotes")
           } else {
               print("Database already contains quotes, skipping seed")
           }
        } catch {
            print("Error checking for existing data: \(error)")
        }
    }
}
