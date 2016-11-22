//
//  UITableView+Kit.m
//  UIKit
//
//  Created by lei on 2016/11/22.
//  Copyright © 2016年 lei. All rights reserved.
//

#import "UITableView+Kit.h"
#import <objc/runtime.h>

@implementation UITableView (Kit)

#pragma mark - 重写UITableViewDataSource
+ (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tableViewNumberOfRowsInSectionBlock) {
        return tableView.tableViewNumberOfRowsInSectionBlock(tableView, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDataSourceKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:numberOfRowsInSection:)]) {
        return [dataSource tableView:tableView numberOfRowsInSection:section];
    }
    
    return 0;
}

+ (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tableViewCellForRowAtIndexPathBlock) {
        return tableView.tableViewCellForRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDataSourceKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:numberOfRowsInSection:)]) {
        return [dataSource tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    
    NSAssert(tableView.tableViewCellForRowAtIndexPathBlock, @"tableViewCellForRowAtIndexPathBlock must be set to return to UITableViewCell!!!");
    return nil;
}

+ (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView.numberOfSectionsInTableViewBlock) {
        return tableView.numberOfSectionsInTableViewBlock(tableView);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDataSourceKey);
    
    if ([dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        return [dataSource numberOfSectionsInTableView:tableView];
    }
    
    return 1; // 默认是1组
}

+ (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (tableView.tableViewTitleForHeaderInSectionBlock) {
        return tableView.tableViewTitleForHeaderInSectionBlock(tableView, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDataSourceKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:titleForHeaderInSection:)]) {
        return [dataSource tableView:tableView titleForHeaderInSection:section];
    }
    
    return nil;
}

+ (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (tableView.tableViewTitleForFooterInSectionBlock) {
        return tableView.tableViewTitleForFooterInSectionBlock(tableView, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDataSourceKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:titleForFooterInSection:)]) {
        return [dataSource tableView:tableView titleForFooterInSection:section];
    }
    
    return nil;
}

+ (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tableViewCanEditRowAtIndexPathBlock) {
        return tableView.tableViewCanEditRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDataSourceKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:canEditRowAtIndexPath:)]) {
        return [dataSource tableView:tableView canEditRowAtIndexPath:indexPath];
    }
    
    return YES; // 默认可编辑
}

+ (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tableViewCanMoveRowAtIndexPathBlock) {
        return tableView.tableViewCanMoveRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDataSourceKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:canMoveRowAtIndexPath:)]) {
        return [dataSource tableView:tableView canMoveRowAtIndexPath:indexPath];
    }
    
    return YES; // 默认允许重新排序附属视图选择为一个特定的行显示
}


+ (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tableViewCommitEditingStyleForRowAtIndexPathBlock) {
        return tableView.tableViewCommitEditingStyleForRowAtIndexPathBlock(tableView, editingStyle, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDataSourceKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:commitEditingStyle:forRowAtIndexPath:)]) {
        return [dataSource tableView:tableView commitEditingStyle:editingStyle forRowAtIndexPath:indexPath];
    }
}

+ (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    if (tableView.tableViewMoveRowAtIndexPathToIndexPathBlock) {
        return tableView.tableViewMoveRowAtIndexPathToIndexPathBlock(tableView, sourceIndexPath, destinationIndexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDataSourceKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:moveRowAtIndexPath:toIndexPath:)]) {
        return [dataSource tableView:tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
    }
}

#pragma mark - UITableViewDataSourceBlcok
//_______________________________________________________________________________________________________________
// this protocol represents the data model object. as such, it supplies no information about appearance (including the cells)
static const void *UITableViewDataSourceKey                          = &UITableViewDataSourceKey;

static const void *UITableViewNumberOfRowsInSectionKey               = &UITableViewNumberOfRowsInSectionKey;
static const void *UITableViewCellForRowAtIndexPathKey               = &UITableViewCellForRowAtIndexPathKey;
static const void *UITableViewNumberOfSectionsInTableViewKey         = &UITableViewNumberOfSectionsInTableViewKey;
static const void *UITableViewTitleForHeaderInSectionKey             = &UITableViewTitleForHeaderInSectionKey;
static const void *UITableViewTitleForFooterInSectionKey             = &UITableViewTitleForFooterInSectionKey;
static const void *UITableViewCanEditRowAtIndexPathKey               = &UITableViewCanEditRowAtIndexPathKey;
static const void *UITableViewCanMoveRowAtIndexPathKey               = &UITableViewCanMoveRowAtIndexPathKey;
//static const void *UITableViewSectionIndexTitlesForTableViewKey      = &UITableViewSectionIndexTitlesForTableViewKey;
//static const void *UITableViewSectionForSectionIndexTitleAtIndexKey  = &UITableViewSectionForSectionIndexTitleAtIndexKey;
static const void *UITableViewCommitEditingStyleForRowAtIndexPathKey = &UITableViewCommitEditingStyleForRowAtIndexPathKey;
static const void *UITableViewMoveRowAtIndexPathToIndexPathKey       = &UITableViewMoveRowAtIndexPathToIndexPathKey;

/******* @required *******/
- (NSInteger (^)(UITableView *tableView, NSInteger section))tableViewNumberOfRowsInSectionBlock {
    return objc_getAssociatedObject(self, UITableViewNumberOfRowsInSectionKey);
}

- (instancetype)tableViewNumberOfRowsInSectionBlock:(NSInteger (^)(UITableView *tableView, NSInteger section))tableViewNumberOfRowsInSectionBlock {
    [self setDataSourceIfDataSourceSet];
    objc_setAssociatedObject(self, UITableViewNumberOfRowsInSectionKey, tableViewNumberOfRowsInSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
- (UITableViewCell * (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewCellForRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewCellForRowAtIndexPathKey);
}

- (instancetype)tableViewCellForRowAtIndexPathBlock:(UITableViewCell * (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewCellForRowAtIndexPathBlock {
    [self setDataSourceIfDataSourceSet];
    objc_setAssociatedObject(self, UITableViewCellForRowAtIndexPathKey, tableViewCellForRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

/******* @optional *******/
- (NSInteger (^)(UITableView *tableView))numberOfSectionsInTableViewBlock {
    return objc_getAssociatedObject(self, UITableViewNumberOfSectionsInTableViewKey);
}
//返回cell的个数,同numberOfSectionsInTableView
- (instancetype)numberOfSectionsInTableViewBlock:(NSInteger (^)(UITableView *tableView))numberOfSectionsInTableViewBlock { // Default is 1 if not implemented
    [self setDataSourceIfDataSourceSet];
    objc_setAssociatedObject(self, UITableViewNumberOfSectionsInTableViewKey, numberOfSectionsInTableViewBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (NSString * (^)(UITableView *tableView, NSInteger section))tableViewTitleForHeaderInSectionBlock {
    return objc_getAssociatedObject(self, UITableViewTitleForHeaderInSectionKey);
}

// 组头尾标题
- (instancetype)tableViewTitleForHeaderInSectionBlock:(NSString * (^)(UITableView *tableView, NSInteger section))tableViewTitleForHeaderInSectionBlock {
    [self setDataSourceIfDataSourceSet];
    objc_setAssociatedObject(self, UITableViewTitleForHeaderInSectionKey, tableViewTitleForHeaderInSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (NSString * (^)(UITableView *tableView, NSInteger section))tableViewTitleForFooterInSectionBlock {
    return objc_getAssociatedObject(self, UITableViewTitleForFooterInSectionKey);
}

- (instancetype)tableViewTitleForFooterInSectionBlock:(NSString * (^)(UITableView *tableView, NSInteger section))tableViewTitleForFooterInSectionBlock {
    [self setDataSourceIfDataSourceSet];
    objc_setAssociatedObject(self, UITableViewTitleForFooterInSectionKey, tableViewTitleForFooterInSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Editing

// Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
- (BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewCanEditRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewCanEditRowAtIndexPathKey);
}

- (instancetype)tableViewCanEditRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewCanEditRowAtIndexPathBlock {
    [self setDataSourceIfDataSourceSet];
    objc_setAssociatedObject(self, UITableViewCanEditRowAtIndexPathKey, tableViewCanEditRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Moving/reordering

// Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
- (BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewCanMoveRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewCanMoveRowAtIndexPathKey);
}

- (instancetype)tableViewCanMoveRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewCanMoveRowAtIndexPathBlock {
    [self setDataSourceIfDataSourceSet];
    objc_setAssociatedObject(self, UITableViewCanMoveRowAtIndexPathKey, tableViewCanMoveRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}



// Data manipulation - insert and delete support

// After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
// Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
- (void (^)(UITableView *tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath *indexPath))tableViewCommitEditingStyleForRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewCommitEditingStyleForRowAtIndexPathKey);
}

- (instancetype)tableViewCommitEditingStyleForRowAtIndexPathBlock:(void (^)(UITableView *tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath *indexPath))tableViewCommitEditingStyleForRowAtIndexPathBlock {
    [self setDataSourceIfDataSourceSet];
    objc_setAssociatedObject(self, UITableViewCommitEditingStyleForRowAtIndexPathKey, tableViewCommitEditingStyleForRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Data manipulation - reorder / moving support
- (void (^)(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *destinationIndexPath))tableViewMoveRowAtIndexPathToIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewMoveRowAtIndexPathToIndexPathKey);
}

- (instancetype)tableViewMoveRowAtIndexPathToIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *destinationIndexPath))tableViewMoveRowAtIndexPathToIndexPathBlock {
    [self setDataSourceIfDataSourceSet];
    objc_setAssociatedObject(self, UITableViewMoveRowAtIndexPathToIndexPathKey, tableViewMoveRowAtIndexPathToIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

/**
 *  避免使用UITableView-block而没有设置dataSource将自己设置为dataSource
 */
- (void)setDataSourceIfDataSourceSet {
    if (self.dataSource != (id<UITableViewDataSource>)[self class]) {
        objc_setAssociatedObject(self, UITableViewDataSourceKey, self.dataSource, OBJC_ASSOCIATION_ASSIGN);
        self.dataSource = (id<UITableViewDataSource>)[self class];
    }
}

#pragma mark - 重写UITableViewDelegate
+ (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tableViewWillDisplayCellForRowAtIndexPathBlock) {
        return tableView.tableViewWillDisplayCellForRowAtIndexPathBlock(tableView, cell, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:willDisplayCell:forRowAtIndexPath:)]) {
        return [dataSource tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
    }
}

+ (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0) {
    if (tableView.tableViewWillDisplayHeaderViewForSectionBlock) {
        return tableView.tableViewWillDisplayHeaderViewForSectionBlock(tableView, view, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:willDisplayHeaderView:forSection:)]) {
        return [dataSource tableView:tableView willDisplayHeaderView:view forSection:section];
    }
}

+ (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0) {
    if (tableView.tableViewWillDisplayFooterViewForSectionBlock) {
        return tableView.tableViewWillDisplayFooterViewForSectionBlock(tableView, view, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:willDisplayFooterView:forSection:)]) {
        return [dataSource tableView:tableView willDisplayFooterView:view forSection:section];
    }
}

+ (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath NS_AVAILABLE_IOS(6_0) {
    if (tableView.tableViewDidEndDisplayingCellForRowAtIndexPathBlock) {
        return tableView.tableViewDidEndDisplayingCellForRowAtIndexPathBlock(tableView, cell, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:didEndDisplayingCell:forRowAtIndexPath:)]) {
        return [dataSource tableView:tableView didEndDisplayingCell:cell forRowAtIndexPath:indexPath];
    }
}

+ (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0) {
    if (tableView.tableViewDidEndDisplayingHeaderViewForSectionBlock) {
        return tableView.tableViewDidEndDisplayingHeaderViewForSectionBlock(tableView, view, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:didEndDisplayingHeaderView:forSection:)]) {
        return [dataSource tableView:tableView didEndDisplayingHeaderView:view forSection:section];
    }
}

+ (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0) {
    if (tableView.tableViewDidEndDisplayingFooterViewForSectionBlock) {
        return tableView.tableViewDidEndDisplayingFooterViewForSectionBlock(tableView, view, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:didEndDisplayingFooterView:forSection:)]) {
        return [dataSource tableView:tableView didEndDisplayingFooterView:view forSection:section];
    }
}

+ (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tableViewHeightForRowAtIndexPathBlock) {
        return tableView.tableViewHeightForRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)]) {
        return [dataSource tableView:tableView heightForRowAtIndexPath:indexPath];
    }
    
    return tableView.rowHeight;
}

+ (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (tableView.tableViewHeightForHeaderInSectionBlock) {
        return tableView.tableViewHeightForHeaderInSectionBlock(tableView, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:heightForHeaderInSection:)]) {
        return [dataSource tableView:tableView heightForHeaderInSection:section];
    }
    
    return tableView.sectionHeaderHeight;
}

+ (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (tableView.tableViewHeightForFooterInSectionBlock) {
        return tableView.tableViewHeightForFooterInSectionBlock(tableView, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:heightForFooterInSection:)]) {
        return [dataSource tableView:tableView heightForFooterInSection:section];
    }
    
    return tableView.sectionFooterHeight;
}

+ (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(7_0) {
    if (tableView.tableViewEstimatedHeightForRowAtIndexPathBlock) {
        return tableView.tableViewEstimatedHeightForRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:estimatedHeightForRowAtIndexPath:)]) {
        return [dataSource tableView:tableView estimatedHeightForRowAtIndexPath:indexPath];
    }
    
    return tableView.estimatedRowHeight;
}

+ (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section NS_AVAILABLE_IOS(7_0) {
    if (tableView.tableViewEstimatedHeightForHeaderInSectionBlock) {
        return tableView.tableViewEstimatedHeightForHeaderInSectionBlock(tableView, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:estimatedHeightForHeaderInSection:)]) {
        return [dataSource tableView:tableView estimatedHeightForHeaderInSection:section];
    }
    
    return 1; // tableView.estimatedSectionHeaderHeight;
}

+ (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section NS_AVAILABLE_IOS(7_0) {
    if (tableView.tableViewEstimatedHeightForFooterInSectionBlock) {
        return tableView.tableViewEstimatedHeightForFooterInSectionBlock(tableView, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:estimatedHeightForFooterInSection:)]) {
        return [dataSource tableView:tableView estimatedHeightForFooterInSection:section];
    }
    
    return 1; // tableView.estimatedSectionFooterHeight;
}

+ (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (tableView.tableViewViewForHeaderInSectionBlock) {
        return tableView.tableViewViewForHeaderInSectionBlock(tableView, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:viewForHeaderInSection:)]) {
        return [dataSource tableView:tableView viewForHeaderInSection:section];
    }
    
    return nil;
}

+ (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (tableView.tableViewViewForFooterInSectionBlock) {
        return tableView.tableViewViewForFooterInSectionBlock(tableView, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:viewForFooterInSection:)]) {
        return [dataSource tableView:tableView viewForFooterInSection:section];
    }
    
    return nil;
}


+ (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tableViewAccessoryButtonTappedForRowWithIndexPathBlock) {
        return tableView.tableViewAccessoryButtonTappedForRowWithIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:accessoryButtonTappedForRowWithIndexPath:)]) {
        return [dataSource tableView:tableView accessoryButtonTappedForRowWithIndexPath:indexPath];
    }
}

+ (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0) {
    if (tableView.tableViewShouldHighlightRowAtIndexPathBlock) {
        return tableView.tableViewShouldHighlightRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:shouldHighlightRowAtIndexPath:)]) {
        return [dataSource tableView:tableView shouldHighlightRowAtIndexPath:indexPath];
    }
    
    return YES;
}

+ (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0) {
    if (tableView.tableViewDidHighlightRowAtIndexPathBlock) {
        return tableView.tableViewDidHighlightRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:didHighlightRowAtIndexPath:)]) {
        return [dataSource tableView:tableView didHighlightRowAtIndexPath:indexPath];
    }
}

+ (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0) {
    if (tableView.tableViewDidUnhighlightRowAtIndexPathBlock) {
        return tableView.tableViewDidUnhighlightRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:didUnhighlightRowAtIndexPath:)]) {
        return [dataSource tableView:tableView didUnhighlightRowAtIndexPath:indexPath];
    }
}

+ (nullable NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tableViewWillSelectRowAtIndexPathBlock) {
        return tableView.tableViewWillSelectRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:willSelectRowAtIndexPath:)]) {
        return [dataSource tableView:tableView willSelectRowAtIndexPath:indexPath];
    }
    
    return indexPath;
}

+ (nullable NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0) {
    if (tableView.tableViewWillDeselectRowAtIndexPathBlock) {
        return tableView.tableViewWillDeselectRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:willDeselectRowAtIndexPath:)]) {
        return [dataSource tableView:tableView willDeselectRowAtIndexPath:indexPath];
    }
    
    return indexPath;
}

+ (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tableViewDidSelectRowAtIndexPathBlock) {
        return tableView.tableViewDidSelectRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        return [dataSource tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

+ (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0) {
    if (tableView.tableViewDidDeselectRowAtIndexPathBlock) {
        return tableView.tableViewDidDeselectRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:didDeselectRowAtIndexPath:)]) {
        return [dataSource tableView:tableView didDeselectRowAtIndexPath:indexPath];
    }
}

+ (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tableViewEditingStyleForRowAtIndexPathBlock) {
        return tableView.tableViewEditingStyleForRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:editingStyleForRowAtIndexPath:)]) {
        return [dataSource tableView:tableView editingStyleForRowAtIndexPath:indexPath];
    }
    
    return UITableViewCellEditingStyleNone;
}

//+ (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath
+ (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tableViewShouldIndentWhileEditingRowAtIndexPathBlock) {
        return tableView.tableViewShouldIndentWhileEditingRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:shouldIndentWhileEditingRowAtIndexPath:)]) {
        return [dataSource tableView:tableView shouldIndentWhileEditingRowAtIndexPath:indexPath];
    }
    
    return YES;
}

+ (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
    if (tableView.tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock) {
        return tableView.tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock(tableView, sourceIndexPath, proposedDestinationIndexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:targetIndexPathForMoveFromRowAtIndexPath:toProposedIndexPath:)]) {
        return [dataSource tableView:tableView targetIndexPathForMoveFromRowAtIndexPath:sourceIndexPath toProposedIndexPath:proposedDestinationIndexPath];
    }
    
    NSAssert(tableView.tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock, @"tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock must be set to return to NSIndexPath!!!");
    return nil;
}

+ (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tableViewIndentationLevelForRowAtIndexPathBlock) {
        return tableView.tableViewIndentationLevelForRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:indentationLevelForRowAtIndexPath:)]) {
        return [dataSource tableView:tableView indentationLevelForRowAtIndexPath:indexPath];
    }
    
    return 0;
}

+ (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(5_0) {
    if (tableView.tableViewShouldShowMenuForRowAtIndexPathBlock) {
        return tableView.tableViewShouldShowMenuForRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:shouldShowMenuForRowAtIndexPath:)]) {
        return [dataSource tableView:tableView shouldShowMenuForRowAtIndexPath:indexPath];
    }
    
    return NO; // 默认不显示编辑菜单
}

+ (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender NS_AVAILABLE_IOS(5_0) {
    if (tableView.tableViewCanPerformActionForRowAtIndexPathWithSenderBlock) {
        return tableView.tableViewCanPerformActionForRowAtIndexPathWithSenderBlock(tableView, action, indexPath, sender);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:canPerformAction:forRowAtIndexPath:withSender:)]) {
        return [dataSource tableView:tableView canPerformAction:action forRowAtIndexPath:indexPath withSender:sender];
    }
    
    return NO; // 默认不能执行每一行菜单方法
}

+ (void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender NS_AVAILABLE_IOS(5_0) {
    if (tableView.tableViewPerformActionForRowAtIndexPathWithSenderBlock) {
        return tableView.tableViewPerformActionForRowAtIndexPathWithSenderBlock(tableView, action, indexPath, sender);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:performAction:forRowAtIndexPath:withSender:)]) {
        return [dataSource tableView:tableView performAction:action forRowAtIndexPath:indexPath withSender:sender];
    }
}

+ (BOOL)tableView:(UITableView *)tableView canFocusRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(9_0) {
    if (tableView.tableViewCanFocusRowAtIndexPathBlock) {
        return tableView.tableViewCanFocusRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:canFocusRowAtIndexPath:)]) {
        return [dataSource tableView:tableView canFocusRowAtIndexPath:indexPath];
    }
    
    return YES;
}

+ (BOOL)tableView:(UITableView *)tableView shouldUpdateFocusInContext:(UITableViewFocusUpdateContext *)context NS_AVAILABLE_IOS(9_0) {
    if (tableView.tableViewShouldUpdateFocusInContextBlock) {
        return tableView.tableViewShouldUpdateFocusInContextBlock(tableView, context);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:shouldUpdateFocusInContext:)]) {
        return [dataSource tableView:tableView shouldUpdateFocusInContext:context];
    }
    
    return YES;
}

+ (void)tableView:(UITableView *)tableView didUpdateFocusInContext:(UITableViewFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator NS_AVAILABLE_IOS(9_0) {
    if (tableView.tableViewDidUpdateFocusInContextWithAnimationCoordinatorBlock) {
        return tableView.tableViewDidUpdateFocusInContextWithAnimationCoordinatorBlock(tableView, context, coordinator);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:didUpdateFocusInContext:withAnimationCoordinator:)]) {
        return [dataSource tableView:tableView didUpdateFocusInContext:context withAnimationCoordinator:coordinator];
    }
}

+ (nullable NSIndexPath *)indexPathForPreferredFocusedViewInTableView:(UITableView *)tableView NS_AVAILABLE_IOS(9_0) {
    if (tableView.indexPathForPreferredFocusedViewInTableViewBlock) {
        return tableView.indexPathForPreferredFocusedViewInTableViewBlock(tableView);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(indexPathForPreferredFocusedViewInTableView:)]) {
        return [dataSource indexPathForPreferredFocusedViewInTableView:tableView];
    }
    
    return nil;
}

#pragma mark - UITableViewDelegateBlock
//_______________________________________________________________________________________________________________
// this represents the display and behaviour of the cells.
static const void *UITableViewDelegateKey                                          = &UITableViewDelegateKey;

static const void *UITableViewWillDisplayCellForRowAtIndexPathKey                  = &UITableViewWillDisplayCellForRowAtIndexPathKey;
static const void *UITableViewWillDisplayHeaderViewForSectionKey                   = &UITableViewWillDisplayHeaderViewForSectionKey;
static const void *UITableViewWillDisplayFooterViewForSectionKey                   = &UITableViewWillDisplayFooterViewForSectionKey;
static const void *UITableViewDidEndDisplayingCellForRowAtIndexPathKey             = &UITableViewDidEndDisplayingCellForRowAtIndexPathKey;
static const void *UITableViewDidEndDisplayingHeaderViewForSectionKey              = &UITableViewDidEndDisplayingHeaderViewForSectionKey;
static const void *UITableViewDidEndDisplayingFooterViewForSectionKey              = &UITableViewDidEndDisplayingFooterViewForSectionKey;
static const void *UITableViewHeightForRowAtIndexPathKey                           = &UITableViewHeightForRowAtIndexPathKey;
static const void *UITableViewHeightForHeaderInSectionKey                          = &UITableViewHeightForHeaderInSectionKey;
static const void *UITableViewHeightForFooterInSectionKey                          = &UITableViewHeightForFooterInSectionKey;
static const void *UITableViewEstimatedHeightForRowAtIndexPathKey                  = &UITableViewEstimatedHeightForRowAtIndexPathKey;
static const void *UITableViewEstimatedHeightForHeaderInSectionKey                 = &UITableViewEstimatedHeightForHeaderInSectionKey;
static const void *UITableViewEstimatedHeightForFooterInSectionKey                 = &UITableViewEstimatedHeightForFooterInSectionKey;
static const void *UITableViewViewForHeaderInSectionKey                            = &UITableViewViewForHeaderInSectionKey;
static const void *UITableViewViewForFooterInSectionKey                            = &UITableViewViewForFooterInSectionKey;
//static const void *UITableViewAccessoryTypeForRowWithIndexPathKey                  = &UITableViewAccessoryTypeForRowWithIndexPathKey;
static const void *UITableViewAccessoryButtonTappedForRowWithIndexPathKey          = &UITableViewAccessoryButtonTappedForRowWithIndexPathKey;
static const void *UITableViewShouldHighlightRowAtIndexPathKey                     = &UITableViewShouldHighlightRowAtIndexPathKey;
static const void *UITableViewDidHighlightRowAtIndexPathKey                        = &UITableViewDidHighlightRowAtIndexPathKey;
static const void *UITableViewDidUnhighlightRowAtIndexPathKey                      = &UITableViewDidUnhighlightRowAtIndexPathKey;
static const void *UITableViewWillSelectRowAtIndexPathKey                          = &UITableViewWillSelectRowAtIndexPathKey;
static const void *UITableViewWillDeselectRowAtIndexPathKey                        = &UITableViewWillDeselectRowAtIndexPathKey;
static const void *UITableViewDidSelectRowAtIndexPathKey                           = &UITableViewDidSelectRowAtIndexPathKey;
static const void *UITableViewDidDeselectRowAtIndexPathKey                         = &UITableViewDidDeselectRowAtIndexPathKey;
static const void *UITableViewEditingStyleForRowAtIndexPathKey                     = &UITableViewEditingStyleForRowAtIndexPathKey;
//static const void *UITableViewTitleForDeleteConfirmationButtonForRowAtIndexPathKey = &UITableViewTitleForDeleteConfirmationButtonForRowAtIndexPathKey;
//static const void *UITableViewEditActionsForRowAtIndexPathKey                      = &UITableViewEditActionsForRowAtIndexPathKey;
static const void *UITableViewShouldIndentWhileEditingRowAtIndexPathKey            = &UITableViewShouldIndentWhileEditingRowAtIndexPathKey;
//static const void *UITableViewWillBeginEditingRowAtIndexPathKey                    = &UITableViewWillBeginEditingRowAtIndexPathKey;
//static const void *UITableViewDidEndEditingRowAtIndexPathKey                       = &UITableViewDidEndEditingRowAtIndexPathKey;
static const void *UITableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathKey = &UITableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathKey;
static const void *UITableViewIndentationLevelForRowAtIndexPathKey                 = &UITableViewIndentationLevelForRowAtIndexPathKey;
static const void *UITableViewShouldShowMenuForRowAtIndexPathKey                   = &UITableViewShouldShowMenuForRowAtIndexPathKey;
static const void *UITableViewCanPerformActionForRowAtIndexPathWithSenderKey       = &UITableViewCanPerformActionForRowAtIndexPathWithSenderKey;
static const void *UITableViewPerformActionForRowAtIndexPathWithSenderKey          = &UITableViewPerformActionForRowAtIndexPathWithSenderKey;
static const void *UITableViewCanFocusRowAtIndexPathKey                            = &UITableViewCanFocusRowAtIndexPathKey;
static const void *UITableViewShouldUpdateFocusInContextKey                        = &UITableViewShouldUpdateFocusInContextKey;
static const void *UITableViewDidUpdateFocusInContextWithAnimationCoordinatorKey   = &UITableViewDidUpdateFocusInContextWithAnimationCoordinatorKey;
static const void *UITableViewIndexPathForPreferredFocusedViewInTableViewKey       = &UITableViewIndexPathForPreferredFocusedViewInTableViewKey;

