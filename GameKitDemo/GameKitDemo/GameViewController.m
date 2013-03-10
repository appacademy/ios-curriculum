//
//  GameViewController.m
//  GameKitDemo
//
//  Created by Edward Ruggeri on 8/25/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

/****************
NOTES
Gamekit is low level. That means we have to change things to and from NSData
to work with it.

Peer-to-Peer:
Allows you to connect to devices near you. There's no server involved.

Bandwidth vs. Latency
Bluetooth: low bandwidth. A slowchannel. 
The time from the initial send to the initial receive of data. 
Good for sending small amounts of data.


****************/


#import "GameViewController.h"
#import <GameKit/GameKit.h>

@interface GameViewController () <GKSessionDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextView *logView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong) GKSession* session;

-(IBAction)sendMessage;
@end

@implementation GameViewController
@synthesize logView = _logView;
@synthesize textField = _textField;

-(id)init {
  self = [super init];
  if (!self)
    return nil;
  
  self.session = [[GKSession alloc] initWithSessionID:@"ABC" displayName:@"Ned" sessionMode:GKSessionModePeer];
  [self.session setDataReceiveHandler:self withContext:nil]; // Given to data whenever it's called. Not useful here.
  self.session.delegate = self;
  self.session.available = YES; // I'm available for play!
  
  return self;
}

-(void)viewDidLoad {
  self.logView.text = @"";
}

// Mandatory delegate method
-(void)session:(GKSession*)session didReceiveConnectionRequestFromPeer:(NSString *)peerID {
  [self.session acceptConnectionFromPeer:peerID error:nil];
  session.available = NO;
  
  [self logToView:[NSString stringWithFormat:@"Connecting client: %@\n", peerID]];
//  [self sendMessage:@"Hello client!" toPeer:peerID];
}

// Mandatory.
-(void)session:(GKSession *)session peer:(NSString *)peerID didChangeState:(GKPeerConnectionState)state {
  if (state == GKPeerStateAvailable) {
    [self logToView:[NSString stringWithFormat:@"Connecting to peer: %@\n", peerID]];
    
    // I found you. I want to connnect.
    [session connectToPeer:peerID withTimeout:2];
  } else if (state == GKPeerStateConnected) {
    // State happens three times. Available, connected, and Disconnected.
    [self logToView:[NSString stringWithFormat:@"Connected to peer: %@\n", peerID]];
//    [self sendMessage:@"Hello peer!" toPeer:peerID];
    
    // only connect two players
    session.available = NO;
  }
}

// ReveiveData, Delegate method. Mandatory for data handler.
-(void)receiveData:(NSData *)data fromPeer:(NSString *)peer inSession: (GKSession *)session context:(void *)context {
  NSString* message = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
  [[[UIAlertView alloc] initWithTitle:peer message:message delegate:self cancelButtonTitle:@"Accept" otherButtonTitles:nil] show];
}

// Send Data. Send message is custom
-(void)sendMessage { 
  NSString* message = self.textField.text;
  
  // Convert data to bytes
  NSData* payload = [message dataUsingEncoding:NSUTF8StringEncoding];
  
  // This is where the magic happens. Send the payload to everyone.
  // You can send it to individual peers as well.
  // Data Mode: Unreliable or reliable. Reliable: They'll always be received in order. 
  // Unreliable: If it's ok once in a while to lose a message, or come in out of order. Generally faster. Not worth it here.
  [self.session sendDataToAllPeers:payload withDataMode:GKSendDataReliable error:nil];
}

-(void)logToView:(NSString*)message {
  self.logView.text = [self.logView.text stringByAppendingFormat:@"%@\n", message];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  
  return YES;
}

@end



