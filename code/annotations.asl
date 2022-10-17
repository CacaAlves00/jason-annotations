busy(john)[expires(autumn)]. // [expires(autumn)] 👈 annotation
// 👆 provide details that are strongly associated with one particular belief

busy_until(john,autum). // 👈 has the same meaning

// Annotations advantages
    // 👉 more elegant, yielding more readable code
    // 👉 facilitates management of the belief base
    // 👉 great to expose the belief source

// Belief sources
    // 👉 perceptual information (from the env) 👉 source(percept)
    // 👉 other agents                          👉 source(john)
    // 👉 self reminder (sort of a mental note) 👉 source(self)

// Worth noting: 👉 for beliefs originating from perceptual information,
// the interpreter automatically adds an annotation 👉 source(percept)