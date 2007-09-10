/*
Copyright (c) 2007, Stig Brautaset. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

  Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

  Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

  Neither the name of the author nor the names of its contributors may be used
  to endorse or promote products derived from this software without specific
  prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#import "SBCouchDocument.h"


@implementation SBCouchDocument

+ (id)newWithName:(NSString *)x
{
    return [[self alloc] initWithName:x];
}

+ (id)document
{
    return [[self new] autorelease];
}

+ (id)documentWithName:(NSString *)x
{
    return [[self newWithName:x] autorelease];
}

- (id)init
{
    if (self = [super init]) {
        document = [NSMutableDictionary new];
        [document setObject:[NSMutableDictionary dictionary] forKey:@"value"];
    }
    return self;
}

- (id)initWithName:(NSString *)x
{
    if (self = [self init]) {
        [document setObject:x forKey:@"documentId"];
    }
    return self;
}

- (NSString *)description
{
    return [document description];
}

- (NSString *)documentId
{
    return [document valueForKey:@"documentId"];
}

- (NSString *)revisionId
{
    return [document valueForKey:@"revisionId"];
}

- (void)setObject:(id)x forProperty:(NSString *)prop
{
    [[document objectForKey:@"value"] setObject:x forKey:prop];
}

- (id)objectForProperty:(NSString *)prop
{
    return [[document objectForKey:@"value"] objectForKey:prop];
}

- (void)removeProperty:(NSString *)prop
{
    return [[document objectForKey:@"value"] removeObjectForKey:prop];
}


@end