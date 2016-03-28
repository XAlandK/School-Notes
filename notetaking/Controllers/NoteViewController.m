//
//  NoteViewController.m
//  notetaking
//
//  Created by David Haber on 2/1/15.
//  Copyright (c) 2015 David Haber. All rights reserved.
//

#import "NoteViewController.h"

#import "NoteAdapter.h"

@interface NoteViewController ()

@property (strong, nonatomic) IBOutlet UITextView *textView;
- (IBAction)shareButtonTapped:(UIBarButtonItem *)sender;
@end

@implementation NoteViewController

- (IBAction)shareButtonTapped:(UIBarButtonItem *)sender {
    
    NSString *message = _textView.text;
    
    NSArray *shareItems = @[message];
    
    UIActivityViewController * avc = [[UIActivityViewController alloc] initWithActivityItems:shareItems applicationActivities:nil];
    
    [self presentViewController:avc animated:YES completion:nil];
    
    // for iPad: make the presentation a Popover
    avc.modalPresentationStyle = UIModalPresentationPopover;
    
    UIPopoverPresentationController *popController = [avc popoverPresentationController];
    popController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popController.barButtonItem = self.navigationItem.rightBarButtonItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = _note.text;
    
    if (!self.note) {
        // no note has been passed to this VC, user wants to create a new one
        [self.textView setText:@"Delete this and write down your Lesson, homework, etc."];
    }
    else {
        // display note
        [self.textView setText:[self.note text]];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Let text view be the first responder for this view. This means it will
    // be active as soon as the view has appeared (user can start typing
    // immediately)
    [self.textView becomeFirstResponder];
}

- (IBAction)saveButtonPressed:(id)sender {
    NoteAdapter *noteAdapter = [[NoteAdapter alloc] init];
    
    NSString *noteTitle = @"Title";
    NSString *noteText = self.textView.text;
    
    if (!self.note && [noteText length] > 0) {
        // Create new note
        [noteAdapter createNotewithTitle:noteTitle withText:noteText];
    } else if ([noteText length] > 0) {
        // Update existing note
        [noteAdapter updateNote:self.note withTitle:noteTitle withText:noteText];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
