#include "FrameRateIndex.h"


FrameRateIndex::FrameRateIndex(int _imageNum,int _fpsNum):imageNum(_imageNum),fpsNum(_fpsNum) {
    
}

int FrameRateIndex::getFrameRateIndex() {
    int frameIndex = 0;
    frameIndex = (int)(ofGetElapsedTimef() * fpsNum) % imageNum;
    
    return frameIndex;
}


float FrameRateIndex::getFrameSpeed() {
    return (float)fpsNum * 0.2f;
    
}