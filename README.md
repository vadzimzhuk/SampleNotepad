# SampleNotepad

Demonstrate the ability to design and develop a basic single-screen iOS notes app using Swift and Firebase for data storage.

Design and implement a simple notes app with the following features:
1. User Interface: Create a clean and user-friendly single-screen interface where users can enter and view notes.
2. Note Creation: Allow users to type and save text notes. Each note should have a title and content.
3. Note Listing: Display a list of saved notes on the same screen, showing the note titles.
4. Firebase Integration: Use Firebase to store and retrieve notes data. Ensure that notes are stored in the Firebase Realtime Database or Firestore.

Editing: Implement functionality to edit existing notes. Users should be able to tap on a note to edit its title and content.
Auto-saving: Ensure that notes are auto-saved in real-time & data is synchronised with Firestore

### Deliverables:
A functional notes app with a user-friendly interface.
Firebase integration for data storage and synchronisation.
The ability to create & edit notes.
Real-time synchronisation of notes.
Code that is clean, well-documented, and follows best practices.
## Implementation summary
### Dependency injection
Custom dependency injection container based on Swinject resolving mechanism
2. Concurrency
Base concurrency functionality is implemented using modern Swift Concurrency features
3. UI
SwiftUI with injected UIKit view (UITextView) for better UX
4. Persistence
Persistence based on DocumentBased NoSQL Firestore Database
5. Testing
Unit testing based on native framework (TBD), UI snapshot testing (TBD)