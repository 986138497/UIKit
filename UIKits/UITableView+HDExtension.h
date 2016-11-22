//
//  UITableView+HDExtension.h
//  PortableTreasure
//
//  Created by HeDong on 15/7/30.
//  Copyright © 2015年 hedong. All rights reserved.
//  避免Block循环引用!!!
//  __weak typeof(self) weakSelf = self;
//  __strong typeof(weakSelf) strongSelf = weakSelf;
//  __TVOS_PROHIBITED 苹果不建议使用的方法都已经注释!!!


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (HDExtension)

#pragma mark - UITableViewDataSourceBlcok
//_______________________________________________________________________________________________________________
// this protocol represents the data model object. as such, it supplies no information about appearance (including the cells)

/******* @required *******/
- (instancetype)zzl_tableViewNumberOfRowsInSectionBlock:(NSInteger (^)(UITableView *tableView, NSInteger section))zzl_tableViewNumberOfRowsInSectionBlock;

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
- (instancetype)zzl_tableViewCellForRowAtIndexPathBlock:(UITableViewCell * (^)(UITableView *tableView, NSIndexPath *indexPath))zzl_tableViewCellForRowAtIndexPathBlock;

/******* @optional *******/
- (instancetype)zzl_numberOfSectionsInTableViewBlock:(NSInteger (^)(UITableView *tableView))zzl_numberOfSectionsInTableViewBlock; // Default is 1 if not implemented

// fixed font style. use custom view (UILabel) if you want something different
- (instancetype)zzl_tableViewTitleForHeaderInSectionBlock:(NSString * (^)(UITableView *tableView, NSInteger section))zzl_tableViewTitleForHeaderInSectionBlock;
- (instancetype)zzl_tableViewTitleForFooterInSectionBlock:(NSString * (^)(UITableView *tableView, NSInteger section))zzl_tableViewTitleForFooterInSectionBlock;

// Editing

// Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
- (instancetype)zzl_tableViewCanEditRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))zzl_tableViewCanEditRowAtIndexPathBlock;

// Moving/reordering

// Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
- (instancetype)zzl_tableViewCanMoveRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))zzl_tableViewCanMoveRowAtIndexPathBlock;

// Index

// return list of section titles to display in section index view (e.g. "ABCD...Z#")
//- (instancetype)zzl_sectionIndexTitlesForTableViewBlock:(NSArray<NSString *> * (^)(UITableView *tableView))zzl_sectionIndexTitlesForTableViewBlock __TVOS_PROHIBITED;

// tell table which section corresponds to section title/index (e.g. "B",1))
//- (instancetype)zzl_tableViewSectionForSectionIndexTitleAtIndexBlock:(NSInteger (^)(UITableView *tableView, NSString *title, NSInteger index))zzl_tableViewSectionForSectionIndexTitleAtIndexBlock __TVOS_PROHIBITED;

// Data manipulation - insert and delete support

// After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
// Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
- (instancetype)zzl_tableViewCommitEditingStyleForRowAtIndexPathBlock:(void (^)(UITableView *tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath *indexPath))zzl_tableViewCommitEditingStyleForRowAtIndexPathBlock;

// Data manipulation - reorder / moving support
- (instancetype)zzl_tableViewMoveRowAtIndexPathToIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *destinationIndexPath))zzl_tableViewMoveRowAtIndexPathToIndexPathBlock;

#pragma mark - UITableViewDelegateBlcok
//_______________________________________________________________________________________________________________
// this represents the display and behaviour of the cells.

/******* @optional *******/
// Display customization
- (instancetype)zzl_tableViewWillDisplayCellForRowAtIndexPathBlock:(void (^)(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath))zzl_tableViewWillDisplayCellForRowAtIndexPathBlock;
- (instancetype)zzl_tableViewWillDisplayHeaderViewForSectionBlock:(void (^)(UITableView *tableView, UIView *view, NSInteger section))zzl_tableViewWillDisplayHeaderViewForSectionBlock NS_AVAILABLE_IOS(6_0);
- (instancetype)zzl_tableViewWillDisplayFooterViewForSectionBlock:(void (^)(UITableView *tableView, UIView *view, NSInteger section))zzl_tableViewWillDisplayFooterViewForSectionBlock NS_AVAILABLE_IOS(6_0);
- (instancetype)zzl_tableViewDidEndDisplayingCellForRowAtIndexPathBlock:(void (^)(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath))zzl_tableViewDidEndDisplayingCellForRowAtIndexPathBlock NS_AVAILABLE_IOS(6_0);
- (instancetype)zzl_tableViewDidEndDisplayingHeaderViewForSectionBlock:(void (^)(UITableView *tableView, UIView *view, NSInteger section))zzl_tableViewDidEndDisplayingHeaderViewForSectionBlock NS_AVAILABLE_IOS(6_0);
- (instancetype)zzl_tableViewDidEndDisplayingFooterViewForSectionBlock:(void (^)(UITableView *tableView, UIView *view, NSInteger section))zzl_tableViewDidEndDisplayingFooterViewForSectionBlock NS_AVAILABLE_IOS(6_0);

