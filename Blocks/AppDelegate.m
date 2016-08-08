//
//  AppDelegate.m
//  Blocks
//
//  Created by EnzoF on 05.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"

typedef void (^BlockNotParametre)(void);
typedef void (^BlockWithParametre)(NSString*);

typedef NSComparisonResult(^ComparisonResultBlock)(id _Nonnull obj1 , id _Nonnull obj2);
@interface AppDelegate ()

@property (nonatomic, strong) NSMutableArray *arrayAllStudents;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    BlockNotParametre blockNP= ^{
        NSLog(@"BlockNotParametre - Привет!!!");
    };
    
    BlockWithParametre  blockWP = ^(NSString *string){
        NSLog(@"BlockWithParametre - %@",string);
    };
    
    blockNP();
    blockWP(@"Hello");
    
    [self methodWithBlockNP:blockNP];
    [self methodWithBlockWP:blockWP];
    
    [self methodWithBlockWPAndArg:blockWP
                      greetingStr:@"Ciao"];
    
    
    
    Student *student1 = [[Student alloc] init];
    student1.firstName = @"Отрада";
    student1.lastName = @"Смирнова";
    
    Student *student2 = [[Student alloc] init];
    student2.firstName = @"Дмитрий";
    student2.lastName = @"Иванов";
    
    Student *student3 = [[Student alloc] init];
    student3.firstName = @"Олег";
    student3.lastName = @"Кузнецов";
    
    Student *student4 = [[Student alloc] init];
    student4.firstName = @"Николай";
    student4.lastName = @"Соколов";
    
    Student *student5 = [[Student alloc] init];
    student5.firstName = @"Генадий";
    student5.lastName = @"Лебедев";
    
    
    Student *student6 = [[Student alloc] init];
    student6.firstName = @"Ефросинья";
    student6.lastName = @"Смирнова";
    
    Student *student7 = [[Student alloc] init];
    student7.firstName = @"Красава";
    student7.lastName = @"Козлова";
    
    Student *student8 = [[Student alloc] init];
    student8.firstName = @"Павел";
    student8.lastName = @"Никифоров";
    
    Student *student9 = [[Student alloc] init];
    student9.firstName = @"Максим";
    student9.lastName = @"Морозов";
    
    Student *student10 = [[Student alloc] init];
    student10.firstName = @"Василий";
    student10.lastName = @"Петров";
    
    NSArray *array = [[NSArray alloc]initWithObjects:student1,student2,
                      student3,student4,student5,student6,student7,
                      student8,student9,student10, nil];
    NSArray *sortArray;
    
    ComparisonResultBlock comparisonBlock = ^(id _Nonnull obj1 , id _Nonnull obj2){
        
        Student *studentObj1;
        Student *studentObj2;
        if([obj1 isKindOfClass:[Student class]])
        {
            studentObj1 = (Student*)obj1;
        }
        
        if([obj2 isKindOfClass:[Student class]])
        {
            studentObj2 = (Student*)obj2;
        }
        
        NSComparisonResult comparison = [studentObj1.lastName localizedCaseInsensitiveCompare:studentObj2.lastName];
        if(comparison == NSOrderedSame)
        {
            NSString *nameStudentObj1 = studentObj1.firstName;
            NSString *nameStudentObj2 = studentObj2.firstName;
            
            comparison = [nameStudentObj1 localizedCaseInsensitiveCompare:nameStudentObj2];
        }
        return comparison;
    };
    
    sortArray = [array sortedArrayUsingComparator:comparisonBlock];
    
    for (Student *studentObj in sortArray) {
        NSLog(@"%@ %@",studentObj.lastName,studentObj.firstName);
    }
    
    BlockAsDelegate blockAsDelegate = ^(Student*student,CGFloat temperature,
                                        BOOL shivering,BOOL headAche,
                                        BOOL stomachAche,BOOL footAche,
                                        BOOL goodGradeDoctor){
        
        
        if(shivering ||(temperature >= 37.0 && temperature <=39.5)){
            if(shivering)
            {
                NSLog(@"У пациента %@ %@ озноб",student.lastName, student.firstName);
            }
            if(temperature >= 37.0 && temperature <=39.5){
                NSLog(@"У пациента %@ %@ повышенная температура",student.lastName, student.firstName);
            }
            //
            [student takePill];
        }
        else if(temperature > 39.5)
        {
            NSLog(@"У пациента %@ %@ высокая температура",student.lastName, student.firstName);
            [student makeShot];
        }
        else
        {
            
            NSLog(@"У пациента %@ %@ переутомление. Отдыхать",student.lastName, student.firstName);
        }
        
        if(headAche)
        {
            NSLog(@"У пациента %@ %@ болит голова",student.lastName, student.firstName);
            [student takePillForHead];
        }
        if(footAche)
        {
            NSLog(@"У пациента %@ %@ болит нога",student.lastName, student.firstName);
            [student massage];
        }
        if(stomachAche)
        {
            NSLog(@"У пациента %@ %@  болит живот",student.lastName, student.firstName);
            [student takePillForStomach];
        }
        
        [student askPatient:goodGradeDoctor];
    };
    
//    NSLog(@"!!!!!Использование блоков, как делегаты!!!!!");
//    for (int i = 0; i < 20; i++) {
//        Student *student = [[Student alloc] initWithRandomTheInitialValues];
//        student.blockAsDelegate = blockAsDelegate;
//        [student fellsBetter];
//    }
    
    
    
    NSLog(@"!!!!!Использование блоков, как делегаты!!!!!");
    for (int i = 0; i < 20; i++) {
        Student *student = [[Student alloc] initWithRandomTheInitialValues];
        student.blockAsDelegate = blockAsDelegate;
        if(!self.arrayAllStudents)
        {
            self.arrayAllStudents = [[NSMutableArray alloc] init];
        }
        [self.arrayAllStudents addObject:student];
    }
    // Override point for customization after application launch.
    return YES;
}

#pragma MARK -metods-
- (void)methodWithBlockNP:(void(^)(void)) blockWithString{
    blockWithString();
    blockWithString();
    blockWithString();
}
- (void)methodWithBlockWP:(void(^)(NSString *string)) blockWithString{
    blockWithString(@"methodWithBlockWP - Привет");
    blockWithString(@"methodWithBlockWP - Hello");
    blockWithString(@"methodWithBlockWP - Ciao");
}

- (void)methodWithBlockWPAndArg:(void(^)(NSString *string)) blockWithString greetingStr:(NSString*)greetingStr{
    blockWithString([NSString stringWithFormat:@"methodWithBlockWPAndArg - %@",greetingStr]);
}


@end
