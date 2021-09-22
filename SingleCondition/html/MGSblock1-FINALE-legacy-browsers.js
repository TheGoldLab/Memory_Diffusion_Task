/************************* 
 * Mgsblock1-Finale Test *
 *************************/

// init psychoJS:
const psychoJS = new PsychoJS({
  debug: true
});

// open window:
psychoJS.openWindow({
  fullscr: true,
  color: new util.Color([0, 0, 0]),
  units: 'height',
  waitBlanking: true
});

// store info about the experiment session:
let expName = 'MGSblock1-FINALE';  // from the Builder filename that created this script
let expInfo = {'participant': '', 'session': '001'};

// schedule the experiment:
psychoJS.schedule(psychoJS.gui.DlgFromDict({
  dictionary: expInfo,
  title: expName
}));

const flowScheduler = new Scheduler(psychoJS);
const dialogCancelScheduler = new Scheduler(psychoJS);
psychoJS.scheduleCondition(function() { return (psychoJS.gui.dialogComponent.button === 'OK'); }, flowScheduler, dialogCancelScheduler);

// flowScheduler gets run if the participants presses OK
flowScheduler.add(updateInfo); // add timeStamp
flowScheduler.add(experimentInit);
flowScheduler.add(InstRoutineBegin());
flowScheduler.add(InstRoutineEachFrame());
flowScheduler.add(InstRoutineEnd());
flowScheduler.add(InstCloseRoutineBegin());
flowScheduler.add(InstCloseRoutineEachFrame());
flowScheduler.add(InstCloseRoutineEnd());
flowScheduler.add(Inst1RoutineBegin());
flowScheduler.add(Inst1RoutineEachFrame());
flowScheduler.add(Inst1RoutineEnd());
flowScheduler.add(Inst2RoutineBegin());
flowScheduler.add(Inst2RoutineEachFrame());
flowScheduler.add(Inst2RoutineEnd());
flowScheduler.add(Inst3RoutineBegin());
flowScheduler.add(Inst3RoutineEachFrame());
flowScheduler.add(Inst3RoutineEnd());
flowScheduler.add(Inst4RoutineBegin());
flowScheduler.add(Inst4RoutineEachFrame());
flowScheduler.add(Inst4RoutineEnd());
flowScheduler.add(Inst5RoutineBegin());
flowScheduler.add(Inst5RoutineEachFrame());
flowScheduler.add(Inst5RoutineEnd());
flowScheduler.add(Inst6RoutineBegin());
flowScheduler.add(Inst6RoutineEachFrame());
flowScheduler.add(Inst6RoutineEnd());
flowScheduler.add(Inst7RoutineBegin());
flowScheduler.add(Inst7RoutineEachFrame());
flowScheduler.add(Inst7RoutineEnd());
const trialsLoopScheduler = new Scheduler(psychoJS);
flowScheduler.add(trialsLoopBegin, trialsLoopScheduler);
flowScheduler.add(trialsLoopScheduler);
flowScheduler.add(trialsLoopEnd);
flowScheduler.add(bufferRoutineBegin());
flowScheduler.add(bufferRoutineEachFrame());
flowScheduler.add(bufferRoutineEnd());
flowScheduler.add(quitPsychoJS, '', true);

// quit if user presses Cancel in dialog box:
dialogCancelScheduler.add(quitPsychoJS, '', false);

psychoJS.start({
  expName: expName,
  expInfo: expInfo,
  });


var frameDur;
function updateInfo() {
  expInfo['date'] = util.MonotonicClock.getDateStr();  // add a simple timestamp
  expInfo['expName'] = expName;
  expInfo['psychopyVersion'] = '2020.1.2';
  expInfo['OS'] = window.navigator.platform;

  // store frame rate of monitor if we can measure it successfully
  expInfo['frameRate'] = psychoJS.window.getActualFrameRate();
  if (typeof expInfo['frameRate'] !== 'undefined')
    frameDur = 1.0 / Math.round(expInfo['frameRate']);
  else
    frameDur = 1.0 / 60.0; // couldn't get a reliable measure so guess

  // add info from the URL:
  util.addInfoFromUrl(expInfo);
  
  return Scheduler.Event.NEXT;
}


var InstClock;
var key_resp_3;
var RespType;
var totalTrials;
var radius;
var democols;
var demoset;
var sorted;
var looptimes;
var storeset;
var storesetStart;
var storesetEnd;
var smallest;
var smallind;
var pi;
var instructions;
var spaceinst;
var InstCloseClock;
var text_5;
var key_resp;
var Inst1Clock;
var key_resp_2;
var demoring1;
var demofix1;
var demoWhatLike;
var Inst2Clock;
var annul2;
var fix2;
var key_resp_4;
var demoOrdering;
var fake1s;
var Inst3Clock;
var key_resp_5;
var annul3;
var fix3;
var demodelay;
var Inst4Clock;
var key_resp_6;
var demoStartResp;
var Inst5Clock;
var key_resp_7;
var demohowmove;
var Inst6Clock;
var key_resp_8;
var demoFB;
var Inst7Clock;
var key_resp_9;
var text_3;
var StartTrialClock;
var fixstart;
var fixstart1;
var mouse_2;
var counterstart;
var slashstart;
var totalstart;
var trialClock;
var sets;
var colors;
var op2;
var op3;
var op4;
var theset;
var Anulus;
var Fixation;
var Targ1;
var Targ2;
var Targ3;
var Targ4;
var Targ5;
var counter;
var total;
var slash;
var RespondClock;
var anulus;
var fixation;
var InnerRing;
var OuterRing;
var mouse;
var respPosx;
var respPosy;
var response;
var counter2;
var total2;
var text_2;
var FeedbackClock;
var win;
var green;
var ProgVertices;
var Test1;
var fixy;
var anul;
var trueans;
var yourans;
var counter3;
var slash3;
var tots3;
var bufferClock;
var text_4;
var globalClock;
var routineTimer;
function experimentInit() {
  // Initialize components for Routine "Inst"
  InstClock = new util.Clock();
  key_resp_3 = new core.Keyboard({psychoJS: psychoJS, clock: new util.Clock(), waitForStart: true});
  
  RespType = 0;
  totalTrials = 1;
  document.body.style.cursor = "none";
  radius = 0.25;
  democols = [];
  demoset = [(- 22), (- 2), 7, 13, (- 11)];
  democols = [[(- 1), 1, (- 1)], [1, (- 1), (- 1)], [(- 1), (- 1), 1], [1, (- 1), 1], [1, 1, (- 1)]];
  sorted = [];
  looptimes = 5;
  storeset = [];
  storeset = demoset;
  storesetStart = [];
  storesetEnd = [];
  smallest = 0;
  smallind = 0;
  while ((looptimes > 0)) {
      smallest = storeset[0];
      smallind = 0;
      for (var j = 0, _pj_a = looptimes; (j < _pj_a); j += 1) {
          if ((smallest > storeset[j])) {
              smallind = j;
              smallest = storeset[j];
          }
      }
      sorted.push(smallest);
      if ((smallind === 0)) {
          storeset = storeset.slice(1, looptimes);
      } else {
          if ((smallind === looptimes)) {
              storeset = storeset.slice(0, (looptimes - 1));
          } else {
              storesetStart = storeset.slice(0, smallind);
              storesetEnd = storeset.slice((smallind + 1), looptimes);
              storeset = storesetStart;
              storeset.push(storesetEnd);
          }
      }
      looptimes = (looptimes - 1);
  }
  pi = 3.14;
  demoset = sorted;
  
  instructions = new visual.TextStim({
    win: psychoJS.window,
    name: 'instructions',
    text: 'Instructions:\n\n',
    font: 'Arial',
    units: undefined, 
    pos: [0, 0], height: 0.1,  wrapWidth: undefined, ori: 0,
    color: new util.Color('white'),  opacity: 1,
    depth: -2.0 
  });
  
  spaceinst = new visual.TextStim({
    win: psychoJS.window,
    name: 'spaceinst',
    text: 'Please press SPACE\nto advance through Instructions\n(2 second minimum wait)',
    font: 'Arial',
    units: undefined, 
    pos: [0, 0.35], height: 0.03,  wrapWidth: undefined, ori: 0,
    color: new util.Color('white'),  opacity: 1,
    depth: -3.0 
  });
  
  // Initialize components for Routine "InstClose"
  InstCloseClock = new util.Clock();
  text_5 = new visual.TextStim({
    win: psychoJS.window,
    name: 'text_5',
    text: 'Before you begin, please close down\nother tabs/memory heavy apps\n\nIf you need to do so, please press ESC\nonce, close this tab, close the offending\nprocesses, and reopen the experiment\n\nThis ensures that the experiment will\nrun properly and your data will be valid',
    font: 'Arial',
    units: undefined, 
    pos: [0, 0], height: 0.03,  wrapWidth: undefined, ori: 0,
    color: new util.Color('white'),  opacity: 1,
    depth: 0.0 
  });
  
  key_resp = new core.Keyboard({psychoJS: psychoJS, clock: new util.Clock(), waitForStart: true});
  
  // Initialize components for Routine "Inst1"
  Inst1Clock = new util.Clock();
  key_resp_2 = new core.Keyboard({psychoJS: psychoJS, clock: new util.Clock(), waitForStart: true});
  
  demoring1 = new visual.Polygon ({
    win: psychoJS.window, name: 'demoring1', 
    edges: 100, size:[0.5, 0.5],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color([1, 1, 1]),
    fillColor: new util.Color([0, 0, 0]),
    opacity: 1, depth: -1, interpolate: true,
  });
  
  demofix1 = new visual.ShapeStim ({
    win: psychoJS.window, name: 'demofix1', 
    vertices: 'cross', size:[0.01, 0.01],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color([1, 1, 1]),
    fillColor: new util.Color([1, 1, 1]),
    opacity: 1, depth: -2, interpolate: true,
  });
  
  demoWhatLike = new visual.TextStim({
    win: psychoJS.window,
    name: 'demoWhatLike',
    text: 'Each trial will begin looking\nlike this:\n Please maintain fixation\non the cross when not responding\n(or reading instructions)',
    font: 'Arial',
    units: undefined, 
    pos: [0, 0.35], height: 0.03,  wrapWidth: undefined, ori: 0,
    color: new util.Color('white'),  opacity: 1,
    depth: -3.0 
  });
  
  // Initialize components for Routine "Inst2"
  Inst2Clock = new util.Clock();
  annul2 = new visual.Polygon ({
    win: psychoJS.window, name: 'annul2', 
    edges: 100, size:[0.5, 0.5],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color([1, 1, 1]),
    fillColor: new util.Color([0, 0, 0]),
    opacity: 1, depth: 0, interpolate: true,
  });
  
  fix2 = new visual.ShapeStim ({
    win: psychoJS.window, name: 'fix2', 
    vertices: 'cross', size:[0.01, 0.01],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color([1, 1, 1]),
    fillColor: new util.Color([1, 1, 1]),
    opacity: 1, depth: -1, interpolate: true,
  });
  
  key_resp_4 = new core.Keyboard({psychoJS: psychoJS, clock: new util.Clock(), waitForStart: true});
  
  demoOrdering = new visual.TextStim({
    win: psychoJS.window,
    name: 'demoOrdering',
    text: 'For this block, the only target\nwill be a green circle, which \nwill apear somewhere on the ring',
    font: 'Arial',
    units: undefined, 
    pos: [0, 0.35], height: 0.03,  wrapWidth: undefined, ori: 0,
    color: new util.Color('white'),  opacity: 1,
    depth: -3.0 
  });
  
  fake1s = new visual.Polygon ({
    win: psychoJS.window, name: 'fake1s', 
    edges: 100, size:[0.015, 0.015],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color(1.0),
    fillColor: new util.Color(1.0),
    opacity: 1, depth: -4, interpolate: true,
  });
  
  // Initialize components for Routine "Inst3"
  Inst3Clock = new util.Clock();
  key_resp_5 = new core.Keyboard({psychoJS: psychoJS, clock: new util.Clock(), waitForStart: true});
  
  annul3 = new visual.Polygon ({
    win: psychoJS.window, name: 'annul3', 
    edges: 100, size:[0.5, 0.5],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color([1, 1, 1]),
    fillColor: new util.Color([0, 0, 0]),
    opacity: 1, depth: -1, interpolate: true,
  });
  
  fix3 = new visual.ShapeStim ({
    win: psychoJS.window, name: 'fix3', 
    vertices: 'cross', size:[0.01, 0.01],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color([1, 1, 1]),
    fillColor: new util.Color([1, 1, 1]),
    opacity: 1, depth: -2, interpolate: true,
  });
  
  demodelay = new visual.TextStim({
    win: psychoJS.window,
    name: 'demodelay',
    text: 'There will then be a\ndelay of 0,1,or 6 seconds',
    font: 'Arial',
    units: undefined, 
    pos: [0, 0.35], height: 0.03,  wrapWidth: undefined, ori: 0,
    color: new util.Color('white'),  opacity: 1,
    depth: -3.0 
  });
  
  // Initialize components for Routine "Inst4"
  Inst4Clock = new util.Clock();
  key_resp_6 = new core.Keyboard({psychoJS: psychoJS, clock: new util.Clock(), waitForStart: true});
  
  demoStartResp = new visual.TextStim({
    win: psychoJS.window,
    name: 'demoStartResp',
    text: 'At the end of the delay, a green\ncircle will apear over the fixation:\n',
    font: 'Arial',
    units: undefined, 
    pos: [0, 0], height: 0.03,  wrapWidth: undefined, ori: 0,
    color: new util.Color('white'),  opacity: 1,
    depth: -1.0 
  });
  
  // Initialize components for Routine "Inst5"
  Inst5Clock = new util.Clock();
  key_resp_7 = new core.Keyboard({psychoJS: psychoJS, clock: new util.Clock(), waitForStart: true});
  
  demohowmove = new visual.TextStim({
    win: psychoJS.window,
    name: 'demohowmove',
    text: 'Use the mouse to move the circle to\nthe location on the ring where you\nremember the matching color target',
    font: 'Arial',
    units: undefined, 
    pos: [0, 0], height: 0.03,  wrapWidth: undefined, ori: 0,
    color: new util.Color('white'),  opacity: 1,
    depth: -1.0 
  });
  
  // Initialize components for Routine "Inst6"
  Inst6Clock = new util.Clock();
  key_resp_8 = new core.Keyboard({psychoJS: psychoJS, clock: new util.Clock(), waitForStart: true});
  
  demoFB = new visual.TextStim({
    win: psychoJS.window,
    name: 'demoFB',
    text: 'To lock in your response\nsimply left click\n\nYou will then recive feedback\nshowing your answer and the\ntrue location:\nGreen=Good!, Yellow=Ok, Red=Try Harder\n\nTry to minimize the difference!',
    font: 'Arial',
    units: undefined, 
    pos: [0, 0], height: 0.03,  wrapWidth: undefined, ori: 0,
    color: new util.Color('white'),  opacity: 1,
    depth: -1.0 
  });
  
  // Initialize components for Routine "Inst7"
  Inst7Clock = new util.Clock();
  key_resp_9 = new core.Keyboard({psychoJS: psychoJS, clock: new util.Clock(), waitForStart: true});
  
  text_3 = new visual.TextStim({
    win: psychoJS.window,
    name: 'text_3',
    text: 'To start each trial\nclick the cross\n\nPlease DO NOT move the mouse\nuntil it is time to respond\n\nIf you must exit early\npress ESC twice\n\nYou may begin after pressing\nSPACE (waiting min 2 sec)',
    font: 'Arial',
    units: undefined, 
    pos: [0, 0], height: 0.03,  wrapWidth: undefined, ori: 0,
    color: new util.Color('white'),  opacity: 1,
    depth: -1.0 
  });
  
  // Initialize components for Routine "StartTrial"
  StartTrialClock = new util.Clock();
  fixstart = new visual.ShapeStim ({
    win: psychoJS.window, name: 'fixstart', 
    vertices: 'cross', size:[0.01, 0.01],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color([1, 1, 1]),
    fillColor: new util.Color([1, 1, 1]),
    opacity: 1, depth: -1, interpolate: true,
  });
  
  fixstart1 = new visual.Polygon ({
    win: psychoJS.window, name: 'fixstart1', 
    edges: 100, size:[0.02, 0.02],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color([1, 1, 1]),
    fillColor: new util.Color([1, 1, 1]),
    opacity: 0, depth: -2, interpolate: true,
  });
  
  mouse_2 = new core.Mouse({
    win: psychoJS.window,
  });
  mouse_2.mouseClock = new util.Clock();
  counterstart = new visual.TextStim({
    win: psychoJS.window,
    name: 'counterstart',
    text: 'default text',
    font: 'Arial',
    units: undefined, 
    pos: [0, (- 0.35)], height: 0.03,  wrapWidth: undefined, ori: 0,
    color: new util.Color('white'),  opacity: 1,
    depth: -4.0 
  });
  
  slashstart = new visual.TextStim({
    win: psychoJS.window,
    name: 'slashstart',
    text: '/',
    font: 'Arial',
    units: undefined, 
    pos: [0.03, (- 0.35)], height: 0.03,  wrapWidth: undefined, ori: 0,
    color: new util.Color('white'),  opacity: 1,
    depth: -5.0 
  });
  
  totalstart = new visual.TextStim({
    win: psychoJS.window,
    name: 'totalstart',
    text: 'default text',
    font: 'Arial',
    units: undefined, 
    pos: [0.06, (- 0.35)], height: 0.03,  wrapWidth: undefined, ori: 0,
    color: new util.Color('white'),  opacity: 1,
    depth: -6.0 
  });
  
  // Initialize components for Routine "trial"
  trialClock = new util.Clock();
  totalTrials = 0;
  sets = [[(- 22), (- 2), 7, 13, (- 11)], [24, (- 25), (- 4), 12, 6], [15, (- 18), 29, 3, (- 30)], [17, 0, (- 22), (- 10), 7], [0, 9, (- 19), (- 12), 28]];
  colors = [[(- 1), 1, (- 1)], [1, (- 1), (- 1)], [(- 1), (- 1), 1], [1, (- 1), 1], [1, 1, (- 1)]];
  op2 = 0;
  op3 = 0;
  op4 = 0;
  theset = [];
  
  Anulus = new visual.Polygon ({
    win: psychoJS.window, name: 'Anulus', 
    edges: 100, size:[0.5, 0.5],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color([1, 1, 1]),
    fillColor: new util.Color([0, 0, 0]),
    opacity: 1, depth: -1, interpolate: true,
  });
  
  Fixation = new visual.ShapeStim ({
    win: psychoJS.window, name: 'Fixation', 
    vertices: 'cross', size:[0.01, 0.01],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color([1, 1, 1]),
    fillColor: new util.Color([1, 1, 1]),
    opacity: 1, depth: -2, interpolate: true,
  });
  
  Targ1 = new visual.Polygon ({
    win: psychoJS.window, name: 'Targ1', 
    edges: 100, size:[0.015, 0.015],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color([(- 1), 1, (- 1)]),
    fillColor: new util.Color([(- 1), 1, (- 1)]),
    opacity: 1, depth: -3, interpolate: true,
  });
  
  Targ2 = new visual.Polygon ({
    win: psychoJS.window, name: 'Targ2', 
    edges: 100, size:[0.015, 0.015],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color([1, (- 1), (- 1)]),
    fillColor: new util.Color([1, (- 1), (- 1)]),
    opacity: 1.0, depth: -4, interpolate: true,
  });
  
  Targ3 = new visual.Polygon ({
    win: psychoJS.window, name: 'Targ3', 
    edges: 100, size:[0.015, 0.015],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color([(- 1), (- 1), 1]),
    fillColor: new util.Color([(- 1), (- 1), 1]),
    opacity: 1.0, depth: -5, interpolate: true,
  });
  
  Targ4 = new visual.Polygon ({
    win: psychoJS.window, name: 'Targ4', 
    edges: 100, size:[0.015, 0.015],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color([1, (- 1), 1]),
    fillColor: new util.Color([1, (- 1), 1]),
    opacity: 1.0, depth: -6, interpolate: true,
  });
  
  Targ5 = new visual.Polygon ({
    win: psychoJS.window, name: 'Targ5', 
    edges: 100, size:[0.015, 0.015],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color([1, 1, (- 1)]),
    fillColor: new util.Color([1, 1, (- 1)]),
    opacity: 1.0, depth: -7, interpolate: true,
  });
  
  counter = new visual.TextStim({
    win: psychoJS.window,
    name: 'counter',
    text: 'default text',
    font: 'Arial',
    units: undefined, 
    pos: [0, (- 0.35)], height: 0.03,  wrapWidth: undefined, ori: 0,
    color: new util.Color('white'),  opacity: 1,
    depth: -8.0 
  });
  
  total = new visual.TextStim({
    win: psychoJS.window,
    name: 'total',
    text: 'default text',
    font: 'Arial',
    units: undefined, 
    pos: [0.06, (- 0.35)], height: 0.03,  wrapWidth: undefined, ori: 0,
    color: new util.Color('white'),  opacity: 1,
    depth: -9.0 
  });
  
  slash = new visual.TextStim({
    win: psychoJS.window,
    name: 'slash',
    text: '/',
    font: 'Arial',
    units: undefined, 
    pos: [0.03, (- 0.35)], height: 0.03,  wrapWidth: undefined, ori: 0,
    color: new util.Color('white'),  opacity: 1,
    depth: -10.0 
  });
  
  // Initialize components for Routine "Respond"
  RespondClock = new util.Clock();
  anulus = new visual.Polygon ({
    win: psychoJS.window, name: 'anulus', 
    edges: 100, size:[0.5, 0.5],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color([1, 1, 1]),
    fillColor: new util.Color([0, 0, 0]),
    opacity: 1, depth: 0, interpolate: true,
  });
  
  fixation = new visual.ShapeStim ({
    win: psychoJS.window, name: 'fixation', 
    vertices: 'cross', size:[0.01, 0.01],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color([1, 1, 1]),
    fillColor: new util.Color([1, 1, 1]),
    opacity: 1, depth: -1, interpolate: true,
  });
  
  InnerRing = new visual.Polygon ({
    win: psychoJS.window, name: 'InnerRing', 
    edges: 100, size:[0.48, 0.48],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color([1, 1, 1]),
    fillColor: new util.Color([1, 1, 1]),
    opacity: 0, depth: -2, interpolate: true,
  });
  
  OuterRing = new visual.Polygon ({
    win: psychoJS.window, name: 'OuterRing', 
    edges: 100, size:[0.52, 0.52],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color([1, 1, 1]),
    fillColor: new util.Color([1, 1, 1]),
    opacity: 0, depth: -3, interpolate: true,
  });
  
  mouse = new core.Mouse({
    win: psychoJS.window,
  });
  mouse.mouseClock = new util.Clock();
  respPosx = 0;
  respPosy = 0;
  
  response = new visual.Polygon ({
    win: psychoJS.window, name: 'response', 
    edges: 100, size:[0.01, 0.01],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color(1.0),
    fillColor: new util.Color(1.0),
    opacity: 1, depth: -6, interpolate: true,
  });
  
  counter2 = new visual.TextStim({
    win: psychoJS.window,
    name: 'counter2',
    text: 'default text',
    font: 'Arial',
    units: undefined, 
    pos: [0, (- 0.35)], height: 0.03,  wrapWidth: undefined, ori: 0,
    color: new util.Color('white'),  opacity: 1,
    depth: -7.0 
  });
  
  total2 = new visual.TextStim({
    win: psychoJS.window,
    name: 'total2',
    text: 'default text',
    font: 'Arial',
    units: undefined, 
    pos: [0.06, (- 0.35)], height: 0.03,  wrapWidth: undefined, ori: 0,
    color: new util.Color('white'),  opacity: 1,
    depth: -8.0 
  });
  
  text_2 = new visual.TextStim({
    win: psychoJS.window,
    name: 'text_2',
    text: '/',
    font: 'Arial',
    units: undefined, 
    pos: [0.03, (- 0.35)], height: 0.03,  wrapWidth: undefined, ori: 0,
    color: new util.Color('white'),  opacity: 1,
    depth: -9.0 
  });
  
  // Initialize components for Routine "Feedback"
  FeedbackClock = new util.Clock();
  win = 0;
  win = psychoJS.window;
  green = new util.Color([(- 1), 1, (- 1)]);
  ProgVertices = [[0.25, 0], [0.2501, 0]];
  Test1 = new visual.ShapeStim({"win": win, "name": "Test1", "lineWidth": 20, "shapeFlineColor": green, "lineColorSpace": "rgb", "fillColor": green, "fillColorSpace": "rgb", "vertices": ProgVertices, "pos": [0, 0], "closeShape": false, "autoDraw": true});
  
  fixy = new visual.ShapeStim ({
    win: psychoJS.window, name: 'fixy', 
    vertices: 'cross', size:[0.01, 0.01],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color([1, 1, 1]),
    fillColor: new util.Color([1, 1, 1]),
    opacity: 1, depth: -2, interpolate: true,
  });
  
  anul = new visual.Polygon ({
    win: psychoJS.window, name: 'anul', 
    edges: 100, size:[0.5, 0.5],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color([1, 1, 1]),
    fillColor: new util.Color([0, 0, 0]),
    opacity: 1, depth: -3, interpolate: true,
  });
  
  trueans = new visual.ShapeStim ({
    win: psychoJS.window, name: 'trueans', 
    vertices: [[-[0.03, 0.03][0]/2.0, 0], [+[0.03, 0.03][0]/2.0, 0]],
    ori: 1.0, pos: [0, 0],
    lineWidth: 2, lineColor: new util.Color(1.0),
    fillColor: new util.Color(1.0),
    opacity: 1, depth: -4, interpolate: true,
  });
  
  yourans = new visual.Polygon ({
    win: psychoJS.window, name: 'yourans', 
    edges: 100, size:[0.01, 0.01],
    ori: 0, pos: [0, 0],
    lineWidth: 1, lineColor: new util.Color(1.0),
    fillColor: new util.Color(1.0),
    opacity: 1, depth: -5, interpolate: true,
  });
  
  counter3 = new visual.TextStim({
    win: psychoJS.window,
    name: 'counter3',
    text: 'default text',
    font: 'Arial',
    units: undefined, 
    pos: [0, (- 0.35)], height: 0.03,  wrapWidth: undefined, ori: 0,
    color: new util.Color('white'),  opacity: 1,
    depth: -6.0 
  });
  
  slash3 = new visual.TextStim({
    win: psychoJS.window,
    name: 'slash3',
    text: '/',
    font: 'Arial',
    units: undefined, 
    pos: [0.03, (- 0.35)], height: 0.03,  wrapWidth: undefined, ori: 0,
    color: new util.Color('white'),  opacity: 1,
    depth: -7.0 
  });
  
  tots3 = new visual.TextStim({
    win: psychoJS.window,
    name: 'tots3',
    text: 'default text',
    font: 'Arial',
    units: undefined, 
    pos: [0.06, (- 0.35)], height: 0.03,  wrapWidth: undefined, ori: 0,
    color: new util.Color('white'),  opacity: 1,
    depth: -8.0 
  });
  
  // Initialize components for Routine "buffer"
  bufferClock = new util.Clock();
  document.body.style.cursor = "auto";
  
  text_4 = new visual.TextStim({
    win: psychoJS.window,
    name: 'text_4',
    text: 'Thank you!',
    font: 'Arial',
    units: undefined, 
    pos: [0, 0], height: 0.1,  wrapWidth: undefined, ori: 0,
    color: new util.Color('white'),  opacity: 1,
    depth: -1.0 
  });
  
  // Create some handy timers
  globalClock = new util.Clock();  // to track the time since experiment started
  routineTimer = new util.CountdownTimer();  // to track time remaining of each (non-slip) routine
  
  return Scheduler.Event.NEXT;
}


