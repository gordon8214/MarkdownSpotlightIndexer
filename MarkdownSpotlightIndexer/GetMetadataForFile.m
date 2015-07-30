//
//  GetMetadataForFile.m
//  MarkdownSpotlightIndexer
//
//  Created by Gordon Byrnes on 7/28/15.
//  Copyright (c) 2015 Gordon Byrnes. All rights reserved.
//

#include <CoreFoundation/CoreFoundation.h>
#import <CoreData/CoreData.h>

Boolean GetMetadataForFile(void *thisInterface, CFMutableDictionaryRef attributes, CFStringRef contentTypeUTI, CFStringRef pathToFile);

//==============================================================================
//
//	Get metadata attributes from document files
//
//	The purpose of this function is to extract useful information from the
//	file formats for your document, and set the values into the attribute
//  dictionary for Spotlight to include.
//
//==============================================================================

Boolean GetMetadataForFile(void *thisInterface, CFMutableDictionaryRef attributes, CFStringRef contentTypeUTI, CFStringRef pathToFile)
{
    
    
    Boolean ok = FALSE;
    @autoreleasepool {
        NSError *error = nil;
        
        // Get contents of file as string
        NSString* fileContent = [NSString stringWithContentsOfFile:(__bridge NSString *)(pathToFile)
                                                          encoding:NSUTF8StringEncoding
                                                             error:NULL];
        
        // If there is no error, add the info
        if (error == NULL) {
            
            // Add full file content to index
            ((__bridge NSMutableDictionary *)attributes)[(NSString *)kMDItemTextContent] = fileContent;
            ok = TRUE;
        }
        
    }
    
    // Return the status
    return ok;
}
