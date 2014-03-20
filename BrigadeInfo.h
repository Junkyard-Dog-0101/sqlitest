#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface BrigadeInfo : NSObject
{
    @private NSString* Id;
    @private NSString* Code_INSE_Commune;
    @private NSString* Commune;
    @private NSString* Code_postal;
    @private NSString* CU_unite_surveillance;
    @private NSString* Unite_surveillance;
    @private NSString* TPH;
    @private NSString* Adresse;
    @private NSString* Mail;
}

@property (nonatomic) NSString* Id;
@property (nonatomic) NSString* Code_INSE_Commune;
@property (nonatomic) NSString* Commune;
@property (nonatomic) NSString* Code_postal;
@property (nonatomic) NSString* CU_unite_surveillance;
@property (nonatomic) NSString* Unite_surveillance;
@property (nonatomic) NSString* TPH;
@property (nonatomic) NSString* Adresse;
@property (nonatomic) NSString* Mail;

- (id)initWithStatement:(sqlite3_stmt*)statement;

@end