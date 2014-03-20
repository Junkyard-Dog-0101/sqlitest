#import "BrigadeInfo.h"

@implementation BrigadeInfo

@synthesize Id = _Id;
@synthesize Code_INSE_Commune = _Code_INSE_Commune;
@synthesize Commune = _Commune;
@synthesize Code_postal = _Code_postal;
@synthesize CU_unite_surveillance = _CU_unite_surveillance;
@synthesize Unite_surveillance = _Unite_surveillance;
@synthesize TPH = _TPH;
@synthesize Adresse = _Adresse;
@synthesize Mail = _Mail;

- (id)initWithStatement:(sqlite3_stmt *)statement
{
    if ((self = [super init]))
    {
        char *IdChars = (char *) sqlite3_column_text(statement, 0);
        char *Code_INSE_CommuneChars = (char *) sqlite3_column_text(statement, 1);
        char *CommuneChars = (char *) sqlite3_column_text(statement, 2);
        char *Code_postalChars = (char *) sqlite3_column_text(statement, 3);
        char *CU_unite_surveillanceChars = (char *) sqlite3_column_text(statement, 4);
        char *Unite_surveillanceChars = (char *) sqlite3_column_text(statement, 5);
        char *TPHChars = (char *) sqlite3_column_text(statement, 6);
        char *AdresseChars = (char *) sqlite3_column_text(statement, 7);
        char *MailChars = (char *) sqlite3_column_text(statement, 8);
        self.Id = [[NSString alloc] initWithFormat:(@"%s"), IdChars];
        self.Code_INSE_Commune = [[NSString alloc] initWithFormat:(@"%s"), Code_INSE_CommuneChars];
        self.Commune = [[NSString alloc] initWithFormat:(@"%s"), CommuneChars];
        self.Code_postal = [[NSString alloc] initWithFormat:(@"%s"), Code_postalChars];
        self.CU_unite_surveillance = [[NSString alloc] initWithFormat:(@"%s"), CU_unite_surveillanceChars];
        self.Unite_surveillance = [[NSString alloc] initWithFormat:(@"%s"), Unite_surveillanceChars];
        self.TPH = [[NSString alloc] initWithFormat:(@"%s"), TPHChars];
        self.Adresse = [[NSString alloc] initWithFormat:(@"%s"), AdresseChars];
        self.Mail = [[NSString alloc] initWithFormat:(@"%s"), MailChars];
    }
    return self;
}

@end