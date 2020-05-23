import UIKit

class NoteViewController: UIViewController {
    var note: Note!
    
    @IBOutlet var textView: UITextView!
    
    @IBAction func deleteNote() {
        let _ = NoteManager.main.delete(note: note)
        navigationController?.popViewController(animated: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = note.contents
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        note.contents = textView.text
        NoteManager.main.save(note: note)
    }
}
