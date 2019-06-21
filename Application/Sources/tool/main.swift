import Foundation

let outputURL : URL?
if ProcessInfo.processInfo.arguments.count > 1 {
  outputURL = URL(fileURLWithPath: ProcessInfo.processInfo.arguments[1])
} else {
  outputURL = nil
}

let numberOfIdeas = 20...40
let numberOfProjects = 3...7

let actualNumberOfIdeas = numberOfIdeas.randomElement()!
let actualNumberOfProjects = numberOfIdeas.randomElement()!

let phrases = phrasesText.components(separatedBy: .newlines).map{ $0.trimmingCharacters(in: .whitespacesAndNewlines)}

let ideas = (1...actualNumberOfIdeas).map{_ in
  Idea(id: UUID(), name: phrases.randomElement()!)
}

let projects : [Project] = (1...actualNumberOfProjects).map{_ in
  let idea = ideas.randomElement()!
  return Project(id: UUID(), name: idea.name, ideaId: idea.id)
}

let dataset = Dataset(projects: projects, ideas: ideas)
let jsonEncoder = JSONEncoder()
jsonEncoder.dateEncodingStrategy = .iso8601

let data = try! jsonEncoder.encode(dataset)

if let url = outputURL {
  try? data.write(to: url)
} else {
  let json = String(data: data, encoding: .utf8)
  print(json)
}
