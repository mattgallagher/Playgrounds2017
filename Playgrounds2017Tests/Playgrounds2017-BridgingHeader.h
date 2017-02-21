//
//  Playgrounds2017-BridgingHeader.h
//  Playgrounds2017Tests
//
//  Created by Matt Gallagher on 2017/02/07.
//  Copyright © 2017 Matt Gallagher ( http://cocoawithlove.com ). All rights reserved.
//

#ifndef CwlUtilsTests_BridgingHeader_h
#define CwlUtilsTests_BridgingHeader_h

struct mt19937_64 {
	unsigned long long mt[312];
	int mti;
};

void init_genrand64(struct mt19937_64* context, unsigned long long seed);
unsigned long long genrand64_int64(struct mt19937_64* context);
unsigned long long improved_genrand64_int64(struct mt19937_64* context);
double genrand64_real1(struct mt19937_64* context);
double genrand64_real2(struct mt19937_64* context);

#endif
