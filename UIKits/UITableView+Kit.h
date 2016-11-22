//
//  UITableView+Kit.h
//  UIKit
//
//  Created by lei on 2016/11/22.
//  Copyright © 2016年 lei. All rights reserved.
//

/*
 用法,直接创建UITableView,不用写代理方法,直接复制上面的代码用就行了
 _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
 [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:movieCellIdentifier];
 [self.view addSubview:_tableView];
 //cell高度
 [[ [[self.tableView tableViewHeightForRowAtIndexPathBlock:^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
 return 120;
 
 }]numberOfSectionsInTableViewBlock:^NSInteger(UITableView * _Nonnull tableView) {
 return 1;
 }]tableViewNumberOfRowsInSectionBlock:^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
 return 10;
 }] tableViewCellForRowAtIndexPathBlock:^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:movieCellIdentifier];
 return cell;
 }];
 //cell的选择
 [self.tableView tableViewDidSelectRowAtIndexPathBlock:^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
 
 }];
 */

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UITableView (Kit)

#pragma mark - UITableViewDataSourceBlcok
/**
 *  @author lei, 16-09-27 15:08:15
 *
 *  UITableView的封装
 */


//里面有多少个,同-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
- (instancetype)tableViewNumberOfRowsInSectionBlock:(NSInteger (^)(UITableView *tableView, NSInteger section))tableViewNumberOfRowsInSectionBlock;

// 返回cell 同(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
- (instancetype)tableViewCellForRowAtIndexPathBlock:(UITableViewCell * (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewCellForRowAtIndexPathBlock;

//返回cell的个数,同-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView.默认为1
- (instancetype)numberOfSectionsInTableViewBlock:(NSInteger (^)(UITableView *tableView))numberOfSectionsInTableViewBlock; //

// 组头尾标题
- (instancetype)tableViewTitleForHeaderInSectionBlock:(NSString * (^)(UITableView *tableView, NSInteger section))tableViewTitleForHeaderInSectionBlock;
- (instancetype)tableViewTitleForFooterInSectionBlock:(NSString * (^)(UITableView *tableView, NSInteger section))tableViewTitleForFooterInSectionBlock;

// 编辑
- (instancetype)tableViewCanEditRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewCanEditRowAtIndexPathBlock;

// 移动/重新排序

// 允许重新排序附属视图选择为一个特定的行显示。默认情况下,重新排序将只显示如果数据源实现控制 同-tableView:moveRowAtIndexPath:toIndexPath:
- (instancetype)tableViewCanMoveRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewCanMoveRowAtIndexPathBlock;

// Index

// Data manipulation - insert and delete support

// After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
// Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
- (instancetype)tableViewCommitEditingStyleForRowAtIndexPathBlock:(void (^)(UITableView *tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath *indexPath))tableViewCommitEditingStyleForRowAtIndexPathBlock;

// Data manipulation - reorder / moving support
- (instancetype)tableViewMoveRowAtIndexPathToIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *destinationIndexPath))tableViewMoveRowAtIndexPathToIndexPathBlock;

#pragma mark - UITableViewDelegateBlcok
//_______________________________________________________________________________________________________________
// this represents the display and behaviour of the cells.

/******* @optional *******/
// Display customization
- (instancetype)tableViewWillDisplayCellForRowAtIndexPathBlock:(void (^)(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath))tableViewWillDisplayCellForRowAtIndexPathBlock;
- (instancetype)tableViewWillDisplayHeaderViewForSectionBlock:(void (^)(UITableView *tableView, UIView *view, NSInteger section))tableViewWillDisplayHeaderViewForSectionBlock NS_AVAILABLE_IOS(6_0);
- (instancetype)tableViewWillDisplayFooterViewForSectionBlock:(void (^)(UITableView *tableView, UIView *view, NSInteger section))tableViewWillDisplayFooterViewForSectionBlock NS_AVAILABLE_IOS(6_0);
- (instancetype)tableViewDidEndDisplayingCellForRowAtIndexPathBlock:(void (^)(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath))tableViewDidEndDisplayingCellForRowAtIndexPathBlock NS_AVAILABLE_IOS(6_0);
- (instancetype)tableViewDidEndDisplayingHeaderViewForSectionBlock:(void (^)(UITableView *tableView, UIView *view, NSInteger section))tableViewDidEndDisplayingHeaderViewForSectionBlock NS_AVAILABLE_IOS(6_0);
- (instancetype)tableViewDidEndDisplayingFooterViewForSectionBlock:(void (^)(UITableView *tableView, UIView *view, NSInteger section))tableViewDidEndDisplayingFooterViewForSectionBlock NS_AVAILABLE_IOS(6_0);