// Variable height support
- (instancetype)zzl_tableViewHeightForRowAtIndexPathBlock:(CGFloat (^)(UITableView *tableView, NSIndexPath *indexPath))zzl_tableViewHeightForRowAtIndexPathBlock;
- (instancetype)zzl_tableViewHeightForHeaderInSectionBlock:(CGFloat (^)(UITableView *tableView, NSInteger section))zzl_tableViewHeightForHeaderInSectionBlock;
- (instancetype)zzl_tableViewHeightForFooterInSectionBlock:(CGFloat (^)(UITableView *tableView, NSInteger section))zzl_tableViewHeightForFooterInSectionBlock;

// Use the estimatedHeight methods to quickly calcuate guessed values which will allow for fast load times of the table.
// If these methods are implemented, the above -tableView:heightForXXX calls will be deferred until views are ready to be displayed, so more expensive logic can be placed there.
- (instancetype)zzl_tableViewEstimatedHeightForRowAtIndexPathBlock:(CGFloat (^)(UITableView *tableView, NSIndexPath *indexPath))zzl_tableViewEstimatedHeightForRowAtIndexPathBlock NS_AVAILABLE_IOS(7_0);
- (instancetype)zzl_tableViewEstimatedHeightForHeaderInSectionBlock:(CGFloat (^)(UITableView *tableView, NSInteger section))zzl_tableViewEstimatedHeightForHeaderInSectionBlock NS_AVAILABLE_IOS(7_0);
- (instancetype)zzl_tableViewEstimatedHeightForFooterInSectionBlock:(CGFloat (^)(UITableView *tableView, NSInteger section))zzl_tableViewEstimatedHeightForFooterInSectionBlock NS_AVAILABLE_IOS(7_0);

// Section header & footer information. Views are preferred over title should you decide to provide both
- (instancetype)zzl_tableViewViewForHeaderInSectionBlock:(nullable UIView * (^)(UITableView *tableView, NSInteger section))zzl_tableViewViewForHeaderInSectionBlock; // custom view for header. will be adjusted to default or specified header height
- (instancetype)zzl_tableViewViewForFooterInSectionBlock:(nullable UIView * (^)(UITableView *tableView, NSInteger section))zzl_tableViewViewForFooterInSectionBlock; // custom view for footer. will be adjusted to default or specified footer height

// Accessories (disclosures).
//- (instancetype)zzl_tableViewAccessoryTypeForRowWithIndexPathBlock:(UITableViewCellAccessoryType (^)(UITableView *tableView, NSIndexPath *indexPath))zzl_tableViewAccessoryTypeForRowWithIndexPathBlock NS_DEPRECATED_IOS(2_0, 3_0) __TVOS_PROHIBITED;

- (instancetype)zzl_tableViewAccessoryButtonTappedForRowWithIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))zzl_tableViewAccessoryButtonTappedForRowWithIndexPathBlock;

// Selection

// -tableView:shouldHighlightRowAtIndexPath: is called when a touch comes down on a row.
// Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
- (instancetype)zzl_tableViewShouldHighlightRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))zzl_tableViewShouldHighlightRowAtIndexPathBlock NS_AVAILABLE_IOS(6_0);
- (instancetype)zzl_tableViewDidHighlightRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))zzl_tableViewDidHighlightRowAtIndexPathBlock NS_AVAILABLE_IOS(6_0);
- (instancetype)zzl_tableViewDidUnhighlightRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))zzl_tableViewDidUnhighlightRowAtIndexPathBlock NS_AVAILABLE_IOS(6_0);

// Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
- (instancetype)zzl_tableViewWillSelectRowAtIndexPathBlock:(nullable NSIndexPath * (^)(UITableView *tableView, NSIndexPath *indexPath))zzl_tableViewWillSelectRowAtIndexPathBlock;
- (instancetype)zzl_tableViewWillDeselectRowAtIndexPathBlock:(nullable NSIndexPath * (^)(UITableView *tableView, NSIndexPath *indexPath))zzl_tableViewWillDeselectRowAtIndexPathBlock NS_AVAILABLE_IOS(3_0);

// Called after the user changes the selection.
- (instancetype)zzl_tableViewDidSelectRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))zzl_tableViewDidSelectRowAtIndexPathBlock;
- (instancetype)zzl_tableViewDidDeselectRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))zzl_tableViewDidDeselectRowAtIndexPathBlock NS_AVAILABLE_IOS(3_0);

// Editing

// Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.
- (instancetype)zzl_tableViewEditingStyleForRowAtIndexPathBlock:(UITableViewCellEditingStyle (^)(UITableView *tableView, NSIndexPath *indexPath))zzl_tableViewEditingStyleForRowAtIndexPathBlock;
//- (instancetype)zzl_tableViewTitleForDeleteConfirmationButtonForRowAtIndexPathBlock:(nullable NSString * (^)(UITableView *tableView, NSIndexPath *indexPath))zzl_tableViewTitleForDeleteConfirmationButtonForRowAtIndexPathBlock NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED;
//- (instancetype)zzl_tableViewEditActionsForRowAtIndexPathBlock:(nullable NSArray<UITableViewRowAction *> * (^)(UITableView *tableView, NSIndexPath *indexPath))zzl_tableViewEditActionsForRowAtIndexPathBlock NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED; // supercedes -tableView:titleForDeleteConfirmationButtonForRowAtIndexPath: if return value is non-nil

// Controls whether the background is indented while editing.  If not implemented, the default is YES.  This is unrelated to the indentation level below.  This method only applies to grouped style table views.
- (instancetype)zzl_tableViewShouldIndentWhileEditingRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))zzl_tableViewShouldIndentWhileEditingRowAtIndexPathBlock;

// The willBegin/didEnd methods are called whenever the 'editing' property is automatically changed by the table (allowing insert/delete/move). This is done by a swipe activating a single row
//- (instancetype)zzl_tableViewWillBeginEditingRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))zzl_tableViewWillBeginEditingRowAtIndexPathBlock __TVOS_PROHIBITED;
//- (instancetype)zzl_tableViewDidEndEditingRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))zzl_tableViewDidEndEditingRowAtIndexPathBlock __TVOS_PROHIBITED;

// Moving/reordering

// Allows customization of the target row for a particular row as it is being moved/reordered
- (instancetype)zzl_tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock:(NSIndexPath * (^)(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *proposedDestinationIndexPath))zzl_tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock;

// Indentation

- (instancetype)zzl_tableViewIndentationLevelForRowAtIndexPathBlock:(NSInteger (^)(UITableView *tableView, NSIndexPath *indexPath))zzl_tableViewIndentationLevelForRowAtIndexPathBlock; // return 'depth' of row for hierarchies

// Copy/Paste.  All three methods must be implemented by the delegate.

- (instancetype)zzl_tableViewShouldShowMenuForRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))zzl_tableViewShouldShowMenuForRowAtIndexPathBlock NS_AVAILABLE_IOS(5_0);
- (instancetype)zzl_tableViewCanPerformActionForRowAtIndexPathWithSenderBlock:(BOOL (^)(UITableView *tableView, SEL action, NSIndexPath *indexPath, __nullable id sender))zzl_tableViewCanPerformActionForRowAtIndexPathWithSenderBlock NS_AVAILABLE_IOS(5_0);
- (instancetype)zzl_tableViewPerformActionForRowAtIndexPathWithSenderBlock:(void (^)(UITableView *tableView, SEL action, NSIndexPath *indexPath, __nullable id sender))zzl_tableViewPerformActionForRowAtIndexPathWithSenderBlock NS_AVAILABLE_IOS(5_0);

// Focus

- (instancetype)zzl_tableViewCanFocusRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))zzl_tableViewCanFocusRowAtIndexPathBlock NS_AVAILABLE_IOS(9_0);
- (instancetype)zzl_tableViewShouldUpdateFocusInContextBlock:(BOOL (^)(UITableView *tableView, UITableViewFocusUpdateContext *context))zzl_tableViewShouldUpdateFocusInContextBlock NS_AVAILABLE_IOS(9_0);
- (instancetype)zzl_tableViewDidUpdateFocusInContextWithAnimationCoordinatorBlock:(void (^)(UITableView *tableView, UITableViewFocusUpdateContext *context, UIFocusAnimationCoordinator *coordinator))zzl_tableViewDidUpdateFocusInContextWithAnimationCoordinatorBlock NS_AVAILABLE_IOS(9_0);
- (instancetype)zzl_indexPathForPreferredFocusedViewInTableViewBlock:(nullable NSIndexPath * (^)(UITableView *tableView))zzl_indexPathForPreferredFocusedViewInTableViewBlock NS_AVAILABLE_IOS(9_0);

@end

NS_ASSUME_NONNULL_END