var t;
var frameN;
var _key_resp_3_allKeys;
var pos1x;
var pos1y;
var pos2x;
var pos2y;
var pos3x;
var pos3y;
var pos4x;
var pos4y;
var pos5x;
var pos5y;
var InstComponents;
function InstRoutineBegin(trials) {
  return function () {
    //------Prepare to start Routine 'Inst'-------
    t = 0;
    InstClock.reset(); // clock
    frameN = -1;
    // update component parameters for each repeat
    key_resp_3.keys = undefined;
    key_resp_3.rt = undefined;
    _key_resp_3_allKeys = [];
    RespType = 0;
    totalTrials = 1;
    document.body.style.cursor = "none";
    pi = 3.14;
    pos1x = (radius * Math.cos(((demoset[0] * pi) / 180)));
    pos1y = (radius * Math.sin(((demoset[0] * pi) / 180)));
    pos2x = (radius * Math.cos(((demoset[1] * pi) / 180)));
    pos2y = (radius * Math.sin(((demoset[1] * pi) / 180)));
    pos3x = (radius * Math.cos(((demoset[2] * pi) / 180)));
    pos3y = (radius * Math.sin(((demoset[2] * pi) / 180)));
    pos4x = (radius * Math.cos(((demoset[3] * pi) / 180)));
    pos4y = (radius * Math.sin(((demoset[3] * pi) / 180)));
    pos5x = (radius * Math.cos(((demoset[4] * pi) / 180)));
    pos5y = (radius * Math.sin(((demoset[4] * pi) / 180)));
    
    // keep track of which components have finished
    InstComponents = [];
    InstComponents.push(key_resp_3);
    InstComponents.push(instructions);
    InstComponents.push(spaceinst);
    
    InstComponents.forEach( function(thisComponent) {
      if ('status' in thisComponent)
        thisComponent.status = PsychoJS.Status.NOT_STARTED;
       });
    
    return Scheduler.Event.NEXT;
  };
}


var continueRoutine;
var frameRemains;
function InstRoutineEachFrame(trials) {
  return function () {
    //------Loop for each frame of Routine 'Inst'-------
    let continueRoutine = true; // until we're told otherwise
    // get current time
    t = InstClock.getTime();
    frameN = frameN + 1;// number of completed frames (so 0 is the first frame)
    // update/draw components on each frame
    
    // *key_resp_3* updates
    if (t >= 4 && key_resp_3.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      key_resp_3.tStart = t;  // (not accounting for frame time here)
      key_resp_3.frameNStart = frameN;  // exact frame index
      
      // keyboard checking is just starting
      psychoJS.window.callOnFlip(function() { key_resp_3.clock.reset(); });  // t=0 on next screen flip
      psychoJS.window.callOnFlip(function() { key_resp_3.start(); }); // start on screen flip
      psychoJS.window.callOnFlip(function() { key_resp_3.clearEvents(); });
    }

    if (key_resp_3.status === PsychoJS.Status.STARTED) {
      let theseKeys = key_resp_3.getKeys({keyList: ['space'], waitRelease: false});
      _key_resp_3_allKeys = _key_resp_3_allKeys.concat(theseKeys);
      if (_key_resp_3_allKeys.length > 0) {
        key_resp_3.keys = _key_resp_3_allKeys[_key_resp_3_allKeys.length - 1].name;  // just the last key pressed
        key_resp_3.rt = _key_resp_3_allKeys[_key_resp_3_allKeys.length - 1].rt;
        // a response ends the routine
        continueRoutine = false;
      }
    }
    
    
    // *instructions* updates
    if (t >= 0.0 && instructions.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      instructions.tStart = t;  // (not accounting for frame time here)
      instructions.frameNStart = frameN;  // exact frame index
      
      instructions.setAutoDraw(true);
    }

    frameRemains = 0.0 + 1.5 - psychoJS.window.monitorFramePeriod * 0.75;  // most of one frame period left
    if (instructions.status === PsychoJS.Status.STARTED && t >= frameRemains) {
      instructions.setAutoDraw(false);
    }
    
    // *spaceinst* updates
    if (t >= 1.5 && spaceinst.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      spaceinst.tStart = t;  // (not accounting for frame time here)
      spaceinst.frameNStart = frameN;  // exact frame index
      
      spaceinst.setAutoDraw(true);
    }

    // check for quit (typically the Esc key)
    if (psychoJS.experiment.experimentEnded || psychoJS.eventManager.getKeys({keyList:['escape']}).length > 0) {
      return quitPsychoJS('The [Escape] key was pressed. Goodbye!', false);
    }
    
    // check if the Routine should terminate
    if (!continueRoutine) {  // a component has requested a forced-end of Routine
      return Scheduler.Event.NEXT;
    }
    
    continueRoutine = false;  // reverts to True if at least one component still running
    InstComponents.forEach( function(thisComponent) {
      if ('status' in thisComponent && thisComponent.status !== PsychoJS.Status.FINISHED) {
        continueRoutine = true;
      }
    });
    
    // refresh the screen if continuing
    if (continueRoutine) {
      return Scheduler.Event.FLIP_REPEAT;
    } else {
      return Scheduler.Event.NEXT;
    }
  };
}


function InstRoutineEnd(trials) {
  return function () {
    //------Ending Routine 'Inst'-------
    InstComponents.forEach( function(thisComponent) {
      if (typeof thisComponent.setAutoDraw === 'function') {
        thisComponent.setAutoDraw(false);
      }
    });
    // the Routine "Inst" was not non-slip safe, so reset the non-slip timer
    routineTimer.reset();
    
    return Scheduler.Event.NEXT;
  };
}


var _key_resp_allKeys;
var InstCloseComponents;
function InstCloseRoutineBegin(trials) {
  return function () {
    //------Prepare to start Routine 'InstClose'-------
    t = 0;
    InstCloseClock.reset(); // clock
    frameN = -1;
    // update component parameters for each repeat
    key_resp.keys = undefined;
    key_resp.rt = undefined;
    _key_resp_allKeys = [];
    // keep track of which components have finished
    InstCloseComponents = [];
    InstCloseComponents.push(text_5);
    InstCloseComponents.push(key_resp);
    
    InstCloseComponents.forEach( function(thisComponent) {
      if ('status' in thisComponent)
        thisComponent.status = PsychoJS.Status.NOT_STARTED;
       });
    
    return Scheduler.Event.NEXT;
  };
}


function InstCloseRoutineEachFrame(trials) {
  return function () {
    //------Loop for each frame of Routine 'InstClose'-------
    let continueRoutine = true; // until we're told otherwise
    // get current time
    t = InstCloseClock.getTime();
    frameN = frameN + 1;// number of completed frames (so 0 is the first frame)
    // update/draw components on each frame
    
    // *text_5* updates
    if (t >= 0.0 && text_5.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      text_5.tStart = t;  // (not accounting for frame time here)
      text_5.frameNStart = frameN;  // exact frame index
      
      text_5.setAutoDraw(true);
    }

    
    // *key_resp* updates
    if (t >= 2 && key_resp.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      key_resp.tStart = t;  // (not accounting for frame time here)
      key_resp.frameNStart = frameN;  // exact frame index
      
      // keyboard checking is just starting
      psychoJS.window.callOnFlip(function() { key_resp.clock.reset(); });  // t=0 on next screen flip
      psychoJS.window.callOnFlip(function() { key_resp.start(); }); // start on screen flip
      psychoJS.window.callOnFlip(function() { key_resp.clearEvents(); });
    }

    if (key_resp.status === PsychoJS.Status.STARTED) {
      let theseKeys = key_resp.getKeys({keyList: ['space'], waitRelease: false});
      _key_resp_allKeys = _key_resp_allKeys.concat(theseKeys);
      if (_key_resp_allKeys.length > 0) {
        key_resp.keys = _key_resp_allKeys[_key_resp_allKeys.length - 1].name;  // just the last key pressed
        key_resp.rt = _key_resp_allKeys[_key_resp_allKeys.length - 1].rt;
        // a response ends the routine
        continueRoutine = false;
      }
    }
    
    // check for quit (typically the Esc key)
    if (psychoJS.experiment.experimentEnded || psychoJS.eventManager.getKeys({keyList:['escape']}).length > 0) {
      return quitPsychoJS('The [Escape] key was pressed. Goodbye!', false);
    }
    
    // check if the Routine should terminate
    if (!continueRoutine) {  // a component has requested a forced-end of Routine
      return Scheduler.Event.NEXT;
    }
    
    continueRoutine = false;  // reverts to True if at least one component still running
    InstCloseComponents.forEach( function(thisComponent) {
      if ('status' in thisComponent && thisComponent.status !== PsychoJS.Status.FINISHED) {
        continueRoutine = true;
      }
    });
    
    // refresh the screen if continuing
    if (continueRoutine) {
      return Scheduler.Event.FLIP_REPEAT;
    } else {
      return Scheduler.Event.NEXT;
    }
  };
}


function InstCloseRoutineEnd(trials) {
  return function () {
    //------Ending Routine 'InstClose'-------
    InstCloseComponents.forEach( function(thisComponent) {
      if (typeof thisComponent.setAutoDraw === 'function') {
        thisComponent.setAutoDraw(false);
      }
    });
    // the Routine "InstClose" was not non-slip safe, so reset the non-slip timer
    routineTimer.reset();
    
    return Scheduler.Event.NEXT;
  };
}


var _key_resp_2_allKeys;
var Inst1Components;
function Inst1RoutineBegin(trials) {
  return function () {
    //------Prepare to start Routine 'Inst1'-------
    t = 0;
    Inst1Clock.reset(); // clock
    frameN = -1;
    // update component parameters for each repeat
    key_resp_2.keys = undefined;
    key_resp_2.rt = undefined;
    _key_resp_2_allKeys = [];
    // keep track of which components have finished
    Inst1Components = [];
    Inst1Components.push(key_resp_2);
    Inst1Components.push(demoring1);
    Inst1Components.push(demofix1);
    Inst1Components.push(demoWhatLike);
    
    Inst1Components.forEach( function(thisComponent) {
      if ('status' in thisComponent)
        thisComponent.status = PsychoJS.Status.NOT_STARTED;
       });
    
    return Scheduler.Event.NEXT;
  };
}


function Inst1RoutineEachFrame(trials) {
  return function () {
    //------Loop for each frame of Routine 'Inst1'-------
    let continueRoutine = true; // until we're told otherwise
    // get current time
    t = Inst1Clock.getTime();
    frameN = frameN + 1;// number of completed frames (so 0 is the first frame)
    // update/draw components on each frame
    
    // *key_resp_2* updates
    if (t >= 3 && key_resp_2.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      key_resp_2.tStart = t;  // (not accounting for frame time here)
      key_resp_2.frameNStart = frameN;  // exact frame index
      
      // keyboard checking is just starting
      psychoJS.window.callOnFlip(function() { key_resp_2.clock.reset(); });  // t=0 on next screen flip
      psychoJS.window.callOnFlip(function() { key_resp_2.start(); }); // start on screen flip
      psychoJS.window.callOnFlip(function() { key_resp_2.clearEvents(); });
    }

    if (key_resp_2.status === PsychoJS.Status.STARTED) {
      let theseKeys = key_resp_2.getKeys({keyList: ['space'], waitRelease: false});
      _key_resp_2_allKeys = _key_resp_2_allKeys.concat(theseKeys);
      if (_key_resp_2_allKeys.length > 0) {
        key_resp_2.keys = _key_resp_2_allKeys[_key_resp_2_allKeys.length - 1].name;  // just the last key pressed
        key_resp_2.rt = _key_resp_2_allKeys[_key_resp_2_allKeys.length - 1].rt;
        // a response ends the routine
        continueRoutine = false;
      }
    }
    
    
    // *demoring1* updates
    if (t >= 0.0 && demoring1.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      demoring1.tStart = t;  // (not accounting for frame time here)
      demoring1.frameNStart = frameN;  // exact frame index
      
      demoring1.setAutoDraw(true);
    }

    
    // *demofix1* updates
    if (t >= 0.0 && demofix1.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      demofix1.tStart = t;  // (not accounting for frame time here)
      demofix1.frameNStart = frameN;  // exact frame index
      
      demofix1.setAutoDraw(true);
    }

    
    // *demoWhatLike* updates
    if (t >= 0.0 && demoWhatLike.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      demoWhatLike.tStart = t;  // (not accounting for frame time here)
      demoWhatLike.frameNStart = frameN;  // exact frame index
      
      demoWhatLike.setAutoDraw(true);
    }

    // check for quit (typically the Esc key)
    if (psychoJS.experiment.experimentEnded || psychoJS.eventManager.getKeys({keyList:['escape']}).length > 0) {
      return quitPsychoJS('The [Escape] key was pressed. Goodbye!', false);
    }
    
    // check if the Routine should terminate
    if (!continueRoutine) {  // a component has requested a forced-end of Routine
      return Scheduler.Event.NEXT;
    }
    
    continueRoutine = false;  // reverts to True if at least one component still running
    Inst1Components.forEach( function(thisComponent) {
      if ('status' in thisComponent && thisComponent.status !== PsychoJS.Status.FINISHED) {
        continueRoutine = true;
      }
    });
    
    // refresh the screen if continuing
    if (continueRoutine) {
      return Scheduler.Event.FLIP_REPEAT;
    } else {
      return Scheduler.Event.NEXT;
    }
  };
}


function Inst1RoutineEnd(trials) {
  return function () {
    //------Ending Routine 'Inst1'-------
    Inst1Components.forEach( function(thisComponent) {
      if (typeof thisComponent.setAutoDraw === 'function') {
        thisComponent.setAutoDraw(false);
      }
    });
    // the Routine "Inst1" was not non-slip safe, so reset the non-slip timer
    routineTimer.reset();
    
    return Scheduler.Event.NEXT;
  };
}


var _key_resp_4_allKeys;
var Inst2Components;
function Inst2RoutineBegin(trials) {
  return function () {
    //------Prepare to start Routine 'Inst2'-------
    t = 0;
    Inst2Clock.reset(); // clock
    frameN = -1;
    // update component parameters for each repeat
    key_resp_4.keys = undefined;
    key_resp_4.rt = undefined;
    _key_resp_4_allKeys = [];
    fake1s.setPos([pos1x, pos1y]);
    fake1s.setFillColor(new util.Color(democols[0]));
    fake1s.setLineColor(new util.Color(democols[0]));
    // keep track of which components have finished
    Inst2Components = [];
    Inst2Components.push(annul2);
    Inst2Components.push(fix2);
    Inst2Components.push(key_resp_4);
    Inst2Components.push(demoOrdering);
    Inst2Components.push(fake1s);
    
    Inst2Components.forEach( function(thisComponent) {
      if ('status' in thisComponent)
        thisComponent.status = PsychoJS.Status.NOT_STARTED;
       });
    
    return Scheduler.Event.NEXT;
  };
}


function Inst2RoutineEachFrame(trials) {
  return function () {
    //------Loop for each frame of Routine 'Inst2'-------
    let continueRoutine = true; // until we're told otherwise
    // get current time
    t = Inst2Clock.getTime();
    frameN = frameN + 1;// number of completed frames (so 0 is the first frame)
    // update/draw components on each frame
    
    // *annul2* updates
    if (t >= 0.0 && annul2.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      annul2.tStart = t;  // (not accounting for frame time here)
      annul2.frameNStart = frameN;  // exact frame index
      
      annul2.setAutoDraw(true);
    }

    
    // *fix2* updates
    if (t >= 0.0 && fix2.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      fix2.tStart = t;  // (not accounting for frame time here)
      fix2.frameNStart = frameN;  // exact frame index
      
      fix2.setAutoDraw(true);
    }

    
    // *key_resp_4* updates
    if (t >= 2 && key_resp_4.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      key_resp_4.tStart = t;  // (not accounting for frame time here)
      key_resp_4.frameNStart = frameN;  // exact frame index
      
      // keyboard checking is just starting
      psychoJS.window.callOnFlip(function() { key_resp_4.clock.reset(); });  // t=0 on next screen flip
      psychoJS.window.callOnFlip(function() { key_resp_4.start(); }); // start on screen flip
      psychoJS.window.callOnFlip(function() { key_resp_4.clearEvents(); });
    }

    if (key_resp_4.status === PsychoJS.Status.STARTED) {
      let theseKeys = key_resp_4.getKeys({keyList: ['space'], waitRelease: false});
      _key_resp_4_allKeys = _key_resp_4_allKeys.concat(theseKeys);
      if (_key_resp_4_allKeys.length > 0) {
        key_resp_4.keys = _key_resp_4_allKeys[_key_resp_4_allKeys.length - 1].name;  // just the last key pressed
        key_resp_4.rt = _key_resp_4_allKeys[_key_resp_4_allKeys.length - 1].rt;
        // a response ends the routine
        continueRoutine = false;
      }
    }
    
    
    // *demoOrdering* updates
    if (t >= 0.0 && demoOrdering.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      demoOrdering.tStart = t;  // (not accounting for frame time here)
      demoOrdering.frameNStart = frameN;  // exact frame index
      
      demoOrdering.setAutoDraw(true);
    }

    
    // *fake1s* updates
    if (t >= 0.0 && fake1s.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      fake1s.tStart = t;  // (not accounting for frame time here)
      fake1s.frameNStart = frameN;  // exact frame index
      
      fake1s.setAutoDraw(true);
    }

    // check for quit (typically the Esc key)
    if (psychoJS.experiment.experimentEnded || psychoJS.eventManager.getKeys({keyList:['escape']}).length > 0) {
      return quitPsychoJS('The [Escape] key was pressed. Goodbye!', false);
    }
    
    // check if the Routine should terminate
    if (!continueRoutine) {  // a component has requested a forced-end of Routine
      return Scheduler.Event.NEXT;
    }
    
    continueRoutine = false;  // reverts to True if at least one component still running
    Inst2Components.forEach( function(thisComponent) {
      if ('status' in thisComponent && thisComponent.status !== PsychoJS.Status.FINISHED) {
        continueRoutine = true;
      }
    });
    
    // refresh the screen if continuing
    if (continueRoutine) {
      return Scheduler.Event.FLIP_REPEAT;
    } else {
      return Scheduler.Event.NEXT;
    }
  };
}


function Inst2RoutineEnd(trials) {
  return function () {
    //------Ending Routine 'Inst2'-------
    Inst2Components.forEach( function(thisComponent) {
      if (typeof thisComponent.setAutoDraw === 'function') {
        thisComponent.setAutoDraw(false);
      }
    });
    // the Routine "Inst2" was not non-slip safe, so reset the non-slip timer
    routineTimer.reset();
    
    return Scheduler.Event.NEXT;
  };
}


var _key_resp_5_allKeys;
var Inst3Components;
function Inst3RoutineBegin(trials) {
  return function () {
    //------Prepare to start Routine 'Inst3'-------
    t = 0;
    Inst3Clock.reset(); // clock
    frameN = -1;
    // update component parameters for each repeat
    key_resp_5.keys = undefined;
    key_resp_5.rt = undefined;
    _key_resp_5_allKeys = [];
    // keep track of which components have finished
    Inst3Components = [];
    Inst3Components.push(key_resp_5);
    Inst3Components.push(annul3);
    Inst3Components.push(fix3);
    Inst3Components.push(demodelay);
    
    Inst3Components.forEach( function(thisComponent) {
      if ('status' in thisComponent)
        thisComponent.status = PsychoJS.Status.NOT_STARTED;
       });
    
    return Scheduler.Event.NEXT;
  };
}


function Inst3RoutineEachFrame(trials) {
  return function () {
    //------Loop for each frame of Routine 'Inst3'-------
    let continueRoutine = true; // until we're told otherwise
    // get current time
    t = Inst3Clock.getTime();
    frameN = frameN + 1;// number of completed frames (so 0 is the first frame)
    // update/draw components on each frame
    
    // *key_resp_5* updates
    if (t >= 2 && key_resp_5.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      key_resp_5.tStart = t;  // (not accounting for frame time here)
      key_resp_5.frameNStart = frameN;  // exact frame index
      
      // keyboard checking is just starting
      psychoJS.window.callOnFlip(function() { key_resp_5.clock.reset(); });  // t=0 on next screen flip
      psychoJS.window.callOnFlip(function() { key_resp_5.start(); }); // start on screen flip
      psychoJS.window.callOnFlip(function() { key_resp_5.clearEvents(); });
    }

    if (key_resp_5.status === PsychoJS.Status.STARTED) {
      let theseKeys = key_resp_5.getKeys({keyList: ['space'], waitRelease: false});
      _key_resp_5_allKeys = _key_resp_5_allKeys.concat(theseKeys);
      if (_key_resp_5_allKeys.length > 0) {
        key_resp_5.keys = _key_resp_5_allKeys[_key_resp_5_allKeys.length - 1].name;  // just the last key pressed
        key_resp_5.rt = _key_resp_5_allKeys[_key_resp_5_allKeys.length - 1].rt;
        // a response ends the routine
        continueRoutine = false;
      }
    }
    
    
    // *annul3* updates
    if (t >= 0.0 && annul3.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      annul3.tStart = t;  // (not accounting for frame time here)
      annul3.frameNStart = frameN;  // exact frame index
      
      annul3.setAutoDraw(true);
    }

    
    // *fix3* updates
    if (t >= 0.0 && fix3.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      fix3.tStart = t;  // (not accounting for frame time here)
      fix3.frameNStart = frameN;  // exact frame index
      
      fix3.setAutoDraw(true);
    }

    
    // *demodelay* updates
    if (t >= 0.0 && demodelay.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      demodelay.tStart = t;  // (not accounting for frame time here)
      demodelay.frameNStart = frameN;  // exact frame index
      
      demodelay.setAutoDraw(true);
    }

    // check for quit (typically the Esc key)
    if (psychoJS.experiment.experimentEnded || psychoJS.eventManager.getKeys({keyList:['escape']}).length > 0) {
      return quitPsychoJS('The [Escape] key was pressed. Goodbye!', false);
    }
    
    // check if the Routine should terminate
    if (!continueRoutine) {  // a component has requested a forced-end of Routine
      return Scheduler.Event.NEXT;
    }
    
    continueRoutine = false;  // reverts to True if at least one component still running
    Inst3Components.forEach( function(thisComponent) {
      if ('status' in thisComponent && thisComponent.status !== PsychoJS.Status.FINISHED) {
        continueRoutine = true;
      }
    });
    
    // refresh the screen if continuing
    if (continueRoutine) {
      return Scheduler.Event.FLIP_REPEAT;
    } else {
      return Scheduler.Event.NEXT;
    }
  };
}


function Inst3RoutineEnd(trials) {
  return function () {
    //------Ending Routine 'Inst3'-------
    Inst3Components.forEach( function(thisComponent) {
      if (typeof thisComponent.setAutoDraw === 'function') {
        thisComponent.setAutoDraw(false);
      }
    });
    // the Routine "Inst3" was not non-slip safe, so reset the non-slip timer
    routineTimer.reset();
    
    return Scheduler.Event.NEXT;
  };
}


var _key_resp_6_allKeys;
var Inst4Components;
function Inst4RoutineBegin(trials) {
  return function () {
    //------Prepare to start Routine 'Inst4'-------
    t = 0;
    Inst4Clock.reset(); // clock
    frameN = -1;
    // update component parameters for each repeat
    key_resp_6.keys = undefined;
    key_resp_6.rt = undefined;
    _key_resp_6_allKeys = [];
    // keep track of which components have finished
    Inst4Components = [];
    Inst4Components.push(key_resp_6);
    Inst4Components.push(demoStartResp);
    
    Inst4Components.forEach( function(thisComponent) {
      if ('status' in thisComponent)
        thisComponent.status = PsychoJS.Status.NOT_STARTED;
       });
    
    return Scheduler.Event.NEXT;
  };
}


function Inst4RoutineEachFrame(trials) {
  return function () {
    //------Loop for each frame of Routine 'Inst4'-------
    let continueRoutine = true; // until we're told otherwise
    // get current time
    t = Inst4Clock.getTime();
    frameN = frameN + 1;// number of completed frames (so 0 is the first frame)
    // update/draw components on each frame
    
    // *key_resp_6* updates
    if (t >= 2 && key_resp_6.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      key_resp_6.tStart = t;  // (not accounting for frame time here)
      key_resp_6.frameNStart = frameN;  // exact frame index
      
      // keyboard checking is just starting
      psychoJS.window.callOnFlip(function() { key_resp_6.clock.reset(); });  // t=0 on next screen flip
      psychoJS.window.callOnFlip(function() { key_resp_6.start(); }); // start on screen flip
      psychoJS.window.callOnFlip(function() { key_resp_6.clearEvents(); });
    }

    if (key_resp_6.status === PsychoJS.Status.STARTED) {
      let theseKeys = key_resp_6.getKeys({keyList: ['space'], waitRelease: false});
      _key_resp_6_allKeys = _key_resp_6_allKeys.concat(theseKeys);
      if (_key_resp_6_allKeys.length > 0) {
        key_resp_6.keys = _key_resp_6_allKeys[_key_resp_6_allKeys.length - 1].name;  // just the last key pressed
        key_resp_6.rt = _key_resp_6_allKeys[_key_resp_6_allKeys.length - 1].rt;
        // a response ends the routine
        continueRoutine = false;
      }
    }
    
    
    // *demoStartResp* updates
    if (t >= 0.0 && demoStartResp.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      demoStartResp.tStart = t;  // (not accounting for frame time here)
      demoStartResp.frameNStart = frameN;  // exact frame index
      
      demoStartResp.setAutoDraw(true);
    }

    // check for quit (typically the Esc key)
    if (psychoJS.experiment.experimentEnded || psychoJS.eventManager.getKeys({keyList:['escape']}).length > 0) {
      return quitPsychoJS('The [Escape] key was pressed. Goodbye!', false);
    }
    
    // check if the Routine should terminate
    if (!continueRoutine) {  // a component has requested a forced-end of Routine
      return Scheduler.Event.NEXT;
    }
    
    continueRoutine = false;  // reverts to True if at least one component still running
    Inst4Components.forEach( function(thisComponent) {
      if ('status' in thisComponent && thisComponent.status !== PsychoJS.Status.FINISHED) {
        continueRoutine = true;
      }
    });
    
    // refresh the screen if continuing
    if (continueRoutine) {
      return Scheduler.Event.FLIP_REPEAT;
    } else {
      return Scheduler.Event.NEXT;
    }
  };
}


