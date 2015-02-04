/*
 * Name: OgreTextFindComponentEnumerator.h
 * Project: OgreKit
 *
 * Creation Date: Jun 05 2004
 * Author: Isao Sonobe <sonoisa (AT) muse (DOT) ocn (DOT) ne (DOT) jp>
 * Copyright: Copyright (c) 2003 Isao Sonobe, All rights reserved.
 * License: OgreKit License
 *
 * Encoding: UTF8
 * Tabsize: 4
 */

#import <Foundation/Foundation.h>

@class OgreTextFindBranch;

@interface OgreTextFindComponentEnumerator : NSEnumerator
{
    OgreTextFindBranch	*_branch;
#ifdef MAC_OS_X_VERSION_10_6
    NSUInteger			*_indexes, _count;
#else
    unsigned			*_indexes, _count;
#endif
	NSInteger			_nextIndex;
    NSInteger			_terminalIndex;
    BOOL				_inSelection;
}

- (instancetype)initWithBranch:(OgreTextFindBranch*)aBranch inSelection:(BOOL)inSelection NS_DESIGNATED_INITIALIZER;
- (void)setTerminalIndex:(NSInteger)index;
- (void)setStartIndex:(NSInteger)index;

@end
