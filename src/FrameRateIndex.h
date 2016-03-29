#ifndef FrameRateIndex_hpp
#define FrameRateIndex_hpp
#include "ofxiOS.h"


class FrameRateIndex {
    
private:
    const int imageNum;
    const int fpsNum;
    
public:
    FrameRateIndex();
    FrameRateIndex(int _imageNum,int _fpsNum);
    int getFrameRateIndex();
    float getFrameSpeed();
};


#endif /* FrameRateIndex_hpp */