function Inst4RoutineEnd(trials) {
  return function () {
    //------Ending Routine 'Inst4'-------
    Inst4Components.forEach( function(thisComponent) {
      if (typeof thisComponent.setAutoDraw === 'function') {
        thisComponent.setAutoDraw(false);
      }
    });
    // the Routine "Inst4" was not non-slip safe, so reset the non-slip timer
    routineTimer.reset();
    
    return Scheduler.Event.NEXT;
  };
}


var _key_resp_7_allKeys;
var Inst5Components;
function Inst5RoutineBegin(trials) {
  return function () {
    //------Prepare to start Routine 'Inst5'-------
    t = 0;
    Inst5Clock.reset(); // clock
    frameN = -1;
    // update component parameters for each repeat
    key_resp_7.keys = undefined;
    key_resp_7.rt = undefined;
    _key_resp_7_allKeys = [];
    // keep track of which components have finished
    Inst5Components = [];
    Inst5Components.push(key_resp_7);
    Inst5Components.push(demohowmove);
    
    Inst5Components.forEach( function(thisComponent) {
      if ('status' in thisComponent)
        thisComponent.status = PsychoJS.Status.NOT_STARTED;
       });
    
    return Scheduler.Event.NEXT;
  };
}


function Inst5RoutineEachFrame(trials) {
  return function () {
    //------Loop for each frame of Routine 'Inst5'-------
    let continueRoutine = true; // until we're told otherwise
    // get current time
    t = Inst5Clock.getTime();
    frameN = frameN + 1;// number of completed frames (so 0 is the first frame)
    // update/draw components on each frame
    
    // *key_resp_7* updates
    if (t >= 2 && key_resp_7.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      key_resp_7.tStart = t;  // (not accounting for frame time here)
      key_resp_7.frameNStart = frameN;  // exact frame index
      
      // keyboard checking is just starting
      psychoJS.window.callOnFlip(function() { key_resp_7.clock.reset(); });  // t=0 on next screen flip
      psychoJS.window.callOnFlip(function() { key_resp_7.start(); }); // start on screen flip
      psychoJS.window.callOnFlip(function() { key_resp_7.clearEvents(); });
    }

    if (key_resp_7.status === PsychoJS.Status.STARTED) {
      let theseKeys = key_resp_7.getKeys({keyList: ['space'], waitRelease: false});
      _key_resp_7_allKeys = _key_resp_7_allKeys.concat(theseKeys);
      if (_key_resp_7_allKeys.length > 0) {
        key_resp_7.keys = _key_resp_7_allKeys[_key_resp_7_allKeys.length - 1].name;  // just the last key pressed
        key_resp_7.rt = _key_resp_7_allKeys[_key_resp_7_allKeys.length - 1].rt;
        // a response ends the routine
        continueRoutine = false;
      }
    }
    
    
    // *demohowmove* updates
    if (t >= 0.0 && demohowmove.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      demohowmove.tStart = t;  // (not accounting for frame time here)
      demohowmove.frameNStart = frameN;  // exact frame index
      
      demohowmove.setAutoDraw(true);
    }

    // check for quit (typically the Esc key)
    if (psychoJS.experiment.experimentEnded || psychoJS.eventManager.getKeys({keyList:['escape']}).length > 0) {
      return quitPsychoJS('The [Escape] key was pressed. Goodbye!', false);
    }
    
    // check if the Routine should terminate
    if (!continueRoutine) {  // a component has requested a forced-end of Routine
      return Scheduler.Event.NEXT;
    }
    
    continueRoutine = false;  // reverts to True if at least one component still running
    Inst5Components.forEach( function(thisComponent) {
      if ('status' in thisComponent && thisComponent.status !== PsychoJS.Status.FINISHED) {
        continueRoutine = true;
      }
    });
    
    // refresh the screen if continuing
    if (continueRoutine) {
      return Scheduler.Event.FLIP_REPEAT;
    } else {
      return Scheduler.Event.NEXT;
    }
  };
}


function Inst5RoutineEnd(trials) {
  return function () {
    //------Ending Routine 'Inst5'-------
    Inst5Components.forEach( function(thisComponent) {
      if (typeof thisComponent.setAutoDraw === 'function') {
        thisComponent.setAutoDraw(false);
      }
    });
    // the Routine "Inst5" was not non-slip safe, so reset the non-slip timer
    routineTimer.reset();
    
    return Scheduler.Event.NEXT;
  };
}


var _key_resp_8_allKeys;
var Inst6Components;
function Inst6RoutineBegin(trials) {
  return function () {
    //------Prepare to start Routine 'Inst6'-------
    t = 0;
    Inst6Clock.reset(); // clock
    frameN = -1;
    // update component parameters for each repeat
    key_resp_8.keys = undefined;
    key_resp_8.rt = undefined;
    _key_resp_8_allKeys = [];
    // keep track of which components have finished
    Inst6Components = [];
    Inst6Components.push(key_resp_8);
    Inst6Components.push(demoFB);
    
    Inst6Components.forEach( function(thisComponent) {
      if ('status' in thisComponent)
        thisComponent.status = PsychoJS.Status.NOT_STARTED;
       });
    
    return Scheduler.Event.NEXT;
  };
}


function Inst6RoutineEachFrame(trials) {
  return function () {
    //------Loop for each frame of Routine 'Inst6'-------
    let continueRoutine = true; // until we're told otherwise
    // get current time
    t = Inst6Clock.getTime();
    frameN = frameN + 1;// number of completed frames (so 0 is the first frame)
    // update/draw components on each frame
    
    // *key_resp_8* updates
    if (t >= 2 && key_resp_8.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      key_resp_8.tStart = t;  // (not accounting for frame time here)
      key_resp_8.frameNStart = frameN;  // exact frame index
      
      // keyboard checking is just starting
      psychoJS.window.callOnFlip(function() { key_resp_8.clock.reset(); });  // t=0 on next screen flip
      psychoJS.window.callOnFlip(function() { key_resp_8.start(); }); // start on screen flip
      psychoJS.window.callOnFlip(function() { key_resp_8.clearEvents(); });
    }

    if (key_resp_8.status === PsychoJS.Status.STARTED) {
      let theseKeys = key_resp_8.getKeys({keyList: ['space'], waitRelease: false});
      _key_resp_8_allKeys = _key_resp_8_allKeys.concat(theseKeys);
      if (_key_resp_8_allKeys.length > 0) {
        key_resp_8.keys = _key_resp_8_allKeys[_key_resp_8_allKeys.length - 1].name;  // just the last key pressed
        key_resp_8.rt = _key_resp_8_allKeys[_key_resp_8_allKeys.length - 1].rt;
        // a response ends the routine
        continueRoutine = false;
      }
    }
    
    
    // *demoFB* updates
    if (t >= 0.0 && demoFB.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      demoFB.tStart = t;  // (not accounting for frame time here)
      demoFB.frameNStart = frameN;  // exact frame index
      
      demoFB.setAutoDraw(true);
    }

    // check for quit (typically the Esc key)
    if (psychoJS.experiment.experimentEnded || psychoJS.eventManager.getKeys({keyList:['escape']}).length > 0) {
      return quitPsychoJS('The [Escape] key was pressed. Goodbye!', false);
    }
    
    // check if the Routine should terminate
    if (!continueRoutine) {  // a component has requested a forced-end of Routine
      return Scheduler.Event.NEXT;
    }
    
    continueRoutine = false;  // reverts to True if at least one component still running
    Inst6Components.forEach( function(thisComponent) {
      if ('status' in thisComponent && thisComponent.status !== PsychoJS.Status.FINISHED) {
        continueRoutine = true;
      }
    });
    
    // refresh the screen if continuing
    if (continueRoutine) {
      return Scheduler.Event.FLIP_REPEAT;
    } else {
      return Scheduler.Event.NEXT;
    }
  };
}


function Inst6RoutineEnd(trials) {
  return function () {
    //------Ending Routine 'Inst6'-------
    Inst6Components.forEach( function(thisComponent) {
      if (typeof thisComponent.setAutoDraw === 'function') {
        thisComponent.setAutoDraw(false);
      }
    });
    // the Routine "Inst6" was not non-slip safe, so reset the non-slip timer
    routineTimer.reset();
    
    return Scheduler.Event.NEXT;
  };
}


var _key_resp_9_allKeys;
var Inst7Components;
function Inst7RoutineBegin(trials) {
  return function () {
    //------Prepare to start Routine 'Inst7'-------
    t = 0;
    Inst7Clock.reset(); // clock
    frameN = -1;
    // update component parameters for each repeat
    key_resp_9.keys = undefined;
    key_resp_9.rt = undefined;
    _key_resp_9_allKeys = [];
    // keep track of which components have finished
    Inst7Components = [];
    Inst7Components.push(key_resp_9);
    Inst7Components.push(text_3);
    
    Inst7Components.forEach( function(thisComponent) {
      if ('status' in thisComponent)
        thisComponent.status = PsychoJS.Status.NOT_STARTED;
       });
    
    return Scheduler.Event.NEXT;
  };
}


function Inst7RoutineEachFrame(trials) {
  return function () {
    //------Loop for each frame of Routine 'Inst7'-------
    let continueRoutine = true; // until we're told otherwise
    // get current time
    t = Inst7Clock.getTime();
    frameN = frameN + 1;// number of completed frames (so 0 is the first frame)
    // update/draw components on each frame
    
    // *key_resp_9* updates
    if (t >= 2 && key_resp_9.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      key_resp_9.tStart = t;  // (not accounting for frame time here)
      key_resp_9.frameNStart = frameN;  // exact frame index
      
      // keyboard checking is just starting
      psychoJS.window.callOnFlip(function() { key_resp_9.clock.reset(); });  // t=0 on next screen flip
      psychoJS.window.callOnFlip(function() { key_resp_9.start(); }); // start on screen flip
      psychoJS.window.callOnFlip(function() { key_resp_9.clearEvents(); });
    }

    if (key_resp_9.status === PsychoJS.Status.STARTED) {
      let theseKeys = key_resp_9.getKeys({keyList: ['space'], waitRelease: false});
      _key_resp_9_allKeys = _key_resp_9_allKeys.concat(theseKeys);
      if (_key_resp_9_allKeys.length > 0) {
        key_resp_9.keys = _key_resp_9_allKeys[_key_resp_9_allKeys.length - 1].name;  // just the last key pressed
        key_resp_9.rt = _key_resp_9_allKeys[_key_resp_9_allKeys.length - 1].rt;
        // a response ends the routine
        continueRoutine = false;
      }
    }
    
    
    // *text_3* updates
    if (t >= 0.0 && text_3.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      text_3.tStart = t;  // (not accounting for frame time here)
      text_3.frameNStart = frameN;  // exact frame index
      
      text_3.setAutoDraw(true);
    }

    // check for quit (typically the Esc key)
    if (psychoJS.experiment.experimentEnded || psychoJS.eventManager.getKeys({keyList:['escape']}).length > 0) {
      return quitPsychoJS('The [Escape] key was pressed. Goodbye!', false);
    }
    
    // check if the Routine should terminate
    if (!continueRoutine) {  // a component has requested a forced-end of Routine
      return Scheduler.Event.NEXT;
    }
    
    continueRoutine = false;  // reverts to True if at least one component still running
    Inst7Components.forEach( function(thisComponent) {
      if ('status' in thisComponent && thisComponent.status !== PsychoJS.Status.FINISHED) {
        continueRoutine = true;
      }
    });
    
    // refresh the screen if continuing
    if (continueRoutine) {
      return Scheduler.Event.FLIP_REPEAT;
    } else {
      return Scheduler.Event.NEXT;
    }
  };
}


function Inst7RoutineEnd(trials) {
  return function () {
    //------Ending Routine 'Inst7'-------
    Inst7Components.forEach( function(thisComponent) {
      if (typeof thisComponent.setAutoDraw === 'function') {
        thisComponent.setAutoDraw(false);
      }
    });
    // the Routine "Inst7" was not non-slip safe, so reset the non-slip timer
    routineTimer.reset();
    
    return Scheduler.Event.NEXT;
  };
}


var trials;
var currentLoop;
function trialsLoopBegin(thisScheduler) {
  // set up handler to look after randomisation of conditions etc
  trials = new TrialHandler({
    psychoJS: psychoJS,
    nReps: 50, method: TrialHandler.Method.RANDOM,
    extraInfo: expInfo, originPath: undefined,
    trialList: 'Conditions.xlsx',
    seed: undefined, name: 'trials'
  });
  psychoJS.experiment.addLoop(trials); // add the loop to the experiment
  currentLoop = trials;  // we're now the current loop

  // Schedule all the trials in the trialList:
  trials.forEach(function() {
    const snapshot = trials.getSnapshot();

    thisScheduler.add(importConditions(snapshot));
    thisScheduler.add(StartTrialRoutineBegin(snapshot));
    thisScheduler.add(StartTrialRoutineEachFrame(snapshot));
    thisScheduler.add(StartTrialRoutineEnd(snapshot));
    thisScheduler.add(trialRoutineBegin(snapshot));
    thisScheduler.add(trialRoutineEachFrame(snapshot));
    thisScheduler.add(trialRoutineEnd(snapshot));
    thisScheduler.add(RespondRoutineBegin(snapshot));
    thisScheduler.add(RespondRoutineEachFrame(snapshot));
    thisScheduler.add(RespondRoutineEnd(snapshot));
    thisScheduler.add(FeedbackRoutineBegin(snapshot));
    thisScheduler.add(FeedbackRoutineEachFrame(snapshot));
    thisScheduler.add(FeedbackRoutineEnd(snapshot));
    thisScheduler.add(endLoopIteration(thisScheduler, snapshot));
  });

  return Scheduler.Event.NEXT;
}


