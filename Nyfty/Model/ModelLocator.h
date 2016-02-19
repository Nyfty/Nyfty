


@interface ModelLocator : NSObject{
    NSString *LiveUrl;    
}

@property (nonatomic,retain) NSString *LiveUrl;
@property (nonatomic,strong) NSString *makeName;
@property (nonatomic,strong) NSString *modelName;

+(ModelLocator*) getInstance;

@end

