import CoreData

class CoreDataStack: ObservableObject {
    static let shared = CoreDataStack()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    /// Persistent container for accesing the database
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PhilosophizeDatabase")
  
        container.loadPersistentStores { _, error in
            if let error {
                fatalError("Failed to load persistent stores: \(error.localizedDescription)")
            }
        }
        
        return container
    }()
    
    /// Private initializer to enforce singleton pattern (users can't create this class but only used the shared instance)
    private init() {}
}

extension CoreDataStack {
    /// Save change to the database
    func save() {
        guard context.hasChanges else { return }
        
        do {
            try context.save()
        } catch {
            print("Failed to save the context:", error.localizedDescription)
        }
    }
    
    /// Fetch entity from database
    func fetch<T: NSManagedObject>(_ entity: T.Type,
                                  predicate: NSPredicate? = nil,
                                  sortDescriptors: [NSSortDescriptor]? = nil,
                                  limit: Int? = nil) -> [T] {
        
        let request = NSFetchRequest<T>(entityName: String(describing: entity))
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        
        if let limit = limit {
            request.fetchLimit = limit
        }
        
        do {
            return try context.fetch(request)
        } catch {
            print("Error fetching \(entity): \(error)")
            return []
        }
    }
}
