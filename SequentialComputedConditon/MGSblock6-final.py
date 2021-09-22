#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
This experiment was created using PsychoPy3 Experiment Builder (v2020.1.2),
    on Thu May  7 17:49:33 2020
If you publish work using this script the most relevant publication is:

    Peirce J, Gray JR, Simpson S, MacAskill M, Höchenberger R, Sogo H, Kastman E, Lindeløv JK. (2019) 
        PsychoPy2: Experiments in behavior made easy Behav Res 51: 195. 
        https://doi.org/10.3758/s13428-018-01193-y

"""

from __future__ import absolute_import, division

from psychopy import locale_setup
from psychopy import prefs
from psychopy import sound, gui, visual, core, data, event, logging, clock
from psychopy.constants import (NOT_STARTED, STARTED, PLAYING, PAUSED,
                                STOPPED, FINISHED, PRESSED, RELEASED, FOREVER)

import numpy as np  # whole numpy lib is available, prepend 'np.'
from numpy import (sin, cos, tan, log, log10, pi, average,
                   sqrt, std, deg2rad, rad2deg, linspace, asarray)
from numpy.random import random, randint, normal, shuffle
import os  # handy system and path functions
import sys  # to get file system encoding

from psychopy.hardware import keyboard



# Ensure that relative paths start from the same directory as this script
_thisDir = os.path.dirname(os.path.abspath(__file__))
os.chdir(_thisDir)

# Store info about the experiment session
psychopyVersion = '2020.1.2'
expName = 'MGSblock3-js2'  # from the Builder filename that created this script
expInfo = {'participant': '', 'session': '001'}
dlg = gui.DlgFromDict(dictionary=expInfo, sortKeys=False, title=expName)
if dlg.OK == False:
    core.quit()  # user pressed cancel
expInfo['date'] = data.getDateStr()  # add a simple timestamp
expInfo['expName'] = expName
expInfo['psychopyVersion'] = psychopyVersion

# Data file name stem = absolute path + name; later add .psyexp, .csv, .log, etc
filename = _thisDir + os.sep + u'data/%s_%s_%s' % (expInfo['participant'], expName, expInfo['date'])

# An ExperimentHandler isn't essential but helps with data saving
thisExp = data.ExperimentHandler(name=expName, version='',
    extraInfo=expInfo, runtimeInfo=None,
    originPath='/Users/KAS/Documents/MATLAB/mdtblock6/MGSblock6-final.py',
    savePickle=True, saveWideText=False,
    dataFileName=filename)
logging.console.setLevel(logging.WARNING)  # this outputs to the screen, not a file

endExpNow = False  # flag for 'escape' or other condition => quit the exp
frameTolerance = 0.001  # how close to onset before 'same' frame

# Start Code - component code to be run before the window creation

# Setup the Window
win = visual.Window(
    size=[1920, 1080], fullscr=True, screen=0, 
    winType='pyglet', allowGUI=False, allowStencil=False,
    monitor='testMonitor', color=[0,0,0], colorSpace='rgb',
    blendMode='avg', useFBO=True, 
    units='height')
# store frame rate of monitor if we can measure it
expInfo['frameRate'] = win.getActualFrameRate()
if expInfo['frameRate'] != None:
    frameDur = 1.0 / round(expInfo['frameRate'])
else:
    frameDur = 1.0 / 60.0  # could not measure, so guess

# create a default keyboard (e.g. to check for escape)
defaultKeyboard = keyboard.Keyboard()

# Initialize components for Routine "Inst"
InstClock = core.Clock()
key_resp_3 = keyboard.Keyboard()
RespType=0;
totalTrials=1;
document.body.style.cursor='none';
radius=.25;
democols=[];
demoset=[ -22,-2 ,7   , 13 ,   -11];
democols=[[-1,1,-1],[1,-1,-1],[-1,-1,1],[1,-1,1],[1,1,-1]];

#Sort the set
sorted=[]
looptimes=5;
storeset=[];
storeset=demoset;
storesetStart=[];
storesetEnd=[];
smallest=0;
smallind=0;
while looptimes>0:
    smallest=storeset[0];
    smallind=0;
    for j in range(0,looptimes):
        if smallest>storeset[j]:
            smallind=j;
            smallest=storeset[j];
    sorted.push(smallest)
    if smallind==0:
        storeset=storeset[1:looptimes];
    elif smallind==looptimes:
        storeset=storeset[0:looptimes-1];
    else:
        storesetStart=storeset[0:smallind];
        storesetEnd=storeset[smallind+1:looptimes];
        storeset=storesetStart;
        storeset.push(storesetEnd);
    looptimes=looptimes-1;
pi=3.14
demoset=sorted;
instructions = visual.TextStim(win=win, name='instructions',
    text='Instructions:\n\n',
    font='Arial',
    pos=(0, 0), height=.1, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-2.0);
spaceinst = visual.TextStim(win=win, name='spaceinst',
    text='Please press SPACE\nto advance through Instructions\n(2 second minimum wait)',
    font='Arial',
    pos=(0, .35), height=.03, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-3.0);

# Initialize components for Routine "InstClose"
InstCloseClock = core.Clock()
key_resp_10 = keyboard.Keyboard()
DemocloseOthers = visual.TextStim(win=win, name='DemocloseOthers',
    text='Before you begin, please close down\nother tabs/memory heavy apps\n\nIf you need to do so, please press ESC\nonce, close this tab, close the offending\nprocesses, and reopen the experiment\n\nThis ensures that the experiment will\nrun properly and your data will be valid',
    font='Arial',
    pos=(0, 0), height=0.03, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-1.0);

# Initialize components for Routine "Inst1"
Inst1Clock = core.Clock()
key_resp_2 = keyboard.Keyboard()
demoring1 = visual.Polygon(
    win=win, name='demoring1',
    edges=100, size=(0.5, 0.5),
    ori=0, pos=(0, 0),
    lineWidth=1, lineColor=[1,1,1], lineColorSpace='rgb',
    fillColor=[0,0,0], fillColorSpace='rgb',
    opacity=1, depth=-1.0, interpolate=True)
demofix1 = visual.ShapeStim(
    win=win, name='demofix1', vertices='cross',
    size=(0.01, 0.01),
    ori=0, pos=(0, 0),
    lineWidth=1, lineColor=[1,1,1], lineColorSpace='rgb',
    fillColor=[1,1,1], fillColorSpace='rgb',
    opacity=1, depth=-2.0, interpolate=True)
demoWhatLike = visual.TextStim(win=win, name='demoWhatLike',
    text='Each trial will begin looking\nlike this:\n Please maintain fixation\non the cross when not responding\n(or reading instructions)',
    font='Arial',
    pos=(0, .35), height=0.03, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-3.0);

# Initialize components for Routine "Inst2"
Inst2Clock = core.Clock()
annul2 = visual.Polygon(
    win=win, name='annul2',
    edges=100, size=(0.5, 0.5),
    ori=0, pos=(0, 0),
    lineWidth=1, lineColor=[1,1,1], lineColorSpace='rgb',
    fillColor=[0,0,0], fillColorSpace='rgb',
    opacity=1, depth=0.0, interpolate=True)
fix2 = visual.ShapeStim(
    win=win, name='fix2', vertices='cross',
    size=(0.01, 0.01),
    ori=0, pos=(0, 0),
    lineWidth=1, lineColor=[1,1,1], lineColorSpace='rgb',
    fillColor=[1,1,1], fillColorSpace='rgb',
    opacity=1, depth=-1.0, interpolate=True)
key_resp_4 = keyboard.Keyboard()
demoOrdering = visual.TextStim(win=win, name='demoOrdering',
    text='There will alway be a Green target\nAny remaining targets\nwill, from clockwise to CCW\nbe Red, Blue, Magenta, then Yellow',
    font='Arial',
    pos=(0, .35), height=0.03, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-3.0);
fake1s = visual.Polygon(
    win=win, name='fake1s',
    edges=100, size=(0.015, 0.015),
    ori=0, pos=[0,0],
    lineWidth=1, lineColor=1.0, lineColorSpace='rgb',
    fillColor=1.0, fillColorSpace='rgb',
    opacity=1, depth=-4.0, interpolate=True)
fake2s = visual.Polygon(
    win=win, name='fake2s',
    edges=100, size=(0.015, 0.015),
    ori=0, pos=[0,0],
    lineWidth=1, lineColor=1.0, lineColorSpace='rgb',
    fillColor=1.0, fillColorSpace='rgb',
    opacity=1, depth=-5.0, interpolate=True)
fake3s = visual.Polygon(
    win=win, name='fake3s',
    edges=100, size=(0.015, 0.015),
    ori=0, pos=[0,0],
    lineWidth=1, lineColor=democols[2], lineColorSpace='rgb',
    fillColor=democols[2], fillColorSpace='rgb',
    opacity=1, depth=-6.0, interpolate=True)
fake4s = visual.Polygon(
    win=win, name='fake4s',
    edges=100, size=(0.015, 0.015),
    ori=0, pos=[0,0],
    lineWidth=1, lineColor=1.0, lineColorSpace='rgb',
    fillColor=1.0, fillColorSpace='rgb',
    opacity=1, depth=-7.0, interpolate=True)
fake5s = visual.Polygon(
    win=win, name='fake5s',
    edges=100, size=(0.015, 0.015),
    ori=0, pos=[0,0],
    lineWidth=1, lineColor=democols[4], lineColorSpace='rgb',
    fillColor=democols[4], fillColorSpace='rgb',
    opacity=1, depth=-8.0, interpolate=True)

# Initialize components for Routine "Inst3"
Inst3Clock = core.Clock()
key_resp_5 = keyboard.Keyboard()
annul3 = visual.Polygon(
    win=win, name='annul3',
    edges=100, size=(0.5, 0.5),
    ori=0, pos=(0, 0),
    lineWidth=1, lineColor=[1,1,1], lineColorSpace='rgb',
    fillColor=[0,0,0], fillColorSpace='rgb',
    opacity=1, depth=-1.0, interpolate=True)
fix3 = visual.ShapeStim(
    win=win, name='fix3', vertices='cross',
    size=(0.01, 0.01),
    ori=0, pos=(0, 0),
    lineWidth=1, lineColor=[1,1,1], lineColorSpace='rgb',
    fillColor=[1,1,1], fillColorSpace='rgb',
    opacity=1, depth=-2.0, interpolate=True)
demodelay = visual.TextStim(win=win, name='demodelay',
    text='There will be a\ndelay of 1,3,or 6 seconds\n',
    font='Arial',
    pos=(0, .35), height=0.03, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-3.0);

# Initialize components for Routine "Inst3_5"
Inst3_5Clock = core.Clock()
key_resp = keyboard.Keyboard()
demolasttarg = visual.TextStim(win=win, name='demolasttarg',
    text='Halfway through the delay,\na final target will apear for .5 seconds',
    font='Arial',
    pos=(0, 0), height=0.03, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-1.0);

# Initialize components for Routine "Inst4"
Inst4Clock = core.Clock()
key_resp_6 = keyboard.Keyboard()
demoStartResp = visual.TextStim(win=win, name='demoStartResp',
    text='At the end of the delay, a \nWhite circle will apear\nover the fixation:\n',
    font='Arial',
    pos=(0, 0), height=0.03, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-1.0);

# Initialize components for Routine "Inst5"
Inst5Clock = core.Clock()
key_resp_7 = keyboard.Keyboard()
demohowmove = visual.TextStim(win=win, name='demohowmove',
    text='Use the mouse to move \nthe WHITE circle to the location on the ring\nthat you consider the average (mean) \nlocation of all colored circles you saw\nin this trial\n\n',
    font='Arial',
    pos=(0, 0), height=0.03, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-1.0);

# Initialize components for Routine "Inst6"
Inst6Clock = core.Clock()
key_resp_8 = keyboard.Keyboard()
demoFB = visual.TextStim(win=win, name='demoFB',
    text='To lock in your response\nsimply left click\n\nYou will then recive feedback\nshowing your answer and the\ntrue location:\nGreen=Good!, Yellow=Ok, Red=Try Harder\n\nTry to minimize the difference!',
    font='Arial',
    pos=(0, 0), height=0.03, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-1.0);

# Initialize components for Routine "Inst7"
Inst7Clock = core.Clock()
key_resp_9 = keyboard.Keyboard()
text_3 = visual.TextStim(win=win, name='text_3',
    text='To start each trial\nclick the cross\n\nPlease DO NOT move the mouse\nuntil it is time to respond\n\nIf you must exit early\npress ESC twice\n\nYou may begin after pressing\nSPACE (waiting min 2 sec)',
    font='Arial',
    pos=(0, 0), height=0.03, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-1.0);

# Initialize components for Routine "StartTrial"
StartTrialClock = core.Clock()
fixstart = visual.ShapeStim(
    win=win, name='fixstart', vertices='cross',
    size=(0.01, 0.01),
    ori=0, pos=(0, 0),
    lineWidth=1, lineColor=[1,1,1], lineColorSpace='rgb',
    fillColor=[1,1,1], fillColorSpace='rgb',
    opacity=1, depth=-1.0, interpolate=True)
mouse_2 = event.Mouse(win=win)
x, y = [None, None]
mouse_2.mouseClock = core.Clock()
counterstart = visual.TextStim(win=win, name='counterstart',
    text='default text',
    font='Arial',
    pos=(0, -.35), height=0.03, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-3.0);
slashstart = visual.TextStim(win=win, name='slashstart',
    text='/',
    font='Arial',
    pos=(.03, -.35), height=0.03, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-4.0);
totalstart = visual.TextStim(win=win, name='totalstart',
    text='default text',
    font='Arial',
    pos=(.06, -.35), height=0.03, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-5.0);

# Initialize components for Routine "trial"
trialClock = core.Clock()

totalTrials=0;
sets=[[ -22,-2 ,7   , 13 ,   -11],[24 ,  -25  ,  -4 , 12  ,  6],[15 ,  -18 , 29 ,   3 ,  -30],[17  ,   0   , -22   , -10  ,  7],[0  ,   9 , -19 ,  -12  ,  28 ]];
colors=[[-1,1,-1],[1,-1,-1],[-1,-1,1],[1,-1,1],[1,1,-1]];
op2=0
op3=0
op4=0
theset=[];

time2=0;
time3=0;
time4=0;
time5=0;
Anulus = visual.Polygon(
    win=win, name='Anulus',
    edges=100, size=(.5, .5),
    ori=0, pos=(0, 0),
    lineWidth=1, lineColor=[1,1,1], lineColorSpace='rgb',
    fillColor=[0,0,0], fillColorSpace='rgb',
    opacity=1, depth=-1.0, interpolate=True)
Fixation = visual.ShapeStim(
    win=win, name='Fixation', vertices='cross',
    size=(0.01,.01),
    ori=0, pos=(0, 0),
    lineWidth=1, lineColor=[1,1,1], lineColorSpace='rgb',
    fillColor=[1,1,1], fillColorSpace='rgb',
    opacity=1, depth=-2.0, interpolate=True)
Targ1 = visual.Polygon(
    win=win, name='Targ1',
    edges=100, size=(0.015, 0.015),
    ori=0, pos=[0,0],
    lineWidth=1, lineColor=[-1,1,-1], lineColorSpace='rgb',
    fillColor=[-1,1,-1], fillColorSpace='rgb',
    opacity=1, depth=-3.0, interpolate=True)
Targ2 = visual.Polygon(
    win=win, name='Targ2',
    edges=100, size=(0.015, 0.015),
    ori=0, pos=[0,0],
    lineWidth=1, lineColor=[1,-1,-1], lineColorSpace='rgb',
    fillColor=[1,-1,-1], fillColorSpace='rgb',
    opacity=1.0, depth=-4.0, interpolate=True)
Targ3 = visual.Polygon(
    win=win, name='Targ3',
    edges=100, size=(0.015, 0.015),
    ori=0, pos=[0,0],
    lineWidth=1, lineColor=[-1,-1,1], lineColorSpace='rgb',
    fillColor=[-1,-1,1], fillColorSpace='rgb',
    opacity=1.0, depth=-5.0, interpolate=True)
Targ4 = visual.Polygon(
    win=win, name='Targ4',
    edges=100, size=(0.015, 0.015),
    ori=0, pos=[0,0],
    lineWidth=1, lineColor=[1,-1,1], lineColorSpace='rgb',
    fillColor=[1,-1,1], fillColorSpace='rgb',
    opacity=1.0, depth=-6.0, interpolate=True)
Targ5 = visual.Polygon(
    win=win, name='Targ5',
    edges=100, size=(0.015, 0.015),
    ori=0, pos=[0,0],
    lineWidth=1, lineColor=[1,1,-1], lineColorSpace='rgb',
    fillColor=[1,1,-1], fillColorSpace='rgb',
    opacity=1.0, depth=-7.0, interpolate=True)
counter = visual.TextStim(win=win, name='counter',
    text='default text',
    font='Arial',
    pos=(0, -.35), height=.03, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-8.0);
total = visual.TextStim(win=win, name='total',
    text='default text',
    font='Arial',
    pos=(.06, -.35), height=.03, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-9.0);
slash = visual.TextStim(win=win, name='slash',
    text='/',
    font='Arial',
    pos=(.03, -.35), height=0.03, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-10.0);

# Initialize components for Routine "Respond"
RespondClock = core.Clock()
anulus = visual.Polygon(
    win=win, name='anulus',
    edges=100, size=(.5, 0.5),
    ori=0, pos=(0, 0),
    lineWidth=1, lineColor=[1,1,1], lineColorSpace='rgb',
    fillColor=[0,0,0], fillColorSpace='rgb',
    opacity=1, depth=0.0, interpolate=True)
fixation = visual.ShapeStim(
    win=win, name='fixation', vertices='cross',
    size=(0.01, .01),
    ori=0, pos=(0, 0),
    lineWidth=1, lineColor=[1,1,1], lineColorSpace='rgb',
    fillColor=[1,1,1], fillColorSpace='rgb',
    opacity=1, depth=-1.0, interpolate=True)
InnerRing = visual.Polygon(
    win=win, name='InnerRing',
    edges=100, size=(.48,.48),
    ori=0, pos=(0, 0),
    lineWidth=1, lineColor=[1,1,1], lineColorSpace='rgb',
    fillColor=[1,1,1], fillColorSpace='rgb',
    opacity=0, depth=-2.0, interpolate=True)
OuterRing = visual.Polygon(
    win=win, name='OuterRing',
    edges=100, size=[.52,.52],
    ori=0, pos=(0, 0),
    lineWidth=1, lineColor=[1,1,1], lineColorSpace='rgb',
    fillColor=[1,1,1], fillColorSpace='rgb',
    opacity=0, depth=-3.0, interpolate=True)
mouse = event.Mouse(win=win)
x, y = [None, None]
mouse.mouseClock = core.Clock()
respPosx=0;
respPosy=0;

response = visual.Polygon(
    win=win, name='response',
    edges=100, size=(0.01, 0.01),
    ori=0, pos=[0,0],
    lineWidth=1, lineColor=1.0, lineColorSpace='rgb',
    fillColor=1.0, fillColorSpace='rgb',
    opacity=1, depth=-6.0, interpolate=True)
counter2 = visual.TextStim(win=win, name='counter2',
    text='default text',
    font='Arial',
    pos=(0, -.35), height=.03, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-7.0);
total2 = visual.TextStim(win=win, name='total2',
    text='default text',
    font='Arial',
    pos=(.06, -.35), height=.03, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-8.0);
text_2 = visual.TextStim(win=win, name='text_2',
    text='/',
    font='Arial',
    pos=(.03, -.35), height=0.03, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-9.0);

# Initialize components for Routine "Feedback"
FeedbackClock = core.Clock()
win=0;
win=psychoJS.window;
green= util.Color([-1, 1, -1]);
ProgVertices=[[.25,0],[.2501,0]];
Test1=visual.ShapeStim(win=win, name='Test1', lineWidth=20, shapeFlineColor = green, lineColorSpace='rgb', fillColor=green, fillColorSpace='rgb', vertices = ProgVertices, pos = [0,0], closeShape=False, autoDraw = True)
fixy = visual.ShapeStim(
    win=win, name='fixy', vertices='cross',
    size=(0.01, .01),
    ori=0, pos=(0, 0),
    lineWidth=1, lineColor=[1,1,1], lineColorSpace='rgb',
    fillColor=[1,1,1], fillColorSpace='rgb',
    opacity=1, depth=-2.0, interpolate=True)
anul = visual.Polygon(
    win=win, name='anul',
    edges=100, size=(.5, .5),
    ori=0, pos=(0, 0),
    lineWidth=1, lineColor=[1,1,1], lineColorSpace='rgb',
    fillColor=[0,0,0], fillColorSpace='rgb',
    opacity=1, depth=-3.0, interpolate=True)
trueans = visual.Line(
    win=win, name='trueans',
    start=(-(0.03, 0.03)[0]/2.0, 0), end=(+(0.03, 0.03)[0]/2.0, 0),
    ori=1.0, pos=[0,0],
    lineWidth=2, lineColor=1.0, lineColorSpace='rgb',
    fillColor=1.0, fillColorSpace='rgb',
    opacity=1, depth=-4.0, interpolate=True)
yourans = visual.Polygon(
    win=win, name='yourans',
    edges=100, size=(0.01, 0.01),
    ori=0, pos=[0,0],
    lineWidth=1, lineColor=1.0, lineColorSpace='rgb',
    fillColor=1.0, fillColorSpace='rgb',
    opacity=1, depth=-5.0, interpolate=True)
counter3 = visual.TextStim(win=win, name='counter3',
    text='default text',
    font='Arial',
    pos=(0, -.35), height=.03, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-6.0);
slash3 = visual.TextStim(win=win, name='slash3',
    text='/',
    font='Arial',
    pos=(.03, -.35), height=0.03, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-7.0);
tots3 = visual.TextStim(win=win, name='tots3',
    text='default text',
    font='Arial',
    pos=(.06, -.35), height=.03, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-8.0);

# Initialize components for Routine "buffer"
bufferClock = core.Clock()
document.body.style.cursor='auto';

text_4 = visual.TextStim(win=win, name='text_4',
    text='Thank you!',
    font='Arial',
    pos=(0, 0), height=0.1, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-1.0);

# Create some handy timers
globalClock = core.Clock()  # to track the time since experiment started
routineTimer = core.CountdownTimer()  # to track time remaining of each (non-slip) routine 

# ------Prepare to start Routine "Inst"-------
continueRoutine = True
# update component parameters for each repeat
key_resp_3.keys = []
key_resp_3.rt = []
_key_resp_3_allKeys = []
RespType=0;
totalTrials=1;
document.body.style.cursor='none';

pi=3.14
pos1x=radius*Math.cos(demoset[0]*pi/180);
pos1y=radius*Math.sin(demoset[0]*pi/180);
pos2x=radius*Math.cos(demoset[1]*pi/180);
pos2y=radius*Math.sin(demoset[1]*pi/180);
pos3x=radius*Math.cos(demoset[2]*pi/180);
pos3y=radius*Math.sin(demoset[2]*pi/180);
pos4x=radius*Math.cos(demoset[3]*pi/180);
pos4y=radius*Math.sin(demoset[3]*pi/180);
pos5x=radius*Math.cos(demoset[4]*pi/180);
pos5y=radius*Math.sin(demoset[4]*pi/180);

# keep track of which components have finished
InstComponents = [key_resp_3, instructions, spaceinst]
for thisComponent in InstComponents:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
InstClock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
frameN = -1

# -------Run Routine "Inst"-------
while continueRoutine:
    # get current time
    t = InstClock.getTime()
    tThisFlip = win.getFutureFlipTime(clock=InstClock)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *key_resp_3* updates
    waitOnFlip = False
    if key_resp_3.status == NOT_STARTED and tThisFlip >= 4-frameTolerance:
        # keep track of start time/frame for later
        key_resp_3.frameNStart = frameN  # exact frame index
        key_resp_3.tStart = t  # local t and not account for scr refresh
        key_resp_3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(key_resp_3, 'tStartRefresh')  # time at next scr refresh
        key_resp_3.status = STARTED
        # keyboard checking is just starting
        waitOnFlip = True
        win.callOnFlip(key_resp_3.clock.reset)  # t=0 on next screen flip
        win.callOnFlip(key_resp_3.clearEvents, eventType='keyboard')  # clear events on next screen flip
    if key_resp_3.status == STARTED and not waitOnFlip:
        theseKeys = key_resp_3.getKeys(keyList=['space'], waitRelease=False)
        _key_resp_3_allKeys.extend(theseKeys)
        if len(_key_resp_3_allKeys):
            key_resp_3.keys = _key_resp_3_allKeys[-1].name  # just the last key pressed
            key_resp_3.rt = _key_resp_3_allKeys[-1].rt
            # a response ends the routine
            continueRoutine = False
    
    # *instructions* updates
    if instructions.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        instructions.frameNStart = frameN  # exact frame index
        instructions.tStart = t  # local t and not account for scr refresh
        instructions.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(instructions, 'tStartRefresh')  # time at next scr refresh
        instructions.setAutoDraw(True)
    if instructions.status == STARTED:
        # is it time to stop? (based on global clock, using actual start)
        if tThisFlipGlobal > instructions.tStartRefresh + 1.5-frameTolerance:
            # keep track of stop time/frame for later
            instructions.tStop = t  # not accounting for scr refresh
            instructions.frameNStop = frameN  # exact frame index
            win.timeOnFlip(instructions, 'tStopRefresh')  # time at next scr refresh
            instructions.setAutoDraw(False)
    
    # *spaceinst* updates
    if spaceinst.status == NOT_STARTED and tThisFlip >= 1.5-frameTolerance:
        # keep track of start time/frame for later
        spaceinst.frameNStart = frameN  # exact frame index
        spaceinst.tStart = t  # local t and not account for scr refresh
        spaceinst.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(spaceinst, 'tStartRefresh')  # time at next scr refresh
        spaceinst.setAutoDraw(True)
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in InstComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# -------Ending Routine "Inst"-------
for thisComponent in InstComponents:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
# the Routine "Inst" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# ------Prepare to start Routine "InstClose"-------
continueRoutine = True
# update component parameters for each repeat
key_resp_10.keys = []
key_resp_10.rt = []
_key_resp_10_allKeys = []
# keep track of which components have finished
InstCloseComponents = [key_resp_10, DemocloseOthers]
for thisComponent in InstCloseComponents:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
InstCloseClock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
frameN = -1

# -------Run Routine "InstClose"-------
while continueRoutine:
    # get current time
    t = InstCloseClock.getTime()
    tThisFlip = win.getFutureFlipTime(clock=InstCloseClock)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *key_resp_10* updates
    waitOnFlip = False
    if key_resp_10.status == NOT_STARTED and tThisFlip >= 2-frameTolerance:
        # keep track of start time/frame for later
        key_resp_10.frameNStart = frameN  # exact frame index
        key_resp_10.tStart = t  # local t and not account for scr refresh
        key_resp_10.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(key_resp_10, 'tStartRefresh')  # time at next scr refresh
        key_resp_10.status = STARTED
        # keyboard checking is just starting
        waitOnFlip = True
        win.callOnFlip(key_resp_10.clock.reset)  # t=0 on next screen flip
        win.callOnFlip(key_resp_10.clearEvents, eventType='keyboard')  # clear events on next screen flip
    if key_resp_10.status == STARTED and not waitOnFlip:
        theseKeys = key_resp_10.getKeys(keyList=['space'], waitRelease=False)
        _key_resp_10_allKeys.extend(theseKeys)
        if len(_key_resp_10_allKeys):
            key_resp_10.keys = _key_resp_10_allKeys[-1].name  # just the last key pressed
            key_resp_10.rt = _key_resp_10_allKeys[-1].rt
            # a response ends the routine
            continueRoutine = False
    
    # *DemocloseOthers* updates
    if DemocloseOthers.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        DemocloseOthers.frameNStart = frameN  # exact frame index
        DemocloseOthers.tStart = t  # local t and not account for scr refresh
        DemocloseOthers.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(DemocloseOthers, 'tStartRefresh')  # time at next scr refresh
        DemocloseOthers.setAutoDraw(True)
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in InstCloseComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# -------Ending Routine "InstClose"-------
for thisComponent in InstCloseComponents:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
# the Routine "InstClose" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# ------Prepare to start Routine "Inst1"-------
continueRoutine = True
# update component parameters for each repeat
key_resp_2.keys = []
key_resp_2.rt = []
_key_resp_2_allKeys = []
# keep track of which components have finished
Inst1Components = [key_resp_2, demoring1, demofix1, demoWhatLike]
for thisComponent in Inst1Components:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
Inst1Clock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
frameN = -1

# -------Run Routine "Inst1"-------
while continueRoutine:
    # get current time
    t = Inst1Clock.getTime()
    tThisFlip = win.getFutureFlipTime(clock=Inst1Clock)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *key_resp_2* updates
    waitOnFlip = False
    if key_resp_2.status == NOT_STARTED and tThisFlip >= 3-frameTolerance:
        # keep track of start time/frame for later
        key_resp_2.frameNStart = frameN  # exact frame index
        key_resp_2.tStart = t  # local t and not account for scr refresh
        key_resp_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(key_resp_2, 'tStartRefresh')  # time at next scr refresh
        key_resp_2.status = STARTED
        # keyboard checking is just starting
        waitOnFlip = True
        win.callOnFlip(key_resp_2.clock.reset)  # t=0 on next screen flip
        win.callOnFlip(key_resp_2.clearEvents, eventType='keyboard')  # clear events on next screen flip
    if key_resp_2.status == STARTED and not waitOnFlip:
        theseKeys = key_resp_2.getKeys(keyList=['space'], waitRelease=False)
        _key_resp_2_allKeys.extend(theseKeys)
        if len(_key_resp_2_allKeys):
            key_resp_2.keys = _key_resp_2_allKeys[-1].name  # just the last key pressed
            key_resp_2.rt = _key_resp_2_allKeys[-1].rt
            # a response ends the routine
            continueRoutine = False
    
    # *demoring1* updates
    if demoring1.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        demoring1.frameNStart = frameN  # exact frame index
        demoring1.tStart = t  # local t and not account for scr refresh
        demoring1.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(demoring1, 'tStartRefresh')  # time at next scr refresh
        demoring1.setAutoDraw(True)
    
    # *demofix1* updates
    if demofix1.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        demofix1.frameNStart = frameN  # exact frame index
        demofix1.tStart = t  # local t and not account for scr refresh
        demofix1.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(demofix1, 'tStartRefresh')  # time at next scr refresh
        demofix1.setAutoDraw(True)
    
    # *demoWhatLike* updates
    if demoWhatLike.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        demoWhatLike.frameNStart = frameN  # exact frame index
        demoWhatLike.tStart = t  # local t and not account for scr refresh
        demoWhatLike.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(demoWhatLike, 'tStartRefresh')  # time at next scr refresh
        demoWhatLike.setAutoDraw(True)
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in Inst1Components:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# -------Ending Routine "Inst1"-------
for thisComponent in Inst1Components:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
thisExp.addData('demoWhatLike.started', demoWhatLike.tStartRefresh)
thisExp.addData('demoWhatLike.stopped', demoWhatLike.tStopRefresh)
# the Routine "Inst1" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# ------Prepare to start Routine "Inst2"-------
continueRoutine = True
# update component parameters for each repeat
key_resp_4.keys = []
key_resp_4.rt = []
_key_resp_4_allKeys = []
fake1s.setPos([pos1x,pos1y])
fake1s.setFillColor(democols[0])
fake1s.setLineColor(democols[0])
fake2s.setPos([pos2x,pos2y])
fake2s.setFillColor(democols[1])
fake2s.setLineColor(democols[1])
fake3s.setPos([pos3x,pos3y])
fake4s.setPos([pos4x,pos4y])
fake4s.setFillColor(democols[3])
fake4s.setLineColor(democols[3])
fake5s.setPos([pos5x,pos5y])
# keep track of which components have finished
Inst2Components = [annul2, fix2, key_resp_4, demoOrdering, fake1s, fake2s, fake3s, fake4s, fake5s]
for thisComponent in Inst2Components:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
Inst2Clock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
frameN = -1

# -------Run Routine "Inst2"-------
while continueRoutine:
    # get current time
    t = Inst2Clock.getTime()
    tThisFlip = win.getFutureFlipTime(clock=Inst2Clock)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *annul2* updates
    if annul2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        annul2.frameNStart = frameN  # exact frame index
        annul2.tStart = t  # local t and not account for scr refresh
        annul2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(annul2, 'tStartRefresh')  # time at next scr refresh
        annul2.setAutoDraw(True)
    
    # *fix2* updates
    if fix2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        fix2.frameNStart = frameN  # exact frame index
        fix2.tStart = t  # local t and not account for scr refresh
        fix2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(fix2, 'tStartRefresh')  # time at next scr refresh
        fix2.setAutoDraw(True)
    
    # *key_resp_4* updates
    waitOnFlip = False
    if key_resp_4.status == NOT_STARTED and tThisFlip >= 2-frameTolerance:
        # keep track of start time/frame for later
        key_resp_4.frameNStart = frameN  # exact frame index
        key_resp_4.tStart = t  # local t and not account for scr refresh
        key_resp_4.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(key_resp_4, 'tStartRefresh')  # time at next scr refresh
        key_resp_4.status = STARTED
        # keyboard checking is just starting
        waitOnFlip = True
        win.callOnFlip(key_resp_4.clock.reset)  # t=0 on next screen flip
        win.callOnFlip(key_resp_4.clearEvents, eventType='keyboard')  # clear events on next screen flip
    if key_resp_4.status == STARTED and not waitOnFlip:
        theseKeys = key_resp_4.getKeys(keyList=['space'], waitRelease=False)
        _key_resp_4_allKeys.extend(theseKeys)
        if len(_key_resp_4_allKeys):
            key_resp_4.keys = _key_resp_4_allKeys[-1].name  # just the last key pressed
            key_resp_4.rt = _key_resp_4_allKeys[-1].rt
            # a response ends the routine
            continueRoutine = False
    
    # *demoOrdering* updates
    if demoOrdering.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        demoOrdering.frameNStart = frameN  # exact frame index
        demoOrdering.tStart = t  # local t and not account for scr refresh
        demoOrdering.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(demoOrdering, 'tStartRefresh')  # time at next scr refresh
        demoOrdering.setAutoDraw(True)
    
    # *fake1s* updates
    if fake1s.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        fake1s.frameNStart = frameN  # exact frame index
        fake1s.tStart = t  # local t and not account for scr refresh
        fake1s.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(fake1s, 'tStartRefresh')  # time at next scr refresh
        fake1s.setAutoDraw(True)
    
    # *fake2s* updates
    if fake2s.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        fake2s.frameNStart = frameN  # exact frame index
        fake2s.tStart = t  # local t and not account for scr refresh
        fake2s.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(fake2s, 'tStartRefresh')  # time at next scr refresh
        fake2s.setAutoDraw(True)
    
    # *fake3s* updates
    if fake3s.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        fake3s.frameNStart = frameN  # exact frame index
        fake3s.tStart = t  # local t and not account for scr refresh
        fake3s.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(fake3s, 'tStartRefresh')  # time at next scr refresh
        fake3s.setAutoDraw(True)
    
    # *fake4s* updates
    if fake4s.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        fake4s.frameNStart = frameN  # exact frame index
        fake4s.tStart = t  # local t and not account for scr refresh
        fake4s.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(fake4s, 'tStartRefresh')  # time at next scr refresh
        fake4s.setAutoDraw(True)
    
    # *fake5s* updates
    if fake5s.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        fake5s.frameNStart = frameN  # exact frame index
        fake5s.tStart = t  # local t and not account for scr refresh
        fake5s.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(fake5s, 'tStartRefresh')  # time at next scr refresh
        fake5s.setAutoDraw(True)
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in Inst2Components:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# -------Ending Routine "Inst2"-------
for thisComponent in Inst2Components:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
thisExp.addData('demoOrdering.started', demoOrdering.tStartRefresh)
thisExp.addData('demoOrdering.stopped', demoOrdering.tStopRefresh)
# the Routine "Inst2" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# ------Prepare to start Routine "Inst3"-------
continueRoutine = True
# update component parameters for each repeat
key_resp_5.keys = []
key_resp_5.rt = []
_key_resp_5_allKeys = []
# keep track of which components have finished
Inst3Components = [key_resp_5, annul3, fix3, demodelay]
for thisComponent in Inst3Components:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
Inst3Clock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
frameN = -1

# -------Run Routine "Inst3"-------
while continueRoutine:
    # get current time
    t = Inst3Clock.getTime()
    tThisFlip = win.getFutureFlipTime(clock=Inst3Clock)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *key_resp_5* updates
    waitOnFlip = False
    if key_resp_5.status == NOT_STARTED and tThisFlip >= 2-frameTolerance:
        # keep track of start time/frame for later
        key_resp_5.frameNStart = frameN  # exact frame index
        key_resp_5.tStart = t  # local t and not account for scr refresh
        key_resp_5.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(key_resp_5, 'tStartRefresh')  # time at next scr refresh
        key_resp_5.status = STARTED
        # keyboard checking is just starting
        waitOnFlip = True
        win.callOnFlip(key_resp_5.clock.reset)  # t=0 on next screen flip
        win.callOnFlip(key_resp_5.clearEvents, eventType='keyboard')  # clear events on next screen flip
    if key_resp_5.status == STARTED and not waitOnFlip:
        theseKeys = key_resp_5.getKeys(keyList=['space'], waitRelease=False)
        _key_resp_5_allKeys.extend(theseKeys)
        if len(_key_resp_5_allKeys):
            key_resp_5.keys = _key_resp_5_allKeys[-1].name  # just the last key pressed
            key_resp_5.rt = _key_resp_5_allKeys[-1].rt
            # a response ends the routine
            continueRoutine = False
    
    # *annul3* updates
    if annul3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        annul3.frameNStart = frameN  # exact frame index
        annul3.tStart = t  # local t and not account for scr refresh
        annul3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(annul3, 'tStartRefresh')  # time at next scr refresh
        annul3.setAutoDraw(True)
    
    # *fix3* updates
    if fix3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        fix3.frameNStart = frameN  # exact frame index
        fix3.tStart = t  # local t and not account for scr refresh
        fix3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(fix3, 'tStartRefresh')  # time at next scr refresh
        fix3.setAutoDraw(True)
    
    # *demodelay* updates
    if demodelay.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        demodelay.frameNStart = frameN  # exact frame index
        demodelay.tStart = t  # local t and not account for scr refresh
        demodelay.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(demodelay, 'tStartRefresh')  # time at next scr refresh
        demodelay.setAutoDraw(True)
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in Inst3Components:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# -------Ending Routine "Inst3"-------
for thisComponent in Inst3Components:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
thisExp.addData('demodelay.started', demodelay.tStartRefresh)
thisExp.addData('demodelay.stopped', demodelay.tStopRefresh)
# the Routine "Inst3" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# ------Prepare to start Routine "Inst3_5"-------
continueRoutine = True
# update component parameters for each repeat
key_resp.keys = []
key_resp.rt = []
_key_resp_allKeys = []
# keep track of which components have finished
Inst3_5Components = [key_resp, demolasttarg]
for thisComponent in Inst3_5Components:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
Inst3_5Clock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
frameN = -1

# -------Run Routine "Inst3_5"-------
while continueRoutine:
    # get current time
    t = Inst3_5Clock.getTime()
    tThisFlip = win.getFutureFlipTime(clock=Inst3_5Clock)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *key_resp* updates
    waitOnFlip = False
    if key_resp.status == NOT_STARTED and tThisFlip >= 2-frameTolerance:
        # keep track of start time/frame for later
        key_resp.frameNStart = frameN  # exact frame index
        key_resp.tStart = t  # local t and not account for scr refresh
        key_resp.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(key_resp, 'tStartRefresh')  # time at next scr refresh
        key_resp.status = STARTED
        # keyboard checking is just starting
        waitOnFlip = True
        win.callOnFlip(key_resp.clock.reset)  # t=0 on next screen flip
        win.callOnFlip(key_resp.clearEvents, eventType='keyboard')  # clear events on next screen flip
    if key_resp.status == STARTED and not waitOnFlip:
        theseKeys = key_resp.getKeys(keyList=['space'], waitRelease=False)
        _key_resp_allKeys.extend(theseKeys)
        if len(_key_resp_allKeys):
            key_resp.keys = _key_resp_allKeys[-1].name  # just the last key pressed
            key_resp.rt = _key_resp_allKeys[-1].rt
            # a response ends the routine
            continueRoutine = False
    
    # *demolasttarg* updates
    if demolasttarg.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        demolasttarg.frameNStart = frameN  # exact frame index
        demolasttarg.tStart = t  # local t and not account for scr refresh
        demolasttarg.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(demolasttarg, 'tStartRefresh')  # time at next scr refresh
        demolasttarg.setAutoDraw(True)
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in Inst3_5Components:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# -------Ending Routine "Inst3_5"-------
for thisComponent in Inst3_5Components:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
thisExp.addData('demolasttarg.started', demolasttarg.tStartRefresh)
thisExp.addData('demolasttarg.stopped', demolasttarg.tStopRefresh)
# the Routine "Inst3_5" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# ------Prepare to start Routine "Inst4"-------
continueRoutine = True
# update component parameters for each repeat
key_resp_6.keys = []
key_resp_6.rt = []
_key_resp_6_allKeys = []
# keep track of which components have finished
Inst4Components = [key_resp_6, demoStartResp]
for thisComponent in Inst4Components:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
Inst4Clock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
frameN = -1

# -------Run Routine "Inst4"-------
while continueRoutine:
    # get current time
    t = Inst4Clock.getTime()
    tThisFlip = win.getFutureFlipTime(clock=Inst4Clock)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *key_resp_6* updates
    waitOnFlip = False
    if key_resp_6.status == NOT_STARTED and tThisFlip >= 2-frameTolerance:
        # keep track of start time/frame for later
        key_resp_6.frameNStart = frameN  # exact frame index
        key_resp_6.tStart = t  # local t and not account for scr refresh
        key_resp_6.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(key_resp_6, 'tStartRefresh')  # time at next scr refresh
        key_resp_6.status = STARTED
        # keyboard checking is just starting
        waitOnFlip = True
        win.callOnFlip(key_resp_6.clock.reset)  # t=0 on next screen flip
        win.callOnFlip(key_resp_6.clearEvents, eventType='keyboard')  # clear events on next screen flip
    if key_resp_6.status == STARTED and not waitOnFlip:
        theseKeys = key_resp_6.getKeys(keyList=['space'], waitRelease=False)
        _key_resp_6_allKeys.extend(theseKeys)
        if len(_key_resp_6_allKeys):
            key_resp_6.keys = _key_resp_6_allKeys[-1].name  # just the last key pressed
            key_resp_6.rt = _key_resp_6_allKeys[-1].rt
            # a response ends the routine
            continueRoutine = False
    
    # *demoStartResp* updates
    if demoStartResp.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        demoStartResp.frameNStart = frameN  # exact frame index
        demoStartResp.tStart = t  # local t and not account for scr refresh
        demoStartResp.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(demoStartResp, 'tStartRefresh')  # time at next scr refresh
        demoStartResp.setAutoDraw(True)
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in Inst4Components:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# -------Ending Routine "Inst4"-------
for thisComponent in Inst4Components:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
# the Routine "Inst4" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# ------Prepare to start Routine "Inst5"-------
continueRoutine = True
# update component parameters for each repeat
key_resp_7.keys = []
key_resp_7.rt = []
_key_resp_7_allKeys = []
# keep track of which components have finished
Inst5Components = [key_resp_7, demohowmove]
for thisComponent in Inst5Components:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
Inst5Clock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
frameN = -1

# -------Run Routine "Inst5"-------
while continueRoutine:
    # get current time
    t = Inst5Clock.getTime()
    tThisFlip = win.getFutureFlipTime(clock=Inst5Clock)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *key_resp_7* updates
    waitOnFlip = False
    if key_resp_7.status == NOT_STARTED and tThisFlip >= 2-frameTolerance:
        # keep track of start time/frame for later
        key_resp_7.frameNStart = frameN  # exact frame index
        key_resp_7.tStart = t  # local t and not account for scr refresh
        key_resp_7.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(key_resp_7, 'tStartRefresh')  # time at next scr refresh
        key_resp_7.status = STARTED
        # keyboard checking is just starting
        waitOnFlip = True
        win.callOnFlip(key_resp_7.clock.reset)  # t=0 on next screen flip
        win.callOnFlip(key_resp_7.clearEvents, eventType='keyboard')  # clear events on next screen flip
    if key_resp_7.status == STARTED and not waitOnFlip:
        theseKeys = key_resp_7.getKeys(keyList=['space'], waitRelease=False)
        _key_resp_7_allKeys.extend(theseKeys)
        if len(_key_resp_7_allKeys):
            key_resp_7.keys = _key_resp_7_allKeys[-1].name  # just the last key pressed
            key_resp_7.rt = _key_resp_7_allKeys[-1].rt
            # a response ends the routine
            continueRoutine = False
    
    # *demohowmove* updates
    if demohowmove.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        demohowmove.frameNStart = frameN  # exact frame index
        demohowmove.tStart = t  # local t and not account for scr refresh
        demohowmove.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(demohowmove, 'tStartRefresh')  # time at next scr refresh
        demohowmove.setAutoDraw(True)
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in Inst5Components:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# -------Ending Routine "Inst5"-------
for thisComponent in Inst5Components:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
# the Routine "Inst5" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# ------Prepare to start Routine "Inst6"-------
continueRoutine = True
# update component parameters for each repeat
key_resp_8.keys = []
key_resp_8.rt = []
_key_resp_8_allKeys = []
# keep track of which components have finished
Inst6Components = [key_resp_8, demoFB]
for thisComponent in Inst6Components:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
Inst6Clock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
frameN = -1

# -------Run Routine "Inst6"-------
while continueRoutine:
    # get current time
    t = Inst6Clock.getTime()
    tThisFlip = win.getFutureFlipTime(clock=Inst6Clock)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *key_resp_8* updates
    waitOnFlip = False
    if key_resp_8.status == NOT_STARTED and tThisFlip >= 2-frameTolerance:
        # keep track of start time/frame for later
        key_resp_8.frameNStart = frameN  # exact frame index
        key_resp_8.tStart = t  # local t and not account for scr refresh
        key_resp_8.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(key_resp_8, 'tStartRefresh')  # time at next scr refresh
        key_resp_8.status = STARTED
        # keyboard checking is just starting
        waitOnFlip = True
        win.callOnFlip(key_resp_8.clock.reset)  # t=0 on next screen flip
        win.callOnFlip(key_resp_8.clearEvents, eventType='keyboard')  # clear events on next screen flip
    if key_resp_8.status == STARTED and not waitOnFlip:
        theseKeys = key_resp_8.getKeys(keyList=['space'], waitRelease=False)
        _key_resp_8_allKeys.extend(theseKeys)
        if len(_key_resp_8_allKeys):
            key_resp_8.keys = _key_resp_8_allKeys[-1].name  # just the last key pressed
            key_resp_8.rt = _key_resp_8_allKeys[-1].rt
            # a response ends the routine
            continueRoutine = False
    
    # *demoFB* updates
    if demoFB.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        demoFB.frameNStart = frameN  # exact frame index
        demoFB.tStart = t  # local t and not account for scr refresh
        demoFB.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(demoFB, 'tStartRefresh')  # time at next scr refresh
        demoFB.setAutoDraw(True)
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in Inst6Components:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# -------Ending Routine "Inst6"-------
for thisComponent in Inst6Components:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
# the Routine "Inst6" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# ------Prepare to start Routine "Inst7"-------
continueRoutine = True
# update component parameters for each repeat
key_resp_9.keys = []
key_resp_9.rt = []
_key_resp_9_allKeys = []
# keep track of which components have finished
Inst7Components = [key_resp_9, text_3]
for thisComponent in Inst7Components:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
Inst7Clock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
frameN = -1

# -------Run Routine "Inst7"-------
while continueRoutine:
    # get current time
    t = Inst7Clock.getTime()
    tThisFlip = win.getFutureFlipTime(clock=Inst7Clock)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *key_resp_9* updates
    waitOnFlip = False
    if key_resp_9.status == NOT_STARTED and tThisFlip >= 2-frameTolerance:
        # keep track of start time/frame for later
        key_resp_9.frameNStart = frameN  # exact frame index
        key_resp_9.tStart = t  # local t and not account for scr refresh
        key_resp_9.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(key_resp_9, 'tStartRefresh')  # time at next scr refresh
        key_resp_9.status = STARTED
        # keyboard checking is just starting
        waitOnFlip = True
        win.callOnFlip(key_resp_9.clock.reset)  # t=0 on next screen flip
        win.callOnFlip(key_resp_9.clearEvents, eventType='keyboard')  # clear events on next screen flip
    if key_resp_9.status == STARTED and not waitOnFlip:
        theseKeys = key_resp_9.getKeys(keyList=['space'], waitRelease=False)
        _key_resp_9_allKeys.extend(theseKeys)
        if len(_key_resp_9_allKeys):
            key_resp_9.keys = _key_resp_9_allKeys[-1].name  # just the last key pressed
            key_resp_9.rt = _key_resp_9_allKeys[-1].rt
            # a response ends the routine
            continueRoutine = False
    
    # *text_3* updates
    if text_3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        text_3.frameNStart = frameN  # exact frame index
        text_3.tStart = t  # local t and not account for scr refresh
        text_3.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(text_3, 'tStartRefresh')  # time at next scr refresh
        text_3.setAutoDraw(True)
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in Inst7Components:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# -------Ending Routine "Inst7"-------
for thisComponent in Inst7Components:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
# the Routine "Inst7" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# set up handler to look after randomisation of conditions etc
trials = data.TrialHandler(nReps=70, method='random', 
    extraInfo=expInfo, originPath=-1,
    trialList=data.importConditions('Conditions.xlsx'),
    seed=None, name='trials')
thisExp.addLoop(trials)  # add the loop to the experiment
thisTrial = trials.trialList[0]  # so we can initialise stimuli with some values
# abbreviate parameter names if possible (e.g. rgb = thisTrial.rgb)
if thisTrial != None:
    for paramName in thisTrial:
        exec('{} = thisTrial[paramName]'.format(paramName))

for thisTrial in trials:
    currentLoop = trials
    # abbreviate parameter names if possible (e.g. rgb = thisTrial.rgb)
    if thisTrial != None:
        for paramName in thisTrial:
            exec('{} = thisTrial[paramName]'.format(paramName))
    
    # ------Prepare to start Routine "StartTrial"-------
    continueRoutine = True
    # update component parameters for each repeat
    document.body.style.cursor='auto';
    
    # setup some python lists for storing info about the mouse_2
    mouse_2.clicked_name = []
    gotValidClick = False  # until a click is received
    counterstart.setText(totalTrials)
    totalstart.setText(trials.nTotal)
    # keep track of which components have finished
    StartTrialComponents = [fixstart, mouse_2, counterstart, slashstart, totalstart]
    for thisComponent in StartTrialComponents:
        thisComponent.tStart = None
        thisComponent.tStop = None
        thisComponent.tStartRefresh = None
        thisComponent.tStopRefresh = None
        if hasattr(thisComponent, 'status'):
            thisComponent.status = NOT_STARTED
    # reset timers
    t = 0
    _timeToFirstFrame = win.getFutureFlipTime(clock="now")
    StartTrialClock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
    frameN = -1
    
    # -------Run Routine "StartTrial"-------
    while continueRoutine:
        # get current time
        t = StartTrialClock.getTime()
        tThisFlip = win.getFutureFlipTime(clock=StartTrialClock)
        tThisFlipGlobal = win.getFutureFlipTime(clock=None)
        frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
        # update/draw components on each frame
        
        # *fixstart* updates
        if fixstart.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            fixstart.frameNStart = frameN  # exact frame index
            fixstart.tStart = t  # local t and not account for scr refresh
            fixstart.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(fixstart, 'tStartRefresh')  # time at next scr refresh
            fixstart.setAutoDraw(True)
        # *mouse_2* updates
        if mouse_2.status == NOT_STARTED and t >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            mouse_2.frameNStart = frameN  # exact frame index
            mouse_2.tStart = t  # local t and not account for scr refresh
            mouse_2.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(mouse_2, 'tStartRefresh')  # time at next scr refresh
            mouse_2.status = STARTED
            mouse_2.mouseClock.reset()
            prevButtonState = [0, 0, 0]  # if now button is down we will treat as 'new' click
        if mouse_2.status == STARTED:  # only update if started and not finished!
            buttons = mouse_2.getPressed()
            if buttons != prevButtonState:  # button state changed?
                prevButtonState = buttons
                if sum(buttons) > 0:  # state changed to a new click
                    # check if the mouse was inside our 'clickable' objects
                    gotValidClick = False
                    for obj in [fixstart]:
                        if obj.contains(mouse_2):
                            gotValidClick = True
                            mouse_2.clicked_name.append(obj.name)
                    if gotValidClick:  # abort routine on response
                        continueRoutine = False
        
        # *counterstart* updates
        if counterstart.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            counterstart.frameNStart = frameN  # exact frame index
            counterstart.tStart = t  # local t and not account for scr refresh
            counterstart.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(counterstart, 'tStartRefresh')  # time at next scr refresh
            counterstart.setAutoDraw(True)
        
        # *slashstart* updates
        if slashstart.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            slashstart.frameNStart = frameN  # exact frame index
            slashstart.tStart = t  # local t and not account for scr refresh
            slashstart.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(slashstart, 'tStartRefresh')  # time at next scr refresh
            slashstart.setAutoDraw(True)
        
        # *totalstart* updates
        if totalstart.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            totalstart.frameNStart = frameN  # exact frame index
            totalstart.tStart = t  # local t and not account for scr refresh
            totalstart.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(totalstart, 'tStartRefresh')  # time at next scr refresh
            totalstart.setAutoDraw(True)
        
        # check for quit (typically the Esc key)
        if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
            core.quit()
        
        # check if all components have finished
        if not continueRoutine:  # a component has requested a forced-end of Routine
            break
        continueRoutine = False  # will revert to True if at least one component still running
        for thisComponent in StartTrialComponents:
            if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
                continueRoutine = True
                break  # at least one component has not yet finished
        
        # refresh the screen
        if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
            win.flip()
    
    # -------Ending Routine "StartTrial"-------
    for thisComponent in StartTrialComponents:
        if hasattr(thisComponent, "setAutoDraw"):
            thisComponent.setAutoDraw(False)
    # store data for trials (TrialHandler)
    # the Routine "StartTrial" was not non-slip safe, so reset the non-slip timer
    routineTimer.reset()
    
    # ------Prepare to start Routine "trial"-------
    continueRoutine = True
    # update component parameters for each repeat
    # Pick Parameters
    sets=[[ -22,-2 ,7   , 13 ,   -11],[24 ,  -25  ,  -4 , 12  ,  6],[15 ,  -18 , 29 ,   3 ,  -30],[17  ,   0   , -22   , -10  ,  7],[0  ,   9 , -19 ,  -12  ,  28 ]];
    
    baseloc=999;
    pickset=999;
    baseloc=randint(0,360);
    pickset=randint(0,4)
    theset=[];
    theset=sets[pickset];
    
    document.body.style.cursor='none';
    
    
    #Set Visual features
    
    time2=0;
    time3=0;
    time4=0;
    time5=0;
    
    radius=.25;
    pos1x=0;
    pos1y=0;
    pos2x=0;
    pos2y=0;
    pos3x=0;
    pos3y=0;
    pos4x=0;
    pos4y=0;
    pos5x=0;
    pos5y=0;
    
    
    #Set the visibility of other points to 0 if not used
    
    
    theset[0]=theset[0]+baseloc;
    theset[1]=theset[1]+baseloc;
    theset[2]=theset[2]+baseloc;
    theset[3]=theset[3]+baseloc;
    theset[4]=theset[4]+baseloc;
    pi=3.14;
    
    #pull out the correct number of points and sort
    
    theset=theset[0:pts];
    
    sorted=[]
    looptimes=pts;
    storeset=[];
    storeset=theset;
    storesetStart=[];
    storesetEnd=[];
    smallest=0;
    smallind=0;
    while looptimes>0:
        smallest=storeset[0];
        smallind=0;
        for j in range(0,looptimes):
            if smallest>storeset[j]:
                smallind=j;
                smallest=storeset[j];
        sorted.push(smallest)
        if smallind==0:
            storeset=storeset[1:looptimes];
        elif smallind==looptimes:
            storeset=storeset[0:looptimes-1];
        else:
            storesetStart=storeset[0:smallind];
            storesetEnd=storeset[smallind+1:looptimes];
            storeset=[].concat(storesetStart,storesetEnd);
        looptimes=looptimes-1;
    theset=sorted;
    
    
    
    #Assign possition
    if pts==1:
        pos1x=radius*Math.cos(theset[0]*pi/180);
        pos1y=radius*Math.sin(theset[0]*pi/180);
        op2=0
        op3=0
        op4=0
        psychoJS.experiment.addData('Targ1',theset[0])
        psychoJS.experiment.addData('Targ2',999)
        psychoJS.experiment.addData('Targ3',999)
        psychoJS.experiment.addData('Targ4',999)
        psychoJS.experiment.addData('Targ5',999)
    elif pts==2:
        pos1x=radius*Math.cos(theset[0]*pi/180);
        pos1y=radius*Math.sin(theset[0]*pi/180);
        pos2x=radius*Math.cos(theset[1]*pi/180);
        pos2y=radius*Math.sin(theset[1]*pi/180);
        op2=1;
        op3=0;
        op4=0;
        time2=thedelay/2;
        psychoJS.experiment.addData('Targ1',theset[0])
        psychoJS.experiment.addData('Targ2',theset[1])
        psychoJS.experiment.addData('Targ3',999)
        psychoJS.experiment.addData('Targ4',999)
        psychoJS.experiment.addData('Targ5',999)
    elif pts==3:
        pos1x=radius*Math.cos(theset[0]*pi/180);
        pos1y=radius*Math.sin(theset[0]*pi/180);
        pos2x=radius*Math.cos(theset[1]*pi/180);
        pos2y=radius*Math.sin(theset[1]*pi/180);
        pos3x=radius*Math.cos(theset[2]*pi/180);
        pos3y=radius*Math.sin(theset[2]*pi/180);
        op2=1;
        op3=1;
        op4=0;
        time3=thedelay/2;
        time2=0;
        psychoJS.experiment.addData('Targ1',theset[0])
        psychoJS.experiment.addData('Targ2',theset[1])
        psychoJS.experiment.addData('Targ3',theset[2])
        psychoJS.experiment.addData('Targ4',999)
        psychoJS.experiment.addData('Targ5',999)
    else:
        pos1x=radius*Math.cos(theset[0]*pi/180);
        pos1y=radius*Math.sin(theset[0]*pi/180);
        pos2x=radius*Math.cos(theset[1]*pi/180);
        pos2y=radius*Math.sin(theset[1]*pi/180);
        pos3x=radius*Math.cos(theset[2]*pi/180);
        pos3y=radius*Math.sin(theset[2]*pi/180);
        pos4x=radius*Math.cos(theset[3]*pi/180);
        pos4y=radius*Math.sin(theset[3]*pi/180);
        pos5x=radius*Math.cos(theset[4]*pi/180);
        pos5y=radius*Math.sin(theset[4]*pi/180);
        psychoJS.experiment.addData('Targ1',theset[0])
        psychoJS.experiment.addData('Targ2',theset[1])
        psychoJS.experiment.addData('Targ3',theset[2])
        psychoJS.experiment.addData('Targ4',theset[3])
        psychoJS.experiment.addData('Targ5',theset[4])
        op2=1;
        op3=1;
        op4=1;
        time5=thedelay/2;
        time3=0;
        time4=0;
        time2=0;
    
    resppos= mouse.getPos()
    
    Targ1.setPos([pos1x,pos1y])
    Targ2.setOpacity(op2)
    Targ2.setPos([pos2x,pos2y])
    Targ3.setOpacity(op3)
    Targ3.setPos([pos3x,pos3y])
    Targ4.setOpacity(op4)
    Targ4.setPos([pos4x,pos4y])
    Targ5.setOpacity(op4)
    Targ5.setPos([pos5x,pos5y])
    counter.setText(totalTrials)
    total.setText(trials.nTotal)
    # keep track of which components have finished
    trialComponents = [Anulus, Fixation, Targ1, Targ2, Targ3, Targ4, Targ5, counter, total, slash]
    for thisComponent in trialComponents:
        thisComponent.tStart = None
        thisComponent.tStop = None
        thisComponent.tStartRefresh = None
        thisComponent.tStopRefresh = None
        if hasattr(thisComponent, 'status'):
            thisComponent.status = NOT_STARTED
    # reset timers
    t = 0
    _timeToFirstFrame = win.getFutureFlipTime(clock="now")
    trialClock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
    frameN = -1
    
    # -------Run Routine "trial"-------
    while continueRoutine:
        # get current time
        t = trialClock.getTime()
        tThisFlip = win.getFutureFlipTime(clock=trialClock)
        tThisFlipGlobal = win.getFutureFlipTime(clock=None)
        frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
        # update/draw components on each frame
        
        # *Anulus* updates
        if Anulus.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            Anulus.frameNStart = frameN  # exact frame index
            Anulus.tStart = t  # local t and not account for scr refresh
            Anulus.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Anulus, 'tStartRefresh')  # time at next scr refresh
            Anulus.setAutoDraw(True)
        if Anulus.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Anulus.tStartRefresh + thedelay+.8-frameTolerance:
                # keep track of stop time/frame for later
                Anulus.tStop = t  # not accounting for scr refresh
                Anulus.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Anulus, 'tStopRefresh')  # time at next scr refresh
                Anulus.setAutoDraw(False)
        
        # *Fixation* updates
        if Fixation.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            Fixation.frameNStart = frameN  # exact frame index
            Fixation.tStart = t  # local t and not account for scr refresh
            Fixation.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Fixation, 'tStartRefresh')  # time at next scr refresh
            Fixation.setAutoDraw(True)
        if Fixation.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Fixation.tStartRefresh + thedelay+.8-frameTolerance:
                # keep track of stop time/frame for later
                Fixation.tStop = t  # not accounting for scr refresh
                Fixation.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Fixation, 'tStopRefresh')  # time at next scr refresh
                Fixation.setAutoDraw(False)
        
        # *Targ1* updates
        if Targ1.status == NOT_STARTED and tThisFlip >= 0.25-frameTolerance:
            # keep track of start time/frame for later
            Targ1.frameNStart = frameN  # exact frame index
            Targ1.tStart = t  # local t and not account for scr refresh
            Targ1.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Targ1, 'tStartRefresh')  # time at next scr refresh
            Targ1.setAutoDraw(True)
        if Targ1.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Targ1.tStartRefresh + .5-frameTolerance:
                # keep track of stop time/frame for later
                Targ1.tStop = t  # not accounting for scr refresh
                Targ1.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Targ1, 'tStopRefresh')  # time at next scr refresh
                Targ1.setAutoDraw(False)
        
        # *Targ2* updates
        if Targ2.status == NOT_STARTED and tThisFlip >= time2+.25-frameTolerance:
            # keep track of start time/frame for later
            Targ2.frameNStart = frameN  # exact frame index
            Targ2.tStart = t  # local t and not account for scr refresh
            Targ2.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Targ2, 'tStartRefresh')  # time at next scr refresh
            Targ2.setAutoDraw(True)
        if Targ2.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Targ2.tStartRefresh + .5-frameTolerance:
                # keep track of stop time/frame for later
                Targ2.tStop = t  # not accounting for scr refresh
                Targ2.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Targ2, 'tStopRefresh')  # time at next scr refresh
                Targ2.setAutoDraw(False)
        
        # *Targ3* updates
        if Targ3.status == NOT_STARTED and tThisFlip >= time3+0.25-frameTolerance:
            # keep track of start time/frame for later
            Targ3.frameNStart = frameN  # exact frame index
            Targ3.tStart = t  # local t and not account for scr refresh
            Targ3.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Targ3, 'tStartRefresh')  # time at next scr refresh
            Targ3.setAutoDraw(True)
        if Targ3.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Targ3.tStartRefresh + .5-frameTolerance:
                # keep track of stop time/frame for later
                Targ3.tStop = t  # not accounting for scr refresh
                Targ3.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Targ3, 'tStopRefresh')  # time at next scr refresh
                Targ3.setAutoDraw(False)
        
        # *Targ4* updates
        if Targ4.status == NOT_STARTED and tThisFlip >= time4+.25-frameTolerance:
            # keep track of start time/frame for later
            Targ4.frameNStart = frameN  # exact frame index
            Targ4.tStart = t  # local t and not account for scr refresh
            Targ4.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Targ4, 'tStartRefresh')  # time at next scr refresh
            Targ4.setAutoDraw(True)
        if Targ4.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Targ4.tStartRefresh + .5-frameTolerance:
                # keep track of stop time/frame for later
                Targ4.tStop = t  # not accounting for scr refresh
                Targ4.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Targ4, 'tStopRefresh')  # time at next scr refresh
                Targ4.setAutoDraw(False)
        
        # *Targ5* updates
        if Targ5.status == NOT_STARTED and tThisFlip >= time5+.25-frameTolerance:
            # keep track of start time/frame for later
            Targ5.frameNStart = frameN  # exact frame index
            Targ5.tStart = t  # local t and not account for scr refresh
            Targ5.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(Targ5, 'tStartRefresh')  # time at next scr refresh
            Targ5.setAutoDraw(True)
        if Targ5.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > Targ5.tStartRefresh + .5-frameTolerance:
                # keep track of stop time/frame for later
                Targ5.tStop = t  # not accounting for scr refresh
                Targ5.frameNStop = frameN  # exact frame index
                win.timeOnFlip(Targ5, 'tStopRefresh')  # time at next scr refresh
                Targ5.setAutoDraw(False)
        
        # *counter* updates
        if counter.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            counter.frameNStart = frameN  # exact frame index
            counter.tStart = t  # local t and not account for scr refresh
            counter.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(counter, 'tStartRefresh')  # time at next scr refresh
            counter.setAutoDraw(True)
        if counter.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > counter.tStartRefresh + thedelay+.8-frameTolerance:
                # keep track of stop time/frame for later
                counter.tStop = t  # not accounting for scr refresh
                counter.frameNStop = frameN  # exact frame index
                win.timeOnFlip(counter, 'tStopRefresh')  # time at next scr refresh
                counter.setAutoDraw(False)
        
        # *total* updates
        if total.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            total.frameNStart = frameN  # exact frame index
            total.tStart = t  # local t and not account for scr refresh
            total.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(total, 'tStartRefresh')  # time at next scr refresh
            total.setAutoDraw(True)
        if total.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > total.tStartRefresh + thedelay+.8-frameTolerance:
                # keep track of stop time/frame for later
                total.tStop = t  # not accounting for scr refresh
                total.frameNStop = frameN  # exact frame index
                win.timeOnFlip(total, 'tStopRefresh')  # time at next scr refresh
                total.setAutoDraw(False)
        
        # *slash* updates
        if slash.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            slash.frameNStart = frameN  # exact frame index
            slash.tStart = t  # local t and not account for scr refresh
            slash.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(slash, 'tStartRefresh')  # time at next scr refresh
            slash.setAutoDraw(True)
        if slash.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > slash.tStartRefresh + thedelay+.8-frameTolerance:
                # keep track of stop time/frame for later
                slash.tStop = t  # not accounting for scr refresh
                slash.frameNStop = frameN  # exact frame index
                win.timeOnFlip(slash, 'tStopRefresh')  # time at next scr refresh
                slash.setAutoDraw(False)
        
        # check for quit (typically the Esc key)
        if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
            core.quit()
        
        # check if all components have finished
        if not continueRoutine:  # a component has requested a forced-end of Routine
            break
        continueRoutine = False  # will revert to True if at least one component still running
        for thisComponent in trialComponents:
            if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
                continueRoutine = True
                break  # at least one component has not yet finished
        
        # refresh the screen
        if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
            win.flip()
    
    # -------Ending Routine "trial"-------
    for thisComponent in trialComponents:
        if hasattr(thisComponent, "setAutoDraw"):
            thisComponent.setAutoDraw(False)
    corr=999;
    posCorrx=0;
    posCorry=0;
    totalmean=0;
    corrLineCol=0;
    ubercorr=0;
    RespType=randint(0,1);
    RespType=2;
    
    
    if RespType==2:
        corrCol=[1,1,1];
        corr=6;
        #Find the mean;
        for j in range(0,pts):
            totalmean=totalmean+theset[j]
        totalmean=totalmean/pts;
        corrLineCol=[1,1,1];
        ubercorr=totalmean;
    else:
        corr=randint(0,pts-1);
        corrCol=colors[corr];
        corrLineCol=[-1,-1,-1];
        ubercorr=theset[corr];
    
    psychoJS.experiment.addData('base',baseloc)
    psychoJS.experiment.addData('whichset',pickset)
    psychoJS.experiment.addData('Corr',corr)
    
    posCorrx=radius*Math.cos(ubercorr*pi/180);
    posCorry=radius*Math.sin(ubercorr*pi/180);
    psychoJS.experiment.addData('CorrTarg',ubercorr)
    psychoJS.experiment.addData('exptType',2)
    psychoJS.experiment.addData('tempDelay',1)
    # the Routine "trial" was not non-slip safe, so reset the non-slip timer
    routineTimer.reset()
    
    # ------Prepare to start Routine "Respond"-------
    continueRoutine = True
    # update component parameters for each repeat
    # setup some python lists for storing info about the mouse
    mouse.x = []
    mouse.y = []
    mouse.leftButton = []
    mouse.midButton = []
    mouse.rightButton = []
    mouse.time = []
    gotValidClick = False  # until a click is received
    mouse.mouseClock.reset()
    respPosx=0;
    respPosy=0;
    response.setPos([respPosx,respPosy]);
    
    response.setFillColor(corrCol)
    response.setLineColor(corrLineCol)
    counter2.setText(totalTrials)
    total2.setText(trials.nTotal)
    # keep track of which components have finished
    RespondComponents = [anulus, fixation, InnerRing, OuterRing, mouse, response, counter2, total2, text_2]
    for thisComponent in RespondComponents:
        thisComponent.tStart = None
        thisComponent.tStop = None
        thisComponent.tStartRefresh = None
        thisComponent.tStopRefresh = None
        if hasattr(thisComponent, 'status'):
            thisComponent.status = NOT_STARTED
    # reset timers
    t = 0
    _timeToFirstFrame = win.getFutureFlipTime(clock="now")
    RespondClock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
    frameN = -1
    
    # -------Run Routine "Respond"-------
    while continueRoutine:
        # get current time
        t = RespondClock.getTime()
        tThisFlip = win.getFutureFlipTime(clock=RespondClock)
        tThisFlipGlobal = win.getFutureFlipTime(clock=None)
        frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
        # update/draw components on each frame
        
        # *anulus* updates
        if anulus.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            anulus.frameNStart = frameN  # exact frame index
            anulus.tStart = t  # local t and not account for scr refresh
            anulus.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(anulus, 'tStartRefresh')  # time at next scr refresh
            anulus.setAutoDraw(True)
        
        # *fixation* updates
        if fixation.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            fixation.frameNStart = frameN  # exact frame index
            fixation.tStart = t  # local t and not account for scr refresh
            fixation.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(fixation, 'tStartRefresh')  # time at next scr refresh
            fixation.setAutoDraw(True)
        
        # *InnerRing* updates
        if InnerRing.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            InnerRing.frameNStart = frameN  # exact frame index
            InnerRing.tStart = t  # local t and not account for scr refresh
            InnerRing.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(InnerRing, 'tStartRefresh')  # time at next scr refresh
            InnerRing.setAutoDraw(True)
        
        # *OuterRing* updates
        if OuterRing.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            OuterRing.frameNStart = frameN  # exact frame index
            OuterRing.tStart = t  # local t and not account for scr refresh
            OuterRing.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(OuterRing, 'tStartRefresh')  # time at next scr refresh
            OuterRing.setAutoDraw(True)
        # *mouse* updates
        if mouse.status == NOT_STARTED and t >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            mouse.frameNStart = frameN  # exact frame index
            mouse.tStart = t  # local t and not account for scr refresh
            mouse.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(mouse, 'tStartRefresh')  # time at next scr refresh
            mouse.status = STARTED
            prevButtonState = mouse.getPressed()  # if button is down already this ISN'T a new click
        if mouse.status == STARTED:  # only update if started and not finished!
            buttons = mouse.getPressed()
            if buttons != prevButtonState:  # button state changed?
                prevButtonState = buttons
                if sum(buttons) > 0:  # state changed to a new click
                    x, y = mouse.getPos()
                    mouse.x.append(x)
                    mouse.y.append(y)
                    buttons = mouse.getPressed()
                    mouse.leftButton.append(buttons[0])
                    mouse.midButton.append(buttons[1])
                    mouse.rightButton.append(buttons[2])
                    mouse.time.append(mouse.mouseClock.getTime())
        respPosx=mouse.getPos()[0];
        respPosy=mouse.getPos()[1];
        
        if OuterRing.contains(mouse) & (~InnerRing.contains(mouse)):
            if mouse.getPressed()[0]==1:
               respPosx=mouse.getPos()[0];
               respPosy=mouse.getPos()[1];
               guess=Math.atan2(respPosy,respPosx)*180/3.14;
               continueRoutine = False;
        
        
        # *response* updates
        if response.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            response.frameNStart = frameN  # exact frame index
            response.tStart = t  # local t and not account for scr refresh
            response.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(response, 'tStartRefresh')  # time at next scr refresh
            response.setAutoDraw(True)
        if response.status == STARTED:  # only update if drawing
            response.setPos([respPosx,respPosy], log=False)
        
        # *counter2* updates
        if counter2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            counter2.frameNStart = frameN  # exact frame index
            counter2.tStart = t  # local t and not account for scr refresh
            counter2.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(counter2, 'tStartRefresh')  # time at next scr refresh
            counter2.setAutoDraw(True)
        
        # *total2* updates
        if total2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            total2.frameNStart = frameN  # exact frame index
            total2.tStart = t  # local t and not account for scr refresh
            total2.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(total2, 'tStartRefresh')  # time at next scr refresh
            total2.setAutoDraw(True)
        
        # *text_2* updates
        if text_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            text_2.frameNStart = frameN  # exact frame index
            text_2.tStart = t  # local t and not account for scr refresh
            text_2.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(text_2, 'tStartRefresh')  # time at next scr refresh
            text_2.setAutoDraw(True)
        
        # check for quit (typically the Esc key)
        if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
            core.quit()
        
        # check if all components have finished
        if not continueRoutine:  # a component has requested a forced-end of Routine
            break
        continueRoutine = False  # will revert to True if at least one component still running
        for thisComponent in RespondComponents:
            if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
                continueRoutine = True
                break  # at least one component has not yet finished
        
        # refresh the screen
        if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
            win.flip()
    
    # -------Ending Routine "Respond"-------
    for thisComponent in RespondComponents:
        if hasattr(thisComponent, "setAutoDraw"):
            thisComponent.setAutoDraw(False)
    # store data for trials (TrialHandler)
    if len(mouse.x): trials.addData('mouse.x', mouse.x[0])
    if len(mouse.y): trials.addData('mouse.y', mouse.y[0])
    if len(mouse.leftButton): trials.addData('mouse.leftButton', mouse.leftButton[0])
    if len(mouse.midButton): trials.addData('mouse.midButton', mouse.midButton[0])
    if len(mouse.rightButton): trials.addData('mouse.rightButton', mouse.rightButton[0])
    if len(mouse.time): trials.addData('mouse.time', mouse.time[0])
    if guess<0:
        guess=guess+360;
    elif guess>360:
        guess=guess-360;
    psychoJS.experiment.addData('guess', guess);
    corrCol=corrCol;
    
    # the Routine "Respond" was not non-slip safe, so reset the non-slip timer
    routineTimer.reset()
    
    # ------Prepare to start Routine "Feedback"-------
    continueRoutine = True
    routineTimer.add(0.750000)
    # update component parameters for each repeat
    corrCol=corrCol;
    
    document.body.style.cursor='none';
    howgood=[0,0,0];
    err=Math.min(Math.abs(guess-ubercorr),Math.abs(guess-ubercorr-360));
    err=Math.min(err,Math.abs(guess-ubercorr+360));
    psychoJS.experiment.addData('err', err);
    
    if err<7.5:
        howgood=[-1,1,-1];
    elif err<15:
        howgood=[1,1,-1];
    else:
        howgood=[1,-1,-1];
    
    
    smallest=Math.min(guess,ubercorr);
    largest=Math.max(guess,ubercorr);
    if (largest-smallest)>180:
       startang=largest-360;
       endang=smallest;
    else:
        startang=smallest;
        endang=largest;
    
    
    
    verts=[];
    newvert=0;
    radius2=radius+.07
    for i in range(startang,endang,.2):
        newvert=[radius2*Math.cos(i*3.14/180), radius2*Math.sin(i*3.14/180)];
        verts.push(newvert);
    
    
    grey= util.Color([0, 0, 0]);
    a=1; #you can use a var in the util.color to change it!
    Test1.setFillColor(util.Color([0, 0, 0]));
    Test1.setLineColor(util.Color(howgood));
    Test1.setVertices(verts);
    Test1.setAutoDraw(True) 
    
    trueans.setPos([posCorrx,posCorry])
    trueans.setOri(ubercorr)
    trueans.setFillColor(howgood)
    trueans.setLineColor(howgood)
    yourans.setPos((respPosx, respPosy))
    yourans.setFillColor(corrCol)
    yourans.setLineColor(corrLineCol)
    counter3.setText(totalTrials)
    tots3.setText(trials.nTotal)
    # keep track of which components have finished
    FeedbackComponents = [fixy, anul, trueans, yourans, counter3, slash3, tots3]
    for thisComponent in FeedbackComponents:
        thisComponent.tStart = None
        thisComponent.tStop = None
        thisComponent.tStartRefresh = None
        thisComponent.tStopRefresh = None
        if hasattr(thisComponent, 'status'):
            thisComponent.status = NOT_STARTED
    # reset timers
    t = 0
    _timeToFirstFrame = win.getFutureFlipTime(clock="now")
    FeedbackClock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
    frameN = -1
    
    # -------Run Routine "Feedback"-------
    while continueRoutine and routineTimer.getTime() > 0:
        # get current time
        t = FeedbackClock.getTime()
        tThisFlip = win.getFutureFlipTime(clock=FeedbackClock)
        tThisFlipGlobal = win.getFutureFlipTime(clock=None)
        frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
        # update/draw components on each frame
        
        # *fixy* updates
        if fixy.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            fixy.frameNStart = frameN  # exact frame index
            fixy.tStart = t  # local t and not account for scr refresh
            fixy.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(fixy, 'tStartRefresh')  # time at next scr refresh
            fixy.setAutoDraw(True)
        if fixy.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > fixy.tStartRefresh + .75-frameTolerance:
                # keep track of stop time/frame for later
                fixy.tStop = t  # not accounting for scr refresh
                fixy.frameNStop = frameN  # exact frame index
                win.timeOnFlip(fixy, 'tStopRefresh')  # time at next scr refresh
                fixy.setAutoDraw(False)
        
        # *anul* updates
        if anul.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            anul.frameNStart = frameN  # exact frame index
            anul.tStart = t  # local t and not account for scr refresh
            anul.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(anul, 'tStartRefresh')  # time at next scr refresh
            anul.setAutoDraw(True)
        if anul.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > anul.tStartRefresh + .75-frameTolerance:
                # keep track of stop time/frame for later
                anul.tStop = t  # not accounting for scr refresh
                anul.frameNStop = frameN  # exact frame index
                win.timeOnFlip(anul, 'tStopRefresh')  # time at next scr refresh
                anul.setAutoDraw(False)
        
        # *trueans* updates
        if trueans.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            trueans.frameNStart = frameN  # exact frame index
            trueans.tStart = t  # local t and not account for scr refresh
            trueans.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(trueans, 'tStartRefresh')  # time at next scr refresh
            trueans.setAutoDraw(True)
        if trueans.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > trueans.tStartRefresh + .75-frameTolerance:
                # keep track of stop time/frame for later
                trueans.tStop = t  # not accounting for scr refresh
                trueans.frameNStop = frameN  # exact frame index
                win.timeOnFlip(trueans, 'tStopRefresh')  # time at next scr refresh
                trueans.setAutoDraw(False)
        
        # *yourans* updates
        if yourans.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            yourans.frameNStart = frameN  # exact frame index
            yourans.tStart = t  # local t and not account for scr refresh
            yourans.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(yourans, 'tStartRefresh')  # time at next scr refresh
            yourans.setAutoDraw(True)
        if yourans.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > yourans.tStartRefresh + .75-frameTolerance:
                # keep track of stop time/frame for later
                yourans.tStop = t  # not accounting for scr refresh
                yourans.frameNStop = frameN  # exact frame index
                win.timeOnFlip(yourans, 'tStopRefresh')  # time at next scr refresh
                yourans.setAutoDraw(False)
        
        # *counter3* updates
        if counter3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            counter3.frameNStart = frameN  # exact frame index
            counter3.tStart = t  # local t and not account for scr refresh
            counter3.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(counter3, 'tStartRefresh')  # time at next scr refresh
            counter3.setAutoDraw(True)
        if counter3.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > counter3.tStartRefresh + .75-frameTolerance:
                # keep track of stop time/frame for later
                counter3.tStop = t  # not accounting for scr refresh
                counter3.frameNStop = frameN  # exact frame index
                win.timeOnFlip(counter3, 'tStopRefresh')  # time at next scr refresh
                counter3.setAutoDraw(False)
        
        # *slash3* updates
        if slash3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            slash3.frameNStart = frameN  # exact frame index
            slash3.tStart = t  # local t and not account for scr refresh
            slash3.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(slash3, 'tStartRefresh')  # time at next scr refresh
            slash3.setAutoDraw(True)
        if slash3.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > slash3.tStartRefresh + .75-frameTolerance:
                # keep track of stop time/frame for later
                slash3.tStop = t  # not accounting for scr refresh
                slash3.frameNStop = frameN  # exact frame index
                win.timeOnFlip(slash3, 'tStopRefresh')  # time at next scr refresh
                slash3.setAutoDraw(False)
        
        # *tots3* updates
        if tots3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            tots3.frameNStart = frameN  # exact frame index
            tots3.tStart = t  # local t and not account for scr refresh
            tots3.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(tots3, 'tStartRefresh')  # time at next scr refresh
            tots3.setAutoDraw(True)
        if tots3.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > tots3.tStartRefresh + .75-frameTolerance:
                # keep track of stop time/frame for later
                tots3.tStop = t  # not accounting for scr refresh
                tots3.frameNStop = frameN  # exact frame index
                win.timeOnFlip(tots3, 'tStopRefresh')  # time at next scr refresh
                tots3.setAutoDraw(False)
        
        # check for quit (typically the Esc key)
        if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
            core.quit()
        
        # check if all components have finished
        if not continueRoutine:  # a component has requested a forced-end of Routine
            break
        continueRoutine = False  # will revert to True if at least one component still running
        for thisComponent in FeedbackComponents:
            if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
                continueRoutine = True
                break  # at least one component has not yet finished
        
        # refresh the screen
        if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
            win.flip()
    
    # -------Ending Routine "Feedback"-------
    for thisComponent in FeedbackComponents:
        if hasattr(thisComponent, "setAutoDraw"):
            thisComponent.setAutoDraw(False)
    respPosx=0;
    respPosy=0;
    totalTrials=totalTrials+1;
    Test1.setAutoDraw(False) 
    
    trials.addData('trueans.started', trueans.tStartRefresh)
    trials.addData('trueans.stopped', trueans.tStopRefresh)
    thisExp.nextEntry()
    
# completed 70 repeats of 'trials'

# get names of stimulus parameters
if trials.trialList in ([], [None], None):
    params = []
else:
    params = trials.trialList[0].keys()
# save data for this loop
trials.saveAsExcel(filename + '.xlsx', sheetName='trials',
    stimOut=params,
    dataOut=['n','all_mean','all_std', 'all_raw'])

# ------Prepare to start Routine "buffer"-------
continueRoutine = True
routineTimer.add(1.000000)
# update component parameters for each repeat
# keep track of which components have finished
bufferComponents = [text_4]
for thisComponent in bufferComponents:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
bufferClock.reset(-_timeToFirstFrame)  # t0 is time of first possible flip
frameN = -1

# -------Run Routine "buffer"-------
while continueRoutine and routineTimer.getTime() > 0:
    # get current time
    t = bufferClock.getTime()
    tThisFlip = win.getFutureFlipTime(clock=bufferClock)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *text_4* updates
    if text_4.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        text_4.frameNStart = frameN  # exact frame index
        text_4.tStart = t  # local t and not account for scr refresh
        text_4.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(text_4, 'tStartRefresh')  # time at next scr refresh
        text_4.setAutoDraw(True)
    if text_4.status == STARTED:
        # is it time to stop? (based on global clock, using actual start)
        if tThisFlipGlobal > text_4.tStartRefresh + 1.0-frameTolerance:
            # keep track of stop time/frame for later
            text_4.tStop = t  # not accounting for scr refresh
            text_4.frameNStop = frameN  # exact frame index
            win.timeOnFlip(text_4, 'tStopRefresh')  # time at next scr refresh
            text_4.setAutoDraw(False)
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in bufferComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# -------Ending Routine "buffer"-------
for thisComponent in bufferComponents:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
thisExp.addData('text_4.started', text_4.tStartRefresh)
thisExp.addData('text_4.stopped', text_4.tStopRefresh)

# Flip one final time so any remaining win.callOnFlip() 
# and win.timeOnFlip() tasks get executed before quitting
win.flip()

# these shouldn't be strictly necessary (should auto-save)
thisExp.saveAsPickle(filename)
# make sure everything is closed down
thisExp.abort()  # or data files will save again on exit
win.close()
core.quit()
