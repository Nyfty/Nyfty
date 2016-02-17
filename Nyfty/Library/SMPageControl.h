//
//  SMPageControl.h
//  SMPageControl
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SMPageControlAlignment) {
	SMPageControlAlignmentLeft = 1,
	SMPageControlAlignmentCenter,
	SMPageControlAlignmentRight
};

typedef NS_ENUM(NSUInteger, SMPageControlVerticalAlignment) {
	SMPageControlVerticalAlignmentTop = 1,
	SMPageControlVerticalAlignmentMiddle,
	SMPageControlVerticalAlignmentBottom
};

typedef NS_ENUM(NSUInteger, SMPageControlTapBehavior) {
	SMPageControlTapBehaviorStep	= 1,
	SMPageControlTapBehaviorJump
};

@interface SMPageControl : UIControl

@property (nonatomic) NSInteger numberOfPages;
@property (nonatomic) NSInteger currentPage;
@property (nonatomic) CGFloat indicatorMargin							UI_APPEARANCE_SELECTOR; // deafult is 10
@property (nonatomic) CGFloat indicatorDiameter							UI_APPEARANCE_SELECTOR; // deafult is 6
@property (nonatomic) CGFloat minHeight									UI_APPEARANCE_SELECTOR; // default is 36, cannot be less than indicatorDiameter
@property (nonatomic) SMPageControlAlignment alignment					UI_APPEARANCE_SELECTOR; // deafult is Center
@property (nonatomic) SMPageControlVerticalAlignment verticalAlignment	UI_APPEARANCE_SELECTOR;	// deafult is Middle

@property (nonatomic, strong) UIImage *pageIndicatorImage				UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIImage *pageIndicatorMaskImage			UI_APPEARANCE_SELECTOR; // ignored if pageIndicatorImage is set
@property (nonatomic, strong) UIColor *pageIndicatorTintColor			UI_APPEARANCE_SELECTOR; // ignored if pageIndicatorImage is set
@property (nonatomic, strong) UIImage *currentPageIndicatorImage		UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIColor *currentPageIndicatorTintColor	UI_APPEARANCE_SELECTOR; // ignored if currentPageIndicatorImage is set

@property (nonatomic) BOOL hidesForSinglePage;

@property (nonatomic) BOOL defersCurrentPageDisplay;

@property (nonatomic) SMPageControlTapBehavior tapBehavior;

- (void)updateCurrentPageDisplay;

- (CGRect)rectForPageIndicator:(NSInteger)pageIndex;
- (CGSize)sizeForNumberOfPages:(NSInteger)pageCount;

- (void)setImage:(UIImage *)image forPage:(NSInteger)pageIndex;
- (void)setCurrentImage:(UIImage *)image forPage:(NSInteger)pageIndex;
- (void)setImageMask:(UIImage *)image forPage:(NSInteger)pageIndex;

- (UIImage *)imageForPage:(NSInteger)pageIndex;
- (UIImage *)currentImageForPage:(NSInteger)pageIndex;
- (UIImage *)imageMaskForPage:(NSInteger)pageIndex;

- (void)updatePageNumberForScrollView:(UIScrollView *)scrollView;
- (void)setScrollViewContentOffsetForCurrentPage:(UIScrollView *)scrollView animated:(BOOL)animated;

#pragma mark - UIAccessibility


- (void)setName:(NSString *)name forPage:(NSInteger)pageIndex;
- (NSString *)nameForPage:(NSInteger)pageIndex;

@end 
