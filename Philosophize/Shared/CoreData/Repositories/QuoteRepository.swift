import CoreData

// TODO: Add interface (protocol) implementation and create generic repostiory classes
class QuoteRepository {
    static let shared = QuoteRepository(coreDataStack: CoreDataStack.shared)
    
    private let context: NSManagedObjectContext
    
    init(coreDataStack: CoreDataStack) {
        self.context = coreDataStack.context
    }
    
    /// Get quote by id async
    func getQuoteByIdAsync(id: UUID, completion: @escaping (Result<Quote?, Error>) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let request = Quote.fetchRequest()
                request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
                
                let items = try self.context.fetch(request)
                
                if let quote = items.first {
                    DispatchQueue.main.async {
                        completion(.success(quote))
                    }
                } else {
                    let notFoundError = NotFoundError(id: id)
                    DispatchQueue.main.async {
                        completion(.failure(notFoundError))
                    }
                }
            } catch let fetchError {
                DispatchQueue.main.async {
                    completion(.failure(fetchError))
                }
            }
        }
    }
}
