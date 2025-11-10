import Foundation

struct User {
    let id: String
    let email: String
    let name: String
    let role: UserRole
    let phone: String?
    let profileImage: String?
    let createdAt: Date
}

enum UserRole: String, Codable {
    case admin, user
}

struct Disease: Identifiable, Codable {
    let id: String
    let name: String
    let description: String
    let icon: String
    let color: String
    let didYouKnow: [String]
}

struct Meal: Identifiable, Codable {
    let id: String
    let diseaseId: String
    let category: MealCategory
    let name: String
    let description: String
    let image: String
    let preparationSteps: [String]
    let nutrients: Nutrients
    let benefits: [String]
}

struct Nutrients: Codable {
    let calories: String
    let protein: String
    let carbs: String
    let fats: String
}

enum MealCategory: String, Codable, CaseIterable {
    case breakfast, lunch, dinner, snacks, drinks, vitamins
}

struct FAQ: Identifiable, Codable {
    let id: String
    let question: String
    let answer: String
}

struct Rating: Identifiable, Codable {
    let id: String
    let userId: String
    let rating: Int
    let message: String
    let createdAt: Date
}