/******* @optional *******/
// Display customization
- (void (^)(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath))tableViewWillDisplayCellForRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewWillDisplayCellForRowAtIndexPathKey);
}

- (instancetype)tableViewWillDisplayCellForRowAtIndexPathBlock:(void (^)(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath))tableViewWillDisplayCellForRowAtIndexPathBlock {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewWillDisplayCellForRowAtIndexPathKey, tableViewWillDisplayCellForRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (void (^)(UITableView *tableView, UIView *view, NSInteger section))tableViewWillDisplayHeaderViewForSectionBlock {
    return objc_getAssociatedObject(self, UITableViewWillDisplayHeaderViewForSectionKey);
}

- (instancetype)tableViewWillDisplayHeaderViewForSectionBlock:(void (^)(UITableView *tableView, UIView *view, NSInteger section))tableViewWillDisplayHeaderViewForSectionBlock NS_AVAILABLE_IOS(6_0) {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewWillDisplayHeaderViewForSectionKey, tableViewWillDisplayHeaderViewForSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (void (^)(UITableView *tableView, UIView *view, NSInteger section))tableViewWillDisplayFooterViewForSectionBlock {
    return objc_getAssociatedObject(self, UITableViewWillDisplayFooterViewForSectionKey);
}

- (instancetype)tableViewWillDisplayFooterViewForSectionBlock:(void (^)(UITableView *tableView, UIView *view, NSInteger section))tableViewWillDisplayFooterViewForSectionBlock NS_AVAILABLE_IOS(6_0) {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewWillDisplayFooterViewForSectionKey, tableViewWillDisplayFooterViewForSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (void (^)(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath))tableViewDidEndDisplayingCellForRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewDidEndDisplayingCellForRowAtIndexPathKey);
}

- (instancetype)tableViewDidEndDisplayingCellForRowAtIndexPathBlock:(void (^)(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath))tableViewDidEndDisplayingCellForRowAtIndexPathBlock NS_AVAILABLE_IOS(6_0) {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewDidEndDisplayingCellForRowAtIndexPathKey, tableViewDidEndDisplayingCellForRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (void (^)(UITableView *tableView, UIView *view, NSInteger section))tableViewDidEndDisplayingHeaderViewForSectionBlock {
    return objc_getAssociatedObject(self, UITableViewDidEndDisplayingHeaderViewForSectionKey);
}

- (instancetype)tableViewDidEndDisplayingHeaderViewForSectionBlock:(void (^)(UITableView *tableView, UIView *view, NSInteger section))tableViewDidEndDisplayingHeaderViewForSectionBlock NS_AVAILABLE_IOS(6_0) {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewDidEndDisplayingHeaderViewForSectionKey, tableViewDidEndDisplayingHeaderViewForSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (void (^)(UITableView *tableView, UIView *view, NSInteger section))tableViewDidEndDisplayingFooterViewForSectionBlock {
    return objc_getAssociatedObject(self, UITableViewDidEndDisplayingFooterViewForSectionKey);
}

- (instancetype)tableViewDidEndDisplayingFooterViewForSectionBlock:(void (^)(UITableView *tableView, UIView *view, NSInteger section))tableViewDidEndDisplayingFooterViewForSectionBlock NS_AVAILABLE_IOS(6_0) {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewDidEndDisplayingFooterViewForSectionKey, tableViewDidEndDisplayingFooterViewForSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Variable height support
- (CGFloat (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewHeightForRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewHeightForRowAtIndexPathKey);
}

- (instancetype)tableViewHeightForRowAtIndexPathBlock:(CGFloat (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewHeightForRowAtIndexPathBlock {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewHeightForRowAtIndexPathKey, tableViewHeightForRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (CGFloat (^)(UITableView *tableView, NSInteger section))tableViewHeightForHeaderInSectionBlock {
    return objc_getAssociatedObject(self, UITableViewHeightForHeaderInSectionKey);
}

- (instancetype)tableViewHeightForHeaderInSectionBlock:(CGFloat (^)(UITableView *tableView, NSInteger section))tableViewHeightForHeaderInSectionBlock {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewHeightForHeaderInSectionKey, tableViewHeightForHeaderInSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (CGFloat (^)(UITableView *tableView, NSInteger section))tableViewHeightForFooterInSectionBlock {
    return objc_getAssociatedObject(self, UITableViewHeightForFooterInSectionKey);
}

- (instancetype)tableViewHeightForFooterInSectionBlock:(CGFloat (^)(UITableView *tableView, NSInteger section))tableViewHeightForFooterInSectionBlock {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewHeightForFooterInSectionKey, tableViewHeightForFooterInSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Use the estimatedHeight methods to quickly calcuate guessed values which will allow for fast load times of the table.
// If these methods are implemented, the above -tableView:heightForXXX calls will be deferred until views are ready to be displayed, so more expensive logic can be placed there.
- (CGFloat (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewEstimatedHeightForRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewEstimatedHeightForRowAtIndexPathKey);
}

- (instancetype)tableViewEstimatedHeightForRowAtIndexPathBlock:(CGFloat (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewEstimatedHeightForRowAtIndexPathBlock NS_AVAILABLE_IOS(7_0) {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewEstimatedHeightForRowAtIndexPathKey, tableViewEstimatedHeightForRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (CGFloat (^)(UITableView *tableView, NSInteger section))tableViewEstimatedHeightForHeaderInSectionBlock {
    return objc_getAssociatedObject(self, UITableViewEstimatedHeightForHeaderInSectionKey);
}

- (instancetype)tableViewEstimatedHeightForHeaderInSectionBlock:(CGFloat (^)(UITableView *tableView, NSInteger section))tableViewEstimatedHeightForHeaderInSectionBlock NS_AVAILABLE_IOS(7_0) {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewEstimatedHeightForHeaderInSectionKey, tableViewEstimatedHeightForHeaderInSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (CGFloat (^)(UITableView *tableView, NSInteger section))tableViewEstimatedHeightForFooterInSectionBlock {
    return objc_getAssociatedObject(self, UITableViewEstimatedHeightForFooterInSectionKey);
}

- (instancetype)tableViewEstimatedHeightForFooterInSectionBlock:(CGFloat (^)(UITableView *tableView, NSInteger section))tableViewEstimatedHeightForFooterInSectionBlock NS_AVAILABLE_IOS(7_0) {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewEstimatedHeightForFooterInSectionKey, tableViewEstimatedHeightForFooterInSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Section header & footer information. Views are preferred over title should you decide to provide both
- (nullable UIView * (^)(UITableView *tableView, NSInteger section))tableViewViewForHeaderInSectionBlock {
    return objc_getAssociatedObject(self, UITableViewViewForHeaderInSectionKey);
}

- (instancetype)tableViewViewForHeaderInSectionBlock:(nullable UIView * (^)(UITableView *tableView, NSInteger section))tableViewViewForHeaderInSectionBlock { // custom view for header. will be adjusted to default or specified header height
    objc_setAssociatedObject(self, UITableViewViewForHeaderInSectionKey, tableViewViewForHeaderInSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (nullable UIView * (^)(UITableView *tableView, NSInteger section))tableViewViewForFooterInSectionBlock {
    return objc_getAssociatedObject(self, UITableViewViewForFooterInSectionKey);
}

- (instancetype)tableViewViewForFooterInSectionBlock:(nullable UIView * (^)(UITableView *tableView, NSInteger section))tableViewViewForFooterInSectionBlock { // custom view for footer. will be adjusted to default or specified footer height
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewViewForFooterInSectionKey, tableViewViewForFooterInSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}



- (void (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewAccessoryButtonTappedForRowWithIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewAccessoryButtonTappedForRowWithIndexPathKey);
}

- (instancetype)tableViewAccessoryButtonTappedForRowWithIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewAccessoryButtonTappedForRowWithIndexPathBlock {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewAccessoryButtonTappedForRowWithIndexPathKey, tableViewAccessoryButtonTappedForRowWithIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Selection

// -tableView:shouldHighlightRowAtIndexPath: is called when a touch comes down on a row.
// Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
- (BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewShouldHighlightRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewShouldHighlightRowAtIndexPathKey);
}

- (instancetype)tableViewShouldHighlightRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewShouldHighlightRowAtIndexPathBlock NS_AVAILABLE_IOS(6_0) {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewShouldHighlightRowAtIndexPathKey, tableViewShouldHighlightRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (void (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewDidHighlightRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewDidHighlightRowAtIndexPathKey);
}

- (instancetype)tableViewDidHighlightRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewDidHighlightRowAtIndexPathBlock NS_AVAILABLE_IOS(6_0) {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewDidHighlightRowAtIndexPathKey, tableViewDidHighlightRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (void (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewDidUnhighlightRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewDidUnhighlightRowAtIndexPathKey);
}

- (instancetype)tableViewDidUnhighlightRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewDidUnhighlightRowAtIndexPathBlock NS_AVAILABLE_IOS(6_0) {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewDidUnhighlightRowAtIndexPathKey, tableViewDidUnhighlightRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
- (nullable NSIndexPath * (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewWillSelectRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewWillSelectRowAtIndexPathKey);
}

- (instancetype)tableViewWillSelectRowAtIndexPathBlock:(nullable NSIndexPath * (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewWillSelectRowAtIndexPathBlock {
    objc_setAssociatedObject(self, UITableViewWillSelectRowAtIndexPathKey, tableViewWillSelectRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (nullable NSIndexPath * (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewWillDeselectRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewWillDeselectRowAtIndexPathKey);
}

- (instancetype)tableViewWillDeselectRowAtIndexPathBlock:(nullable NSIndexPath * (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewWillDeselectRowAtIndexPathBlock NS_AVAILABLE_IOS(3_0) {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewWillDeselectRowAtIndexPathKey, tableViewWillDeselectRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Called after the user changes the selection.
- (void (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewDidSelectRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewDidSelectRowAtIndexPathKey);
}

- (instancetype)tableViewDidSelectRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewDidSelectRowAtIndexPathBlock {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewDidSelectRowAtIndexPathKey, tableViewDidSelectRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (void (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewDidDeselectRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewDidDeselectRowAtIndexPathKey);
}

- (instancetype)tableViewDidDeselectRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewDidDeselectRowAtIndexPathBlock NS_AVAILABLE_IOS(3_0) {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewDidDeselectRowAtIndexPathKey, tableViewDidDeselectRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Editing

// Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.
- (UITableViewCellEditingStyle (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewEditingStyleForRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewEditingStyleForRowAtIndexPathKey);
}

- (instancetype)tableViewEditingStyleForRowAtIndexPathBlock:(UITableViewCellEditingStyle (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewEditingStyleForRowAtIndexPathBlock {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewEditingStyleForRowAtIndexPathKey, tableViewEditingStyleForRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}



// Controls whether the background is indented while editing.  If not implemented, the default is YES.  This is unrelated to the indentation level below.  This method only applies to grouped style table views.
- (BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewShouldIndentWhileEditingRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewShouldIndentWhileEditingRowAtIndexPathKey);
}

- (instancetype)tableViewShouldIndentWhileEditingRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewShouldIndentWhileEditingRowAtIndexPathBlock {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewShouldIndentWhileEditingRowAtIndexPathKey, tableViewShouldIndentWhileEditingRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}



// Moving/reordering

// Allows customization of the target row for a particular row as it is being moved/reordered
- (NSIndexPath * (^)(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *proposedDestinationIndexPath))tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathKey);
}

- (instancetype)tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock:(NSIndexPath * (^)(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *proposedDestinationIndexPath))tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathKey, tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Indentation
- (NSInteger (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewIndentationLevelForRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewIndentationLevelForRowAtIndexPathKey);
}

- (instancetype)tableViewIndentationLevelForRowAtIndexPathBlock:(NSInteger (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewIndentationLevelForRowAtIndexPathBlock { // return 'depth' of row for hierarchies
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewIndentationLevelForRowAtIndexPathKey, tableViewIndentationLevelForRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Copy/Paste.  All three methods must be implemented by the delegate.
- (BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewShouldShowMenuForRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewShouldShowMenuForRowAtIndexPathKey);
}

- (instancetype)tableViewShouldShowMenuForRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewShouldShowMenuForRowAtIndexPathBlock NS_AVAILABLE_IOS(5_0) {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewShouldShowMenuForRowAtIndexPathKey, tableViewShouldShowMenuForRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (BOOL (^)(UITableView *tableView, SEL action, NSIndexPath *indexPath, __nullable id sender))tableViewCanPerformActionForRowAtIndexPathWithSenderBlock {
    return objc_getAssociatedObject(self, UITableViewCanPerformActionForRowAtIndexPathWithSenderKey);
}

- (instancetype)tableViewCanPerformActionForRowAtIndexPathWithSenderBlock:(BOOL (^)(UITableView *tableView, SEL action, NSIndexPath *indexPath, __nullable id sender))tableViewCanPerformActionForRowAtIndexPathWithSenderBlock NS_AVAILABLE_IOS(5_0) {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewCanPerformActionForRowAtIndexPathWithSenderKey, tableViewCanPerformActionForRowAtIndexPathWithSenderBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (void (^)(UITableView *tableView, SEL action, NSIndexPath *indexPath, __nullable id sender))tableViewPerformActionForRowAtIndexPathWithSenderBlock {
    return objc_getAssociatedObject(self, UITableViewPerformActionForRowAtIndexPathWithSenderKey);
}

- (instancetype)tableViewPerformActionForRowAtIndexPathWithSenderBlock:(void (^)(UITableView *tableView, SEL action, NSIndexPath *indexPath, __nullable id sender))tableViewPerformActionForRowAtIndexPathWithSenderBlock NS_AVAILABLE_IOS(5_0) {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewPerformActionForRowAtIndexPathWithSenderKey, tableViewPerformActionForRowAtIndexPathWithSenderBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Focus
- (BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewCanFocusRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewCanFocusRowAtIndexPathKey);
}

- (instancetype)tableViewCanFocusRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))tableViewCanFocusRowAtIndexPathBlock NS_AVAILABLE_IOS(9_0) {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewCanFocusRowAtIndexPathKey, tableViewCanFocusRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (BOOL (^)(UITableView *tableView, UITableViewFocusUpdateContext *context))tableViewShouldUpdateFocusInContextBlock {
    return objc_getAssociatedObject(self, UITableViewShouldUpdateFocusInContextKey);
}

- (instancetype)tableViewShouldUpdateFocusInContextBlock:(BOOL (^)(UITableView *tableView, UITableViewFocusUpdateContext *context))tableViewShouldUpdateFocusInContextBlock NS_AVAILABLE_IOS(9_0) {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewShouldUpdateFocusInContextKey, tableViewShouldUpdateFocusInContextBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (void (^)(UITableView *tableView, UITableViewFocusUpdateContext *context, UIFocusAnimationCoordinator *coordinator))tableViewDidUpdateFocusInContextWithAnimationCoordinatorBlock {
    return objc_getAssociatedObject(self, UITableViewDidUpdateFocusInContextWithAnimationCoordinatorKey);
}

- (instancetype)tableViewDidUpdateFocusInContextWithAnimationCoordinatorBlock:(void (^)(UITableView *tableView, UITableViewFocusUpdateContext *context, UIFocusAnimationCoordinator *coordinator))tableViewDidUpdateFocusInContextWithAnimationCoordinatorBlock NS_AVAILABLE_IOS(9_0) {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewDidUpdateFocusInContextWithAnimationCoordinatorKey, tableViewDidUpdateFocusInContextWithAnimationCoordinatorBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (nullable NSIndexPath * (^)(UITableView *tableView))indexPathForPreferredFocusedViewInTableViewBlock {
    return objc_getAssociatedObject(self, UITableViewIndexPathForPreferredFocusedViewInTableViewKey);
}

- (instancetype)indexPathForPreferredFocusedViewInTableViewBlock:(nullable NSIndexPath * (^)(UITableView *tableView))indexPathForPreferredFocusedViewInTableViewBlock NS_AVAILABLE_IOS(9_0) {
    [self setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewIndexPathForPreferredFocusedViewInTableViewKey, indexPathForPreferredFocusedViewInTableViewBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

/**
 *  避免使用UITableView-block而没有设置delegate将自己设置为delegate
 */
- (void)setDelegateIfDelegateSet {
    if (self.delegate != (id<UITableViewDelegate>)[self class]) {
        objc_setAssociatedObject(self, UITableViewDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UITableViewDelegate>)[self class];
    }
}

@end