function trialsLoopEnd() {
  psychoJS.experiment.removeLoop(trials);

  return Scheduler.Event.NEXT;
}


var gotValidClick;
var StartTrialComponents;
function StartTrialRoutineBegin(trials) {
  return function () {
    //------Prepare to start Routine 'StartTrial'-------
    t = 0;
    StartTrialClock.reset(); // clock
    frameN = -1;
    // update component parameters for each repeat
    document.body.style.cursor = "auto";
    
    // setup some python lists for storing info about the mouse_2
    mouse_2.clicked_name = [];
    gotValidClick = false; // until a click is received
    counterstart.setText(totalTrials);
    totalstart.setText(trials.nTotal);
    // keep track of which components have finished
    StartTrialComponents = [];
    StartTrialComponents.push(fixstart);
    StartTrialComponents.push(fixstart1);
    StartTrialComponents.push(mouse_2);
    StartTrialComponents.push(counterstart);
    StartTrialComponents.push(slashstart);
    StartTrialComponents.push(totalstart);
    
    StartTrialComponents.forEach( function(thisComponent) {
      if ('status' in thisComponent)
        thisComponent.status = PsychoJS.Status.NOT_STARTED;
       });
    
    return Scheduler.Event.NEXT;
  };
}


var prevButtonState;
function StartTrialRoutineEachFrame(trials) {
  return function () {
    //------Loop for each frame of Routine 'StartTrial'-------
    let continueRoutine = true; // until we're told otherwise
    // get current time
    t = StartTrialClock.getTime();
    frameN = frameN + 1;// number of completed frames (so 0 is the first frame)
    // update/draw components on each frame
    
    // *fixstart* updates
    if (t >= 0.0 && fixstart.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      fixstart.tStart = t;  // (not accounting for frame time here)
      fixstart.frameNStart = frameN;  // exact frame index
      
      fixstart.setAutoDraw(true);
    }

    
    // *fixstart1* updates
    if (t >= 0.0 && fixstart1.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      fixstart1.tStart = t;  // (not accounting for frame time here)
      fixstart1.frameNStart = frameN;  // exact frame index
      
      fixstart1.setAutoDraw(true);
    }

    // *mouse_2* updates
    if (t >= 0.0 && mouse_2.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      mouse_2.tStart = t;  // (not accounting for frame time here)
      mouse_2.frameNStart = frameN;  // exact frame index
      
      mouse_2.status = PsychoJS.Status.STARTED;
      mouse_2.mouseClock.reset();
      prevButtonState = [0, 0, 0];  // if now button is down we will treat as 'new' click
      }
    if (mouse_2.status === PsychoJS.Status.STARTED) {  // only update if started and not finished!
      let buttons = mouse_2.getPressed();
      if (!buttons.every( (e,i,) => (e == prevButtonState[i]) )) { // button state changed?
        prevButtonState = buttons;
        if (buttons.reduce( (e, acc) => (e+acc) ) > 0) { // state changed to a new click
          // check if the mouse was inside our 'clickable' objects
          gotValidClick = false;
          for (const obj of [fixstart1]) {
            if (obj.contains(mouse_2)) {
              gotValidClick = true;
              mouse_2.clicked_name.push(obj.name)
            }
          }
          if (gotValidClick === true) { // abort routine on response
            continueRoutine = false;
          }
        }
      }
    }
    
    // *counterstart* updates
    if (t >= 0.0 && counterstart.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      counterstart.tStart = t;  // (not accounting for frame time here)
      counterstart.frameNStart = frameN;  // exact frame index
      
      counterstart.setAutoDraw(true);
    }

    
    // *slashstart* updates
    if (t >= 0.0 && slashstart.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      slashstart.tStart = t;  // (not accounting for frame time here)
      slashstart.frameNStart = frameN;  // exact frame index
      
      slashstart.setAutoDraw(true);
    }

    
    // *totalstart* updates
    if (t >= 0.0 && totalstart.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      totalstart.tStart = t;  // (not accounting for frame time here)
      totalstart.frameNStart = frameN;  // exact frame index
      
      totalstart.setAutoDraw(true);
    }

    // check for quit (typically the Esc key)
    if (psychoJS.experiment.experimentEnded || psychoJS.eventManager.getKeys({keyList:['escape']}).length > 0) {
      return quitPsychoJS('The [Escape] key was pressed. Goodbye!', false);
    }
    
    // check if the Routine should terminate
    if (!continueRoutine) {  // a component has requested a forced-end of Routine
      return Scheduler.Event.NEXT;
    }
    
    continueRoutine = false;  // reverts to True if at least one component still running
    StartTrialComponents.forEach( function(thisComponent) {
      if ('status' in thisComponent && thisComponent.status !== PsychoJS.Status.FINISHED) {
        continueRoutine = true;
      }
    });
    
    // refresh the screen if continuing
    if (continueRoutine) {
      return Scheduler.Event.FLIP_REPEAT;
    } else {
      return Scheduler.Event.NEXT;
    }
  };
}


function StartTrialRoutineEnd(trials) {
  return function () {
    //------Ending Routine 'StartTrial'-------
    StartTrialComponents.forEach( function(thisComponent) {
      if (typeof thisComponent.setAutoDraw === 'function') {
        thisComponent.setAutoDraw(false);
      }
    });
    // store data for thisExp (ExperimentHandler)
    // the Routine "StartTrial" was not non-slip safe, so reset the non-slip timer
    routineTimer.reset();
    
    return Scheduler.Event.NEXT;
  };
}


var baseloc;
var pickset;
var resppos;
var trialComponents;
function trialRoutineBegin(trials) {
  return function () {
    //------Prepare to start Routine 'trial'-------
    t = 0;
    trialClock.reset(); // clock
    frameN = -1;
    // update component parameters for each repeat
    sets = [[(- 22), (- 2), 7, 13, (- 11)], [24, (- 25), (- 4), 12, 6], [15, (- 18), 29, 3, (- 30)], [17, 0, (- 22), (- 10), 7], [0, 9, (- 19), (- 12), 28]];
    baseloc = 999;
    pickset = 999;
    baseloc = (Math.floor((Math.random() * ((360 - 0) + 1))) + 0);
    pickset = (Math.floor((Math.random() * ((4 - 0) + 1))) + 0);
    theset = [];
    theset = sets[pickset];
    document.body.style.cursor = "none";
    radius = 0.25;
    pos1x = 0;
    pos1y = 0;
    pos2x = 0;
    pos2y = 0;
    pos3x = 0;
    pos3y = 0;
    pos4x = 0;
    pos4y = 0;
    pos5x = 0;
    pos5y = 0;
    theset[0] = (theset[0] + baseloc);
    theset[1] = (theset[1] + baseloc);
    theset[2] = (theset[2] + baseloc);
    theset[3] = (theset[3] + baseloc);
    theset[4] = (theset[4] + baseloc);
    pi = 3.14;
    theset = theset.slice(0, pts);
    sorted = [];
    looptimes = pts;
    storeset = [];
    storeset = theset;
    storesetStart = [];
    storesetEnd = [];
    smallest = 0;
    smallind = 0;
    while ((looptimes > 0)) {
        smallest = storeset[0];
        smallind = 0;
        for (var j = 0, _pj_a = looptimes; (j < _pj_a); j += 1) {
            if ((smallest > storeset[j])) {
                smallind = j;
                smallest = storeset[j];
            }
        }
        sorted.push(smallest);
        if ((smallind === 0)) {
            storeset = storeset.slice(1, looptimes);
        } else {
            if ((smallind === looptimes)) {
                storeset = storeset.slice(0, (looptimes - 1));
            } else {
                storesetStart = storeset.slice(0, smallind);
                storesetEnd = storeset.slice((smallind + 1), looptimes);
                storeset = [].concat(storesetStart, storesetEnd);
            }
        }
        looptimes = (looptimes - 1);
    }
    theset = sorted;
    if ((pts === 1)) {
        pos1x = (radius * Math.cos(((theset[0] * pi) / 180)));
        pos1y = (radius * Math.sin(((theset[0] * pi) / 180)));
        op2 = 0;
        op3 = 0;
        op4 = 0;
        psychoJS.experiment.addData("Targ1", theset[0]);
        psychoJS.experiment.addData("Targ2", 999);
        psychoJS.experiment.addData("Targ3", 999);
        psychoJS.experiment.addData("Targ4", 999);
        psychoJS.experiment.addData("Targ5", 999);
    } else {
        if ((pts === 2)) {
            pos1x = (radius * Math.cos(((theset[0] * pi) / 180)));
            pos1y = (radius * Math.sin(((theset[0] * pi) / 180)));
            pos2x = (radius * Math.cos(((theset[1] * pi) / 180)));
            pos2y = (radius * Math.sin(((theset[1] * pi) / 180)));
            op2 = 1;
            op3 = 0;
            op4 = 0;
            psychoJS.experiment.addData("Targ1", theset[0]);
            psychoJS.experiment.addData("Targ2", theset[1]);
            psychoJS.experiment.addData("Targ3", 999);
            psychoJS.experiment.addData("Targ4", 999);
            psychoJS.experiment.addData("Targ5", 999);
        } else {
            if ((pts === 3)) {
                pos1x = (radius * Math.cos(((theset[0] * pi) / 180)));
                pos1y = (radius * Math.sin(((theset[0] * pi) / 180)));
                pos2x = (radius * Math.cos(((theset[1] * pi) / 180)));
                pos2y = (radius * Math.sin(((theset[1] * pi) / 180)));
                pos3x = (radius * Math.cos(((theset[2] * pi) / 180)));
                pos3y = (radius * Math.sin(((theset[2] * pi) / 180)));
                op2 = 1;
                op3 = 1;
                op4 = 0;
                psychoJS.experiment.addData("Targ1", theset[0]);
                psychoJS.experiment.addData("Targ2", theset[1]);
                psychoJS.experiment.addData("Targ3", theset[2]);
                psychoJS.experiment.addData("Targ4", 999);
                psychoJS.experiment.addData("Targ5", 999);
            } else {
                pos1x = (radius * Math.cos(((theset[0] * pi) / 180)));
                pos1y = (radius * Math.sin(((theset[0] * pi) / 180)));
                pos2x = (radius * Math.cos(((theset[1] * pi) / 180)));
                pos2y = (radius * Math.sin(((theset[1] * pi) / 180)));
                pos3x = (radius * Math.cos(((theset[2] * pi) / 180)));
                pos3y = (radius * Math.sin(((theset[2] * pi) / 180)));
                pos4x = (radius * Math.cos(((theset[3] * pi) / 180)));
                pos4y = (radius * Math.sin(((theset[3] * pi) / 180)));
                pos5x = (radius * Math.cos(((theset[4] * pi) / 180)));
                pos5y = (radius * Math.sin(((theset[4] * pi) / 180)));
                psychoJS.experiment.addData("Targ1", theset[0]);
                psychoJS.experiment.addData("Targ2", theset[1]);
                psychoJS.experiment.addData("Targ3", theset[2]);
                psychoJS.experiment.addData("Targ4", theset[3]);
                psychoJS.experiment.addData("Targ5", theset[4]);
                op2 = 1;
                op3 = 1;
                op4 = 1;
            }
        }
    }
    resppos = mouse.getPos();
    
    Targ1.setPos([pos1x, pos1y]);
    Targ2.setOpacity(op2);
    Targ2.setPos([pos2x, pos2y]);
    Targ3.setOpacity(op3);
    Targ3.setPos([pos3x, pos3y]);
    Targ4.setOpacity(op4);
    Targ4.setPos([pos4x, pos4y]);
    Targ5.setOpacity(op4);
    Targ5.setPos([pos5x, pos5y]);
    counter.setText(totalTrials);
    total.setText(trials.nTotal);
    // keep track of which components have finished
    trialComponents = [];
    trialComponents.push(Anulus);
    trialComponents.push(Fixation);
    trialComponents.push(Targ1);
    trialComponents.push(Targ2);
    trialComponents.push(Targ3);
    trialComponents.push(Targ4);
    trialComponents.push(Targ5);
    trialComponents.push(counter);
    trialComponents.push(total);
    trialComponents.push(slash);
    
    trialComponents.forEach( function(thisComponent) {
      if ('status' in thisComponent)
        thisComponent.status = PsychoJS.Status.NOT_STARTED;
       });
    
    return Scheduler.Event.NEXT;
  };
}


function trialRoutineEachFrame(trials) {
  return function () {
    //------Loop for each frame of Routine 'trial'-------
    let continueRoutine = true; // until we're told otherwise
    // get current time
    t = trialClock.getTime();
    frameN = frameN + 1;// number of completed frames (so 0 is the first frame)
    // update/draw components on each frame
    
    // *Anulus* updates
    if (t >= 0.0 && Anulus.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      Anulus.tStart = t;  // (not accounting for frame time here)
      Anulus.frameNStart = frameN;  // exact frame index
      
      Anulus.setAutoDraw(true);
    }

    frameRemains = 0.0 + (thedelay + 0.8) - psychoJS.window.monitorFramePeriod * 0.75;  // most of one frame period left
    if (Anulus.status === PsychoJS.Status.STARTED && t >= frameRemains) {
      Anulus.setAutoDraw(false);
    }
    
    // *Fixation* updates
    if (t >= 0.0 && Fixation.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      Fixation.tStart = t;  // (not accounting for frame time here)
      Fixation.frameNStart = frameN;  // exact frame index
      
      Fixation.setAutoDraw(true);
    }

    frameRemains = 0.0 + (thedelay + 0.8) - psychoJS.window.monitorFramePeriod * 0.75;  // most of one frame period left
    if (Fixation.status === PsychoJS.Status.STARTED && t >= frameRemains) {
      Fixation.setAutoDraw(false);
    }
    
    // *Targ1* updates
    if (t >= 0.25 && Targ1.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      Targ1.tStart = t;  // (not accounting for frame time here)
      Targ1.frameNStart = frameN;  // exact frame index
      
      Targ1.setAutoDraw(true);
    }

    frameRemains = 0.25 + 0.5 - psychoJS.window.monitorFramePeriod * 0.75;  // most of one frame period left
    if (Targ1.status === PsychoJS.Status.STARTED && t >= frameRemains) {
      Targ1.setAutoDraw(false);
    }
    
    // *Targ2* updates
    if (t >= 0.25 && Targ2.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      Targ2.tStart = t;  // (not accounting for frame time here)
      Targ2.frameNStart = frameN;  // exact frame index
      
      Targ2.setAutoDraw(true);
    }

    frameRemains = 0.25 + 0.5 - psychoJS.window.monitorFramePeriod * 0.75;  // most of one frame period left
    if (Targ2.status === PsychoJS.Status.STARTED && t >= frameRemains) {
      Targ2.setAutoDraw(false);
    }
    
    // *Targ3* updates
    if (t >= 0.25 && Targ3.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      Targ3.tStart = t;  // (not accounting for frame time here)
      Targ3.frameNStart = frameN;  // exact frame index
      
      Targ3.setAutoDraw(true);
    }

    frameRemains = 0.25 + 0.5 - psychoJS.window.monitorFramePeriod * 0.75;  // most of one frame period left
    if (Targ3.status === PsychoJS.Status.STARTED && t >= frameRemains) {
      Targ3.setAutoDraw(false);
    }
    
    // *Targ4* updates
    if (t >= 0.25 && Targ4.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      Targ4.tStart = t;  // (not accounting for frame time here)
      Targ4.frameNStart = frameN;  // exact frame index
      
      Targ4.setAutoDraw(true);
    }

    frameRemains = 0.25 + 0.5 - psychoJS.window.monitorFramePeriod * 0.75;  // most of one frame period left
    if (Targ4.status === PsychoJS.Status.STARTED && t >= frameRemains) {
      Targ4.setAutoDraw(false);
    }
    
    // *Targ5* updates
    if (t >= 0.25 && Targ5.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      Targ5.tStart = t;  // (not accounting for frame time here)
      Targ5.frameNStart = frameN;  // exact frame index
      
      Targ5.setAutoDraw(true);
    }

    frameRemains = 0.25 + 0.5 - psychoJS.window.monitorFramePeriod * 0.75;  // most of one frame period left
    if (Targ5.status === PsychoJS.Status.STARTED && t >= frameRemains) {
      Targ5.setAutoDraw(false);
    }
    
    // *counter* updates
    if (t >= 0.0 && counter.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      counter.tStart = t;  // (not accounting for frame time here)
      counter.frameNStart = frameN;  // exact frame index
      
      counter.setAutoDraw(true);
    }

    frameRemains = 0.0 + (thedelay + 0.8) - psychoJS.window.monitorFramePeriod * 0.75;  // most of one frame period left
    if (counter.status === PsychoJS.Status.STARTED && t >= frameRemains) {
      counter.setAutoDraw(false);
    }
    
    // *total* updates
    if (t >= 0.0 && total.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      total.tStart = t;  // (not accounting for frame time here)
      total.frameNStart = frameN;  // exact frame index
      
      total.setAutoDraw(true);
    }

    frameRemains = 0.0 + (thedelay + 0.8) - psychoJS.window.monitorFramePeriod * 0.75;  // most of one frame period left
    if (total.status === PsychoJS.Status.STARTED && t >= frameRemains) {
      total.setAutoDraw(false);
    }
    
    // *slash* updates
    if (t >= 0.0 && slash.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      slash.tStart = t;  // (not accounting for frame time here)
      slash.frameNStart = frameN;  // exact frame index
      
      slash.setAutoDraw(true);
    }

    frameRemains = 0.0 + (thedelay + 0.8) - psychoJS.window.monitorFramePeriod * 0.75;  // most of one frame period left
    if (slash.status === PsychoJS.Status.STARTED && t >= frameRemains) {
      slash.setAutoDraw(false);
    }
    // check for quit (typically the Esc key)
    if (psychoJS.experiment.experimentEnded || psychoJS.eventManager.getKeys({keyList:['escape']}).length > 0) {
      return quitPsychoJS('The [Escape] key was pressed. Goodbye!', false);
    }
    
    // check if the Routine should terminate
    if (!continueRoutine) {  // a component has requested a forced-end of Routine
      return Scheduler.Event.NEXT;
    }
    
    continueRoutine = false;  // reverts to True if at least one component still running
    trialComponents.forEach( function(thisComponent) {
      if ('status' in thisComponent && thisComponent.status !== PsychoJS.Status.FINISHED) {
        continueRoutine = true;
      }
    });
    
    // refresh the screen if continuing
    if (continueRoutine) {
      return Scheduler.Event.FLIP_REPEAT;
    } else {
      return Scheduler.Event.NEXT;
    }
  };
}


var corr;
var posCorrx;
var posCorry;
var totalmean;
var corrLineCol;
var ubercorr;
var corrCol;
function trialRoutineEnd(trials) {
  return function () {
    //------Ending Routine 'trial'-------
    trialComponents.forEach( function(thisComponent) {
      if (typeof thisComponent.setAutoDraw === 'function') {
        thisComponent.setAutoDraw(false);
      }
    });
    corr = 999;
    posCorrx = 0;
    posCorry = 0;
    totalmean = 0;
    corrLineCol = 0;
    ubercorr = 0;
    RespType = (Math.floor((Math.random() * ((1 - 0) + 1))) + 0);
    RespType = 1;
    if ((RespType === 2)) {
        corrCol = [1, 1, 1];
        corr = 6;
        for (var j = 0, _pj_a = pts; (j < _pj_a); j += 1) {
            totalmean = (totalmean + theset[j]);
        }
        totalmean = (totalmean / pts);
        corrLineCol = [1, 1, 1];
        ubercorr = totalmean;
    } else {
        corr = (Math.floor((Math.random() * (((pts - 1) - 0) + 1))) + 0);
        corrCol = colors[corr];
        corrLineCol = [(- 1), (- 1), (- 1)];
        ubercorr = theset[corr];
    }
    psychoJS.experiment.addData("base", baseloc);
    psychoJS.experiment.addData("whichset", pickset);
    psychoJS.experiment.addData("Corr", corr);
    posCorrx = (radius * Math.cos(((ubercorr * pi) / 180)));
    posCorry = (radius * Math.sin(((ubercorr * pi) / 180)));
    psychoJS.experiment.addData("CorrTarg", ubercorr);
    psychoJS.experiment.addData("exptType", 0);
    psychoJS.experiment.addData("tempDelay", 0);
    
    // the Routine "trial" was not non-slip safe, so reset the non-slip timer
    routineTimer.reset();
    
    return Scheduler.Event.NEXT;
  };
}


var RespondComponents;
function RespondRoutineBegin(trials) {
  return function () {
    //------Prepare to start Routine 'Respond'-------
    t = 0;
    RespondClock.reset(); // clock
    frameN = -1;
    // update component parameters for each repeat
    // setup some python lists for storing info about the mouse
    // current position of the mouse:
    mouse.x = [];
    mouse.y = [];
    mouse.leftButton = [];
    mouse.midButton = [];
    mouse.rightButton = [];
    mouse.time = [];
    gotValidClick = false; // until a click is received
    mouse.mouseClock.reset();
    respPosx = 0;
    respPosy = 0;
    response.setPos([respPosx, respPosy]);
    
    response.setFillColor(new util.Color(corrCol));
    response.setLineColor(new util.Color(corrLineCol));
    counter2.setText(totalTrials);
    total2.setText(trials.nTotal);
    // keep track of which components have finished
    RespondComponents = [];
    RespondComponents.push(anulus);
    RespondComponents.push(fixation);
    RespondComponents.push(InnerRing);
    RespondComponents.push(OuterRing);
    RespondComponents.push(mouse);
    RespondComponents.push(response);
    RespondComponents.push(counter2);
    RespondComponents.push(total2);
    RespondComponents.push(text_2);
    
    RespondComponents.forEach( function(thisComponent) {
      if ('status' in thisComponent)
        thisComponent.status = PsychoJS.Status.NOT_STARTED;
       });
    
    return Scheduler.Event.NEXT;
  };
}


var guess;
function RespondRoutineEachFrame(trials) {
  return function () {
    //------Loop for each frame of Routine 'Respond'-------
    let continueRoutine = true; // until we're told otherwise
    // get current time
    t = RespondClock.getTime();
    frameN = frameN + 1;// number of completed frames (so 0 is the first frame)
    // update/draw components on each frame
    
    // *anulus* updates
    if (t >= 0.0 && anulus.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      anulus.tStart = t;  // (not accounting for frame time here)
      anulus.frameNStart = frameN;  // exact frame index
      
      anulus.setAutoDraw(true);
    }

    
    // *fixation* updates
    if (t >= 0.0 && fixation.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      fixation.tStart = t;  // (not accounting for frame time here)
      fixation.frameNStart = frameN;  // exact frame index
      
      fixation.setAutoDraw(true);
    }

    
    // *InnerRing* updates
    if (t >= 0.0 && InnerRing.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      InnerRing.tStart = t;  // (not accounting for frame time here)
      InnerRing.frameNStart = frameN;  // exact frame index
      
      InnerRing.setAutoDraw(true);
    }

    
    // *OuterRing* updates
    if (t >= 0.0 && OuterRing.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      OuterRing.tStart = t;  // (not accounting for frame time here)
      OuterRing.frameNStart = frameN;  // exact frame index
      
      OuterRing.setAutoDraw(true);
    }

    // *mouse* updates
    if (t >= 0.0 && mouse.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      mouse.tStart = t;  // (not accounting for frame time here)
      mouse.frameNStart = frameN;  // exact frame index
      
      mouse.status = PsychoJS.Status.STARTED;
      prevButtonState = mouse.getPressed();  // if button is down already this ISN'T a new click
      }
    if (mouse.status === PsychoJS.Status.STARTED) {  // only update if started and not finished!
      let buttons = mouse.getPressed();
      if (!buttons.every( (e,i,) => (e == prevButtonState[i]) )) { // button state changed?
        prevButtonState = buttons;
        if (buttons.reduce( (e, acc) => (e+acc) ) > 0) { // state changed to a new click
          const xys = mouse.getPos();
          mouse.x.push(xys[0]);
          mouse.y.push(xys[1]);
          mouse.leftButton.push(buttons[0]);
          mouse.midButton.push(buttons[1]);
          mouse.rightButton.push(buttons[2]);
          mouse.time.push(mouse.mouseClock.getTime());
          if (gotValidClick === true) { // abort routine on response
            continueRoutine = false;
          }
        }
      }
    }
    respPosx = mouse.getPos()[0];
    respPosy = mouse.getPos()[1];
    if ((OuterRing.contains(mouse) & (~ InnerRing.contains(mouse)))) {
        if ((mouse.getPressed()[0] === 1)) {
            respPosx = mouse.getPos()[0];
            respPosy = mouse.getPos()[1];
            guess = ((Math.atan2(respPosy, respPosx) * 180) / 3.14);
            continueRoutine = false;
        }
    }
    
    
    // *response* updates
    if (t >= 0.0 && response.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      response.tStart = t;  // (not accounting for frame time here)
      response.frameNStart = frameN;  // exact frame index
      
      response.setAutoDraw(true);
    }

    
    if (response.status === PsychoJS.Status.STARTED){ // only update if being drawn
      response.setPos([respPosx, respPosy]);
    }
    
    // *counter2* updates
    if (t >= 0.0 && counter2.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      counter2.tStart = t;  // (not accounting for frame time here)
      counter2.frameNStart = frameN;  // exact frame index
      
      counter2.setAutoDraw(true);
    }

    
    // *total2* updates
    if (t >= 0.0 && total2.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      total2.tStart = t;  // (not accounting for frame time here)
      total2.frameNStart = frameN;  // exact frame index
      
      total2.setAutoDraw(true);
    }

    
    // *text_2* updates
    if (t >= 0.0 && text_2.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      text_2.tStart = t;  // (not accounting for frame time here)
      text_2.frameNStart = frameN;  // exact frame index
      
      text_2.setAutoDraw(true);
    }

    // check for quit (typically the Esc key)
    if (psychoJS.experiment.experimentEnded || psychoJS.eventManager.getKeys({keyList:['escape']}).length > 0) {
      return quitPsychoJS('The [Escape] key was pressed. Goodbye!', false);
    }
    
    // check if the Routine should terminate
    if (!continueRoutine) {  // a component has requested a forced-end of Routine
      return Scheduler.Event.NEXT;
    }
    
    continueRoutine = false;  // reverts to True if at least one component still running
    RespondComponents.forEach( function(thisComponent) {
      if ('status' in thisComponent && thisComponent.status !== PsychoJS.Status.FINISHED) {
        continueRoutine = true;
      }
    });
    
    // refresh the screen if continuing
    if (continueRoutine) {
      return Scheduler.Event.FLIP_REPEAT;
    } else {
      return Scheduler.Event.NEXT;
    }
  };
}


