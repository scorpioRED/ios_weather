//
//  TabelUiViewController.m
//  weather_app
//
//  Created by Vitaliy Heras on 2/22/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import "TabelUiViewController.h"
#import "TableViewCell.h"
#import "MainViewController.h"
#import "DataPassDelegate.h"

@interface TabelUiViewController ()

@end

@implementation TabelUiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MainViewController *mainView = [[MainViewController alloc]init];
    DataPassDelegate* datapass = [[DataPassDelegate alloc]init];
    datapass.delegate = mainView;
    
    NSLog(@"Cities is -> %@ ",[mainView PassData]);
    
    self.citesTabel.delegate = self;
    self.citesTabel.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableCitiesCell" forIndexPath:indexPath];
    
    cell.timeLabe.text = @"15:44";
    cell.cityNameLabel.text = @"Lviv";
    cell.cityTempLabel.text = @"10";
    
    // Configure the cell...
    
    return cell;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
