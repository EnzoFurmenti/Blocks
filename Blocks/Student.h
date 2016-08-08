//
//  Student.h
//  Blocks
//
//  Created by EnzoF on 08.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import <Foundation/Foundation.h>

/* Не определяется тип CGFloat */
#import <CoreGraphics/CGBase.h>
@class Student;
typedef  void(^BlockAsDelegate)(Student*student,
                                CGFloat temperature,
                                BOOL shivering,
                                BOOL headAche,
                                BOOL stomachAche,
                                BOOL footAche,
                                BOOL goodGradeDoctor);

@interface Student : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, assign) CGFloat temperature;
@property (nonatomic, assign) BOOL shivering;
@property (nonatomic, assign) BOOL headAche;
@property (nonatomic, assign) BOOL stomachAche;
@property (nonatomic, assign) BOOL footAche;
@property (nonatomic, assign) BOOL goodGradeDoctor;
@property (nonatomic, copy) BlockAsDelegate blockAsDelegate;

- (id)initWithRandomTheInitialValues;

- (BOOL) fellsBetter;
- (void) takePill;
- (void) makeShot;
- (void) takePillForHead;
- (void) massage;
- (void) takePillForStomach;

- (void) askPatient:(BOOL) goodGradeDoctor;

@end
