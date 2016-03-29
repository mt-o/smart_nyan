#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetOrientation(OF_ORIENTATION_90_LEFT);
    ofSetFrameRate(10);
    ofRegisterTouchEvents(this);
    
    ofBackground(0);
    ofEnableSmoothing();
    
    bg.load("bg.jpg");  // background image
    
//images and sounds loading
    for(int i = 0; i < 2; i++){
        char neko_a_box[32];
        sprintf(neko_a_box, "neko_a/%d.png", i);
        neko_a[i].load(neko_a_box);
    }
    for(int i = 0; i < 5; i++){
        char neko_b_box[32];
        sprintf(neko_b_box, "neko_b/%d.png", i);
        neko_b[i].load(neko_b_box);
    }
    for(int i = 0; i < 6; i++){
        char neko_c_box[32];
        sprintf(neko_c_box, "neko_c/%d.png", i);
        neko_c[i].load(neko_c_box);
    }
    
    meow_a.load("neko_1.caf");
    meow_b.load("neko_2.caf");
    meow_c.load("neko_3.caf");
    
    meow_a.setVolume(0.75f);
    meow_b.setVolume(0.75f);
    meow_c.setVolume(0.75f);
    
//drawing position and size
    a_x = 360;
    a_y = 450;
    a_w = 141;
    a_h = 94;
    
    b_x = 629;
    b_y = 477;
    b_w = 75;
    b_h = 89;
    
    c_x1 = 800;
    c_y1 = 76;
    c_w1 = 96;
    c_h1 = 91;
    c_x2 = 823;
    c_y2 = 450;
    c_w2 = 204;
    c_h2 = 104;
    
//property initializing
    kokyuu = 1;
    move_a = 0;
    mepachi = 0;
    random_b = 0;
    hurimuki = (int)ofRandom(5,20);
    shippo = 0;
    jump = (int)ofRandom(5,20);
    random_c = (int)ofRandom(-3, 3);
    count_a = count_b = count_c = 0;
    frame_a = frame_b = frame_c = 0;
    return_a = return_b = return_c = down_c = up_c = false;
    nowtouch_b = nowtouch_c = false;
    total = 0;
}

//--------------------------------------------------------------
void ofApp::update(){
    //neko_a
    move_a += kokyuu;
    if(move_a >= 15 || move_a <= -16){
        kokyuu= -kokyuu;
    }
    
    //neko_b
    mepachi ++;
    if(mepachi == 15){
        random_b = (int)ofRandom(30);
        mepachi = 0;
    }
    if(return_b == true){
        if(nowtouch_b == false){
            frame_b ++;
            if(frame_b > 80){
                return_b = false;
                count_b = 0;
                frame_b = 0;
                hurimuki = (int)ofRandom(5,20);
                
            }
        }else if(nowtouch_b == true){
            frame_b = 0;
        }
    }
    
    //neko_c
    shippo ++;
    if(shippo == 10){
        random_c = (int)ofRandom(20);
        shippo = 0;
    }
    if(return_c == true){
        if(nowtouch_c == false){
            frame_c ++;
            cout << "frame_c = " << frame_c << endl;
            if(frame_c > 50){
                return_c = false;
                count_c = 0;
                frame_c = 0;
                jump = (int)ofRandom(5,20);
            }
        }else if(nowtouch_c == true){
            frame_c = 0;
        }
    }
    
}

//--------------------------------------------------------------
void ofApp::draw(){
    ofSetColor(255);
    bg.draw(0,-31, 1024,799);
    
//neko_a
    if(move_a >= 0){
        neko_a[0].draw(360,450, 141,94);
    }else{
        neko_a[1].draw(360,450, 141,94);
    }
    
    
//neko_b
    if(return_b == false){
        if(random_b < 10){
            neko_b[0].draw(b_x,b_y, b_w,b_h);
        }else{
            neko_b[1].draw(b_x,b_y, b_w,b_h);
        }
    }else{
        if(random_b < 10){
            neko_b[2].draw(b_x,b_y, b_w,b_h);
        }else if(random_b < 20){
            neko_b[3].draw(b_x,b_y, b_w,b_h);
        }else{
            neko_b[4].draw(b_x,b_y, b_w,b_h);
        }
    }
    
//neko_c
    if(return_c == false){
        if(up_c == true){
            neko_c[5].draw(830,110, 68,320);
            up_c = false;
            down_c = true;
        }else{
            if(random_c >= 8){
                neko_c[0].draw(800,76, 96,91);
            }else{
                neko_c[1].draw(800,76, 96,91);
            }
        }
    }else if(return_c == true){
        if(down_c == true){
            neko_c[4].draw(800,100, 68,320);
            down_c = false;
        }else{
            if(random_c >= 10){
                neko_c[2].draw(823,450, 204,104);
            }else{
                neko_c[3].draw(823,450, 204,104);
            }
        }
    }
}

//--------------------------------------------------------------
void ofApp::exit(){
    
}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    cout << "touch.x = " << touch.x << endl;
    cout << "touch.y = " << touch.y << endl;
    
    now_pos.x = touch.x;
    
    //  neko_b
    if(touch.x > 630 && touch.x < 820 && touch.y > 400 && touch.y < 560){
        nowtouch_b = true;
        count_b ++;
        if(count_b >= hurimuki){
            return_b = true;
        }
        if(return_b == true && count_b % 10 == 0){
            meow_b.play();
        }
    }
    
    //  neko_c
    if(touch.x > 820 && touch.x < 1024 && touch.y > 450 && touch.y < 650){
        nowtouch_c = true;
        count_c ++;
        if(return_c == true && count_c % 10 == 0){
            meow_c.play();
        }
    }

}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
    
    //  neko_a
    if(touch.x > 340 && touch.x < 520 && touch.y > 480 && touch.y < 570){
        prev_pos = now_pos;
        //タッチしている場所を記録
        now_pos.x = touch.x;
        if(now_pos.x > prev_pos.x){
            move_a = now_pos.x - prev_pos.x;
        }else if(now_pos.x < prev_pos.x){
            move_a = prev_pos.x - now_pos.x;
        }
        total += move_a;
        
        cout << "total = " << total << endl;
        if(total > 1500){
            meow_a.play();
            total = 0;
        }
    }
    
    // neko_c
    if(touch.x > 800 && touch.x < 880 && touch.y > 80 && touch.y < 170){
        count_c ++;
        if(count_c >= jump){
            return_c = true;
            up_c = true;
        }
    }

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
    nowtouch_b = nowtouch_c = false;
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){
    
}
