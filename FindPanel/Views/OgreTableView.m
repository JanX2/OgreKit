/*
 * Name: OgreTableView.m
 * Project: OgreKit
 *
 * Creation Date: Jun 13 2004
 * Author: Isao Sonobe <sonoisa (AT) muse (DOT) ocn (DOT) ne (DOT) jp>
 * Copyright: Copyright (c) 2003 Isao Sonobe, All rights reserved.
 * License: OgreKit License
 *
 * Encoding: UTF8
 * Tabsize: 4
 */

#import <OgreKit/OgreTableView.h>
#import <OgreKit/OgreTableViewAdapter.h>


@implementation OgreTableView
@synthesize ogreSelectedRange = _ogreSelectedRange;

- (NSObject <OgreTextFindComponent>*)ogreAdapter
{
    return [[OgreTableViewAdapter alloc] initWithTarget:self];
}

- (NSInteger)ogreSelectedColumn
{
    return (_ogreSelectedColumn == -1? 0 : _ogreSelectedColumn);
}

- (void)ogreSetSelectedColumn:(NSInteger)column
{
    _ogreSelectedColumn = column;
}

- (NSInteger)ogreSelectedRow
{
    return (_ogreSelectedRow == -1? 0 : _ogreSelectedRow);
}

- (void)ogreSetSelectedRow:(NSInteger)row
{
    _ogreSelectedRow = row;
}


- (void)awakeFromNib
{
    _ogreSelectedColumn = -1;
    _ogreSelectedRow = -1;
    _ogreSelectedRange = NSMakeRange(0, 0);
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
        selector:@selector(ogreSelectionDidChange:) 
        name:NSTableViewSelectionDidChangeNotification 
        object:self];
}

- (void)ogreSelectionDidChange:(NSNotification*)aNotification
{
    _ogreSelectedColumn = [self selectedColumn];
    _ogreSelectedRow = [self selectedRow];
    if (_ogreSelectedColumn == -1 && _ogreSelectedRow == -1) {
        _ogreSelectedRange = NSMakeRange(0, 0);
    } else {
        _ogreSelectedRange = NSMakeRange(NSNotFound, 0);
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:NSTableViewSelectionDidChangeNotification 
                                                  object:self];
}

@end
