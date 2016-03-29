#pragma once

#include "ofxiOS.h"
#include "FrameRateIndex.h"

class ofApp : public ofxiOSApp {
	
    public:
        void setup();
        void update();
        void draw();
        void exit();
	
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);

        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
    
    ofImage bg, neko_a[2], neko_b[5], neko_c[6];
    ofSoundPlayer meow_a, meow_b, meow_c;
    
    int a_x, a_y, a_w, a_h; // neko_a value
    int b_x, b_y, b_w, b_h; // neko_b value
    int c_x1, c_y1, c_w1, c_h1, c_x2, c_y2, c_w2, c_h2; //neko_c value
    int kokyuu, mepachi, shippo, hurimuki, jump; // neko moving threshold
    int move_a, random_b, random_c; // threshold value
    int count_a, count_b, count_c;
    int frame_a, frame_b, frame_c;
    bool return_a, return_b, return_c, down_c, up_c;
    bool nowtouch_b, nowtouch_c;
    ofPoint now_pos, prev_pos; // touch position
    int total;
};