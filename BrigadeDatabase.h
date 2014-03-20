#import <Foundation/Foundation.h>
#import "BrigadeInfo.h"

@interface BrigadeDatabase : NSObject
{
    sqlite3 *_database;
}

+ (BrigadeDatabase*)database;
- (NSArray *)BrigadeInfos;
- (NSArray *)findBrigadeByIdFromFavoris;
- (Boolean)isInFavorisWithString:string;
- (NSArray *)findBrigadeByCPWithString:string;
- (NSArray *)findBrigadeByNameWithString:string;

@end