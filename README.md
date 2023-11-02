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
### Time spent - 6hrs
### Dependency injection
Custom dependency injection container based on **Swinject framework's** resolving mechanism
### Concurrency
Base concurrency functionality is implemented using modern Swift Concurrency features
### UI
Mostly SwiftUI with injected UIKit view (UITextView) for better UX
### Persistence
Persistence based on DocumentBased NoSQL Firestore Database
### Testing
As the importance of the best practices was declared I implemented basic testing functionality in order to have coverage from the initial project state.
Tests are useful not only for automated testing purposes but also as a source of truth and the requirements for the implemented functionality.
Unit testing based on native framework that i guess is enough at this point
### Authorization
To be implemented
As authorization were not mentioned and as a result not implemented, i decided not to separate users and use a single one collection on Firestore side for all notes
### Documentation
According to best practises the code shouldn't be documented directly if the functionality is obvious, so I decided to provide readme instead
### Monitoring
Crashlytics by Firebase
## To be implemented
Logging, Analytics, UITests, SnapshotTests, Integration Tests
