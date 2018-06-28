//
//  DetailsViewController.m
//  Flix
//
//  Created by Ernest Omondi on 6/28/18.
//  Copyright © 2018 Ernest Omondi. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backdropView;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // get url of poster to use to show image
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURLString = self.movie[@"poster_path"] ;
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    
    NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
    
    [self.posterView setImageWithURL:posterURL];
    
    // get url of backdrop to show image
    NSString *backdropURLString = self.movie[@"backdrop_path"] ;
    NSString *fullBackdropURLString = [baseURLString stringByAppendingString:backdropURLString];
    
    NSURL *backdropURL = [NSURL URLWithString:fullBackdropURLString];
    
    [self.backdropView setImageWithURL:backdropURL];
    
    self.titleLabel.text = self.movie[@"title"];
    self.dateLabel.text = self.movie[@"release_date"];
    self.synopsisLabel.text = self.movie[@"overview"];
    
    [self.titleLabel sizeToFit];
    [self.dateLabel sizeToFit]; 
    [self.synopsisLabel sizeToFit];
    
    
    // below code is for allowing scrolling and resizing of label for synopsis. In the lines feature in the storyboard, set it to 0 and then uncomment the following code. Check to see uses of the code are similar to your own use i.e names of variables.
    
    // [self.overviewLabel sizeToFit];
    
    // CGFloat maxHeight = self.overviewLabel.frame.orign.y + self.overviewLabel.size.height;
    // self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width,maxHeight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"Tapping on Movie!");
}
*/

@end
