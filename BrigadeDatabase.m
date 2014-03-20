#import "BrigadeDatabase.h"

@implementation BrigadeDatabase

static BrigadeDatabase *_database;

+ (BrigadeDatabase *)database
{
    if (_database == nil)
    {
        _database = [[BrigadeDatabase alloc] init];
    }
    return _database;
}

- (id)init
{
    if ((self = [super init]))
    {
        NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"brigade" ofType:@"sqlite3"];
        if (sqlite3_open([sqLiteDb UTF8String], &_database) != SQLITE_OK)
        {
            NSLog(@"Failed to open database!");
        }
    }
    return self;
}

- (NSArray *)findBrigadeByIdFromFavoris
{
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString* query = @"SELECT * FROM communes, favoris WHERE Id = IdFavoris ORDER BY IdFavoris DESC LIMIT 100";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            BrigadeInfo *info = [[BrigadeInfo alloc] initWithStatement:statement];
            [retval addObject:info];
        }
        sqlite3_finalize(statement);
    }
    return retval;
}

- (Boolean) isInFavorisWithString:string
{
    NSString *query = [NSString stringWithFormat:@"%@/%@", @"SELECT * FROM favoris WHERE IdFavoris = ", string];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            return true;
        }
        sqlite3_finalize(statement);
        return false;
    }
    return false;
}

- (NSArray *)findBrigadeByCPWithString:string
{
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = [NSString stringWithFormat:@"%@/%@/%@", @"SELECT * FROM communes WHERE code_postal LIKE '",
                       [string stringByReplacingOccurrencesOfString: @"'" withString:@"\'"],
                       @"%' ORDER BY LENGTH(code_postal) LIMIT 100"];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            BrigadeInfo *info = [[BrigadeInfo alloc] initWithStatement:statement];
            [retval addObject:info];
        }
        sqlite3_finalize(statement);
    }
    return retval;
}

- (NSArray *)findBrigadeByNameWithString:string
{
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = [NSString stringWithFormat:@"%@%@%@", @"SELECT * FROM communes WHERE Commune LIKE '",
                      [string stringByReplacingOccurrencesOfString: @"'" withString:@"''"],
                       @"%' ORDER BY LENGTH(Commune) LIMIT 100"];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            BrigadeInfo *info = [[BrigadeInfo alloc] initWithStatement:statement];
            
            [retval addObject:info];
        }
        sqlite3_finalize(statement);
    }
    return retval;
}

- (NSArray *)BrigadeInfos
{
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT * FROM communes";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            
           // NSLog());
        //    char *uniqueIdChars = (char *) sqlite3_column_text(statement, 0);
    //        char *townShipChars = (char *) sqlite3_column_text(statement, 1);
  //          char *nameChars = (char *) sqlite3_column_text(statement, 2);
          //  NSString *uniqueId = [[NSString alloc] initWithUTF8String:uniqueIdChars];
       // NSLog(@"%@\n", uniqueId);
      //      NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
        //    NSString *townShip = [[NSString alloc] initWithUTF8String:townShipChars];
            BrigadeInfo *info = [[BrigadeInfo alloc] initWithStatement:statement];
      //      NSLog(@"%@", info.Code_INSE_Commune);
           // NSLog(@"%@\n", info.Commune);
            [retval addObject:info];
//            NSLog(@"%@", townShip);
 //           [name release];
//            [townShip release];
        }
        sqlite3_finalize(statement);
    }
    return retval;
}

@end