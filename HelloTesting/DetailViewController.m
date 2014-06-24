//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(Customer*)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.name.text = self.detailItem.name;
        self.mail.text = self.detailItem.mail;
        switch (self.detailItem.gender) {
            case GenderMale:
                [self.gender setSelectedSegmentIndex:0];
                break;
            case GenderFemale:
                [self.gender setSelectedSegmentIndex:1];
                break;
        }
        if(self.detailItem.age>=4){
            [self.age selectRow:self.detailItem.age-4 inComponent:0 animated:NO];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.name.accessibilityIdentifier = @"name textfield";
    self.name.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.name.delegate = self;
    self.mail.accessibilityIdentifier = @"mail textfield";
    self.mail.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.mail.delegate = self;
    self.gender.accessibilityIdentifier = @"gender segmentedcontrol";
    self.age.accessibilityIdentifier = @"age pickerview";
    self.age.dataSource = self;
    self.age.delegate = self;
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    //ツールによって、[UIPickerViewDelegate pickerView:didSelectRow:inComponent:]が呼ばれないものがあるため、
    //ここでdetailItemへの設定を行なう
    self.detailItem.age = [self.age selectedRowInComponent:0] + 4;
}


#pragma mark - UI events

- (IBAction)changeGender:(id)sender{
    if(self.gender.selectedSegmentIndex==0){
        self.detailItem.gender = GenderMale;
    }else{
        self.detailItem.gender = GenderFemale;
    }
}


#pragma mark - UITextFieldDelegate methods

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if(textField==self.name){
        self.detailItem.name = textField.text;
    }else{
        self.detailItem.mail = textField.text;
    }
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField==self.name){
        self.detailItem.name = textField.text;
    }else{
        self.detailItem.mail = textField.text;
    }
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - UIPickerViewDataSource methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 120-3;
}


#pragma mark - UIPickerViewDelegate methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [NSString stringWithFormat:@"%d", row+4];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.detailItem.age = row+4;
}


#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}


#pragma mark - segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showPreview"]) {
        [[segue destinationViewController] setDetailItem:self.detailItem];
    }
}

@end