function RespondRoutineEnd(trials) {
  return function () {
    //------Ending Routine 'Respond'-------
    RespondComponents.forEach( function(thisComponent) {
      if (typeof thisComponent.setAutoDraw === 'function') {
        thisComponent.setAutoDraw(false);
      }
    });
    // store data for thisExp (ExperimentHandler)
    if (mouse.x) {  psychoJS.experiment.addData('mouse.x', mouse.x[0])};
    if (mouse.y) {  psychoJS.experiment.addData('mouse.y', mouse.y[0])};
    if (mouse.leftButton) {  psychoJS.experiment.addData('mouse.leftButton', mouse.leftButton[0])};
    if (mouse.midButton) {  psychoJS.experiment.addData('mouse.midButton', mouse.midButton[0])};
    if (mouse.rightButton) {  psychoJS.experiment.addData('mouse.rightButton', mouse.rightButton[0])};
    if (mouse.time) {  psychoJS.experiment.addData('mouse.time', mouse.time[0])};
    
    if ((guess < 0)) {
        guess = (guess + 360);
    } else {
        if ((guess > 360)) {
            guess = (guess - 360);
        }
    }
    psychoJS.experiment.addData("guess", guess);
    corrCol = corrCol;
    
    // the Routine "Respond" was not non-slip safe, so reset the non-slip timer
    routineTimer.reset();
    
    return Scheduler.Event.NEXT;
  };
}


var howgood;
var err;
var largest;
var startang;
var endang;
var verts;
var newvert;
var radius2;
var grey;
var a;
var FeedbackComponents;
function FeedbackRoutineBegin(trials) {
  return function () {
    //------Prepare to start Routine 'Feedback'-------
    t = 0;
    FeedbackClock.reset(); // clock
    frameN = -1;
    routineTimer.add(0.750000);
    // update component parameters for each repeat
    corrCol = corrCol;
    document.body.style.cursor = "none";
    howgood = [0, 0, 0];
    err = Math.min(Math.abs((guess - ubercorr)), Math.abs(((guess - ubercorr) - 360)));
    err = Math.min(err, Math.abs(((guess - ubercorr) + 360)));
    psychoJS.experiment.addData("err", err);
    if ((err < 7.5)) {
        howgood = [(- 1), 1, (- 1)];
    } else {
        if ((err < 15)) {
            howgood = [1, 1, (- 1)];
        } else {
            howgood = [1, (- 1), (- 1)];
        }
    }
    
    smallest = Math.min(guess, ubercorr);
    largest = Math.max(guess, ubercorr);
    if (((largest - smallest) > 180)) {
        startang = (largest - 360);
        endang = smallest;
    } else {
        startang = smallest;
        endang = largest;
    }
    verts = [];
    newvert = 0;
    radius2 = (radius + 0.07);
    for (var i = startang, _pj_a = endang; (i < _pj_a); i += 0.2) {
        newvert = [(radius2 * Math.cos(((i * 3.14) / 180))), (radius2 * Math.sin(((i * 3.14) / 180)))];
        verts.push(newvert);
    }
    grey = new util.Color([0, 0, 0]);
    a = 1;
    Test1.setFillColor(new util.Color([0, 0, 0]));
    Test1.setLineColor(new util.Color(howgood));
    Test1.setVertices(verts);
    Test1.setAutoDraw(true);
    
    trueans.setPos([posCorrx, posCorry]);
    trueans.setOri(ubercorr);
    trueans.setFillColor(new util.Color(howgood));
    trueans.setLineColor(new util.Color(howgood));
    yourans.setPos([respPosx, respPosy]);
    yourans.setFillColor(new util.Color(corrCol));
    yourans.setLineColor(new util.Color(corrLineCol));
    counter3.setText(totalTrials);
    tots3.setText(trials.nTotal);
    // keep track of which components have finished
    FeedbackComponents = [];
    FeedbackComponents.push(fixy);
    FeedbackComponents.push(anul);
    FeedbackComponents.push(trueans);
    FeedbackComponents.push(yourans);
    FeedbackComponents.push(counter3);
    FeedbackComponents.push(slash3);
    FeedbackComponents.push(tots3);
    
    FeedbackComponents.forEach( function(thisComponent) {
      if ('status' in thisComponent)
        thisComponent.status = PsychoJS.Status.NOT_STARTED;
       });
    
    return Scheduler.Event.NEXT;
  };
}


function FeedbackRoutineEachFrame(trials) {
  return function () {
    //------Loop for each frame of Routine 'Feedback'-------
    let continueRoutine = true; // until we're told otherwise
    // get current time
    t = FeedbackClock.getTime();
    frameN = frameN + 1;// number of completed frames (so 0 is the first frame)
    // update/draw components on each frame
    
    // *fixy* updates
    if (t >= 0.0 && fixy.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      fixy.tStart = t;  // (not accounting for frame time here)
      fixy.frameNStart = frameN;  // exact frame index
      
      fixy.setAutoDraw(true);
    }

    frameRemains = 0.0 + 0.75 - psychoJS.window.monitorFramePeriod * 0.75;  // most of one frame period left
    if (fixy.status === PsychoJS.Status.STARTED && t >= frameRemains) {
      fixy.setAutoDraw(false);
    }
    
    // *anul* updates
    if (t >= 0.0 && anul.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      anul.tStart = t;  // (not accounting for frame time here)
      anul.frameNStart = frameN;  // exact frame index
      
      anul.setAutoDraw(true);
    }

    frameRemains = 0.0 + 0.75 - psychoJS.window.monitorFramePeriod * 0.75;  // most of one frame period left
    if (anul.status === PsychoJS.Status.STARTED && t >= frameRemains) {
      anul.setAutoDraw(false);
    }
    
    // *trueans* updates
    if (t >= 0.0 && trueans.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      trueans.tStart = t;  // (not accounting for frame time here)
      trueans.frameNStart = frameN;  // exact frame index
      
      trueans.setAutoDraw(true);
    }

    frameRemains = 0.0 + 0.75 - psychoJS.window.monitorFramePeriod * 0.75;  // most of one frame period left
    if (trueans.status === PsychoJS.Status.STARTED && t >= frameRemains) {
      trueans.setAutoDraw(false);
    }
    
    // *yourans* updates
    if (t >= 0.0 && yourans.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      yourans.tStart = t;  // (not accounting for frame time here)
      yourans.frameNStart = frameN;  // exact frame index
      
      yourans.setAutoDraw(true);
    }

    frameRemains = 0.0 + 0.75 - psychoJS.window.monitorFramePeriod * 0.75;  // most of one frame period left
    if (yourans.status === PsychoJS.Status.STARTED && t >= frameRemains) {
      yourans.setAutoDraw(false);
    }
    
    // *counter3* updates
    if (t >= 0.0 && counter3.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      counter3.tStart = t;  // (not accounting for frame time here)
      counter3.frameNStart = frameN;  // exact frame index
      
      counter3.setAutoDraw(true);
    }

    frameRemains = 0.0 + 0.75 - psychoJS.window.monitorFramePeriod * 0.75;  // most of one frame period left
    if (counter3.status === PsychoJS.Status.STARTED && t >= frameRemains) {
      counter3.setAutoDraw(false);
    }
    
    // *slash3* updates
    if (t >= 0.0 && slash3.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      slash3.tStart = t;  // (not accounting for frame time here)
      slash3.frameNStart = frameN;  // exact frame index
      
      slash3.setAutoDraw(true);
    }

    frameRemains = 0.0 + 0.75 - psychoJS.window.monitorFramePeriod * 0.75;  // most of one frame period left
    if (slash3.status === PsychoJS.Status.STARTED && t >= frameRemains) {
      slash3.setAutoDraw(false);
    }
    
    // *tots3* updates
    if (t >= 0.0 && tots3.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      tots3.tStart = t;  // (not accounting for frame time here)
      tots3.frameNStart = frameN;  // exact frame index
      
      tots3.setAutoDraw(true);
    }

    frameRemains = 0.0 + 0.75 - psychoJS.window.monitorFramePeriod * 0.75;  // most of one frame period left
    if (tots3.status === PsychoJS.Status.STARTED && t >= frameRemains) {
      tots3.setAutoDraw(false);
    }
    // check for quit (typically the Esc key)
    if (psychoJS.experiment.experimentEnded || psychoJS.eventManager.getKeys({keyList:['escape']}).length > 0) {
      return quitPsychoJS('The [Escape] key was pressed. Goodbye!', false);
    }
    
    // check if the Routine should terminate
    if (!continueRoutine) {  // a component has requested a forced-end of Routine
      return Scheduler.Event.NEXT;
    }
    
    continueRoutine = false;  // reverts to True if at least one component still running
    FeedbackComponents.forEach( function(thisComponent) {
      if ('status' in thisComponent && thisComponent.status !== PsychoJS.Status.FINISHED) {
        continueRoutine = true;
      }
    });
    
    // refresh the screen if continuing
    if (continueRoutine && routineTimer.getTime() > 0) {
      return Scheduler.Event.FLIP_REPEAT;
    } else {
      return Scheduler.Event.NEXT;
    }
  };
}


function FeedbackRoutineEnd(trials) {
  return function () {
    //------Ending Routine 'Feedback'-------
    FeedbackComponents.forEach( function(thisComponent) {
      if (typeof thisComponent.setAutoDraw === 'function') {
        thisComponent.setAutoDraw(false);
      }
    });
    respPosx = 0;
    respPosy = 0;
    totalTrials = (totalTrials + 1);
    
    Test1.setAutoDraw(false);
    
    return Scheduler.Event.NEXT;
  };
}


var bufferComponents;
function bufferRoutineBegin(trials) {
  return function () {
    //------Prepare to start Routine 'buffer'-------
    t = 0;
    bufferClock.reset(); // clock
    frameN = -1;
    routineTimer.add(1.000000);
    // update component parameters for each repeat
    // keep track of which components have finished
    bufferComponents = [];
    bufferComponents.push(text_4);
    
    bufferComponents.forEach( function(thisComponent) {
      if ('status' in thisComponent)
        thisComponent.status = PsychoJS.Status.NOT_STARTED;
       });
    
    return Scheduler.Event.NEXT;
  };
}


function bufferRoutineEachFrame(trials) {
  return function () {
    //------Loop for each frame of Routine 'buffer'-------
    let continueRoutine = true; // until we're told otherwise
    // get current time
    t = bufferClock.getTime();
    frameN = frameN + 1;// number of completed frames (so 0 is the first frame)
    // update/draw components on each frame
    
    // *text_4* updates
    if (t >= 0.0 && text_4.status === PsychoJS.Status.NOT_STARTED) {
      // keep track of start time/frame for later
      text_4.tStart = t;  // (not accounting for frame time here)
      text_4.frameNStart = frameN;  // exact frame index
      
      text_4.setAutoDraw(true);
    }

    frameRemains = 0.0 + 1.0 - psychoJS.window.monitorFramePeriod * 0.75;  // most of one frame period left
    if (text_4.status === PsychoJS.Status.STARTED && t >= frameRemains) {
      text_4.setAutoDraw(false);
    }
    // check for quit (typically the Esc key)
    if (psychoJS.experiment.experimentEnded || psychoJS.eventManager.getKeys({keyList:['escape']}).length > 0) {
      return quitPsychoJS('The [Escape] key was pressed. Goodbye!', false);
    }
    
    // check if the Routine should terminate
    if (!continueRoutine) {  // a component has requested a forced-end of Routine
      return Scheduler.Event.NEXT;
    }
    
    continueRoutine = false;  // reverts to True if at least one component still running
    bufferComponents.forEach( function(thisComponent) {
      if ('status' in thisComponent && thisComponent.status !== PsychoJS.Status.FINISHED) {
        continueRoutine = true;
      }
    });
    
    // refresh the screen if continuing
    if (continueRoutine && routineTimer.getTime() > 0) {
      return Scheduler.Event.FLIP_REPEAT;
    } else {
      return Scheduler.Event.NEXT;
    }
  };
}


function bufferRoutineEnd(trials) {
  return function () {
    //------Ending Routine 'buffer'-------
    bufferComponents.forEach( function(thisComponent) {
      if (typeof thisComponent.setAutoDraw === 'function') {
        thisComponent.setAutoDraw(false);
      }
    });
    return Scheduler.Event.NEXT;
  };
}


function endLoopIteration(thisScheduler, loop) {
  // ------Prepare for next entry------
  return function () {
    if (typeof loop !== 'undefined') {
      // ------Check if user ended loop early------
      if (loop.finished) {
        // Check for and save orphaned data
        if (psychoJS.experiment.isEntryEmpty()) {
          psychoJS.experiment.nextEntry(loop);
        }
      thisScheduler.stop();
      } else {
        const thisTrial = loop.getCurrentTrial();
        if (typeof thisTrial === 'undefined' || !('isTrials' in thisTrial) || thisTrial.isTrials) {
          psychoJS.experiment.nextEntry(loop);
        }
      }
    return Scheduler.Event.NEXT;
    }
  };
}


function importConditions(trials) {
  return function () {
    psychoJS.importAttributes(trials.getCurrentTrial());
    return Scheduler.Event.NEXT;
    };
}


function quitPsychoJS(message, isCompleted) {
  // Check for and save orphaned data
  if (psychoJS.experiment.isEntryEmpty()) {
    psychoJS.experiment.nextEntry();
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  psychoJS.window.close();
  psychoJS.quit({message: message, isCompleted: isCompleted});
  
  return Scheduler.Event.QUIT;
}