// 返回高度
- (instancetype)tableViewHeightForRowAtIndexPathBlock:(CGFloat (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewHeightForRowAtIndexPathBlock;
//头部高度
- (instancetype)tableViewHeightForHeaderInSectionBlock:(CGFloat (^)(UITableView *tableView, NSInteger section))tableViewHeightForHeaderInSectionBlock;
//尾部高度
- (instancetype)tableViewHeightForFooterInSectionBlock:(CGFloat (^)(UITableView *tableView, NSInteger section))tableViewHeightForFooterInSectionBlock;

// 使用estimatedHeight方法快速,将允许快速加载时间的表。
// 如果这些方法实现,上述tableview:heightForXXX调用将推迟到视图可以显示出来,因此更昂贵的逻辑可以放置在那里
- (instancetype)tableViewEstimatedHeightForRowAtIndexPathBlock:(CGFloat (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewEstimatedHeightForRowAtIndexPathBlock NS_AVAILABLE_IOS(7_0);
- (instancetype)tableViewEstimatedHeightForHeaderInSectionBlock:(CGFloat (^)(UITableView *tableView, NSInteger section))tableViewEstimatedHeightForHeaderInSectionBlock NS_AVAILABLE_IOS(7_0);
- (instancetype)tableViewEstimatedHeightForFooterInSectionBlock:(CGFloat (^)(UITableView *tableView, NSInteger section))tableViewEstimatedHeightForFooterInSectionBlock NS_AVAILABLE_IOS(7_0);

// 页眉和页脚的信息。视图是优先于标题应该决定提供
- (instancetype)tableViewViewForHeaderInSectionBlock:(nullable UIView * (^)(UITableView *tableView, NSInteger section))tableViewViewForHeaderInSectionBlock; // custom view for header. will be adjusted to default or specified header height
- (instancetype)tableViewViewForFooterInSectionBlock:(nullable UIView * (^)(UITableView *tableView, NSInteger section))tableViewViewForFooterInSectionBlock; // custom view for footer. will be adjusted to default or specified footer height

// Accessories (disclosures).
//- (instancetype)tableViewAccessoryTypeForRowWithIndexPathBlock:(UITableViewCellAccessoryType (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewAccessoryTypeForRowWithIndexPathBlock NS_DEPRECATED_IOS(2_0, 3_0) __TVOS_PROHIBITED;

- (instancetype)tableViewAccessoryButtonTappedForRowWithIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewAccessoryButtonTappedForRowWithIndexPathBlock;

// Selection

// -tableView:shouldHighlightRowAtIndexPath: is called when a touch comes down on a row.
// Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
- (instancetype)tableViewShouldHighlightRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewShouldHighlightRowAtIndexPathBlock NS_AVAILABLE_IOS(6_0);
- (instancetype)tableViewDidHighlightRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewDidHighlightRowAtIndexPathBlock NS_AVAILABLE_IOS(6_0);
- (instancetype)tableViewDidUnhighlightRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewDidUnhighlightRowAtIndexPathBlock NS_AVAILABLE_IOS(6_0);

// Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
- (instancetype)tableViewWillSelectRowAtIndexPathBlock:(nullable NSIndexPath * (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewWillSelectRowAtIndexPathBlock;
- (instancetype)tableViewWillDeselectRowAtIndexPathBlock:(nullable NSIndexPath * (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewWillDeselectRowAtIndexPathBlock NS_AVAILABLE_IOS(3_0);

// Called after the user changes the selection.
- (instancetype)tableViewDidSelectRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewDidSelectRowAtIndexPathBlock;
- (instancetype)tableViewDidDeselectRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewDidDeselectRowAtIndexPathBlock NS_AVAILABLE_IOS(3_0);

// Editing

// Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.
- (instancetype)tableViewEditingStyleForRowAtIndexPathBlock:(UITableViewCellEditingStyle (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewEditingStyleForRowAtIndexPathBlock;


// Controls whether the background is indented while editing.  If not implemented, the default is YES.  This is unrelated to the indentation level below.  This method only applies to grouped style table views.
- (instancetype)tableViewShouldIndentWhileEditingRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewShouldIndentWhileEditingRowAtIndexPathBlock;


// Moving/reordering

// Allows customization of the target row for a particular row as it is being moved/reordered
- (instancetype)tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock:(NSIndexPath * (^)(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *proposedDestinationIndexPath))tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock;

// Indentation

- (instancetype)tableViewIndentationLevelForRowAtIndexPathBlock:(NSInteger (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewIndentationLevelForRowAtIndexPathBlock; // return 'depth' of row for hierarchies

// Copy/Paste.  All three methods must be implemented by the delegate.

- (instancetype)tableViewShouldShowMenuForRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewShouldShowMenuForRowAtIndexPathBlock NS_AVAILABLE_IOS(5_0);
- (instancetype)tableViewCanPerformActionForRowAtIndexPathWithSenderBlock:(BOOL (^)(UITableView *tableView, SEL action, NSIndexPath *indexPath, __nullable id sender))tableViewCanPerformActionForRowAtIndexPathWithSenderBlock NS_AVAILABLE_IOS(5_0);
- (instancetype)tableViewPerformActionForRowAtIndexPathWithSenderBlock:(void (^)(UITableView *tableView, SEL action, NSIndexPath *indexPath, __nullable id sender))tableViewPerformActionForRowAtIndexPathWithSenderBlock NS_AVAILABLE_IOS(5_0);

// Focus

- (instancetype)tableViewCanFocusRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewCanFocusRowAtIndexPathBlock NS_AVAILABLE_IOS(9_0);
- (instancetype)tableViewShouldUpdateFocusInContextBlock:(BOOL (^)(UITableView *tableView, UITableViewFocusUpdateContext *context))tableViewShouldUpdateFocusInContextBlock NS_AVAILABLE_IOS(9_0);
- (instancetype)tableViewDidUpdateFocusInContextWithAnimationCoordinatorBlock:(void (^)(UITableView *tableView, UITableViewFocusUpdateContext *context, UIFocusAnimationCoordinator *coordinator))tableViewDidUpdateFocusInContextWithAnimationCoordinatorBlock NS_AVAILABLE_IOS(9_0);
- (instancetype)indexPathForPreferredFocusedViewInTableViewBlock:(nullable NSIndexPath * (^)(UITableView *tableView))indexPathForPreferredFocusedViewInTableViewBlock NS_AVAILABLE_IOS(9_0);

@end
NS_ASSUME_NONNULL_END
