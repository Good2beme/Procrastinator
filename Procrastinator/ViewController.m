//
//  ViewController.m
//  Procrastinator
//
//  Created by Admin on 19/7/15.
//  Copyright (c) 2015 Clarence. All rights reserved.
//

#import "ViewController.h"
#import "DataModal.h"
#import "ToDoItem.h"


@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property DataModal *dataModal;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataModal = [[DataModal alloc] init];
    //1. Instantiate the toDoItems Array
    self.dataModal.toDoItems = [[NSMutableArray alloc] initWithCapacity:4];
    //2. Instantiate an object of ToDoItem
    ToDoItem *toDoItem = [[ToDoItem alloc] init];
    //3. Set item name
    toDoItem.itemName = @"Buy Christmas Gifts !";
    //4. Add toDoItem to dataModal's toDoItems array
    [self.dataModal.toDoItems addObject:toDoItem];
    //Creating 2nd instance of ToDoItem
    toDoItem = [[ToDoItem alloc] init];
    toDoItem.itemName = @"Watch Horrible Bosses 2";
    //Adding 2nd toDoItem to dataModal's toDoItems array
    [self.dataModal.toDoItems addObject:toDoItem];
    //Creating 3rd instance of ToDoItem
    toDoItem = [[ToDoItem alloc] init];
    toDoItem.itemName = @"Enjoy at Disney Land !";
    //Adding 3rd toDoItem to dataModal's toDoItems array
    [self.dataModal.toDoItems addObject:toDoItem];
    //Creating 4th instance of ToDoItem
    toDoItem = [[ToDoItem alloc] init];
    toDoItem.itemName = @"Go on a Cruise !";
    //Adding 4th toDoItem to dataModal's toDoItems array
    [self.dataModal.toDoItems addObject:toDoItem];
    
    
    }



-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataModal.toDoItems.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    //1. Try to find a cell with our identifier
    UITableViewCell *tableCell = [tableView
                                  dequeueReusableCellWithIdentifier:@"todocell" forIndexPath:indexPath];
    //2. If the cell is not found, create a new cell
    if(!tableCell){
        //3. Create an instance of the UITableViewCell
        tableCell = [[UITableViewCell alloc]
                     initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"todocell"];
    }
    //4. Find the label using its tag value
    UILabel *label = (UILabel *)[tableCell viewWithTag:1000];
    //5. Get the data from our Modal for the corresponding row
    ToDoItem *toDoItem = (ToDoItem *) [self.dataModal.toDoItems
                                       objectAtIndex:indexPath.row];
    //6. Bind the category name to the label's text property.
    label.text = toDoItem.itemName;
    //7. Return the newly created cell
    
    return tableCell;

    
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"todocell" forIndexPath:indexPath];
    
//    NSDictionary *tmpDictionary = [self.movieArray objectAtIndex:indexPath.row];
//    
//    cell.textLabel.text = [tmpDictionary objectForKey:@"name"];
//    cell.detailTextLabel.text = [tmpDictionary objectForKey:@"actor"];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
