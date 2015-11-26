S.configAll({
  "defaultToCurrentScreen" : true,
  "checkDefaultsOnLoad" : true,
  "orderScreensLeftToRight" : false
});

function bindAll() {
  /*
   * Quick app switching and launching
   * hyper + key to launch app or switch to it.
   * Use Karabiner to create hyper key, I use holding ';'.
   */
  bindQuickSwitch({
    "a:hyper" : "Atom",
    "c:hyper" : "Google Chrome",
    "f:hyper" : "Firefox",
    "i:hyper" : "iTerm",
    "e:hyper" : "Emacs",
    "m:hyper" : "Messages",
    "s:hyper" : "Safari",
    "z:hyper" : "Slack"
  });

  /*
   * Size and move windows
   * Press binding twice to toggle between screens
   */
  bindWindowSizes({
    "i:ctrl,cmd"        : "fullscreen",
    "h:ctrl,cmd"        : "left",
    "k:ctrl,cmd"        : "top",
    "l:ctrl,cmd"        : "right",
    "j:ctrl,cmd"        : "bottom",
    "l:ctrl,cmd,shift"  : "rightThird",
    "h:ctrl,cmd,shift"  : "leftTwoThirds"
  });

  /*
   * Miscellaneous bindings
   */
  S.bindAll({
    "`:ctrl" : S.op("relaunch")
  });
}

var fullscreen = {
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
};

var windowSizes = createWindowSizes(fullscreen, {
  "fullscreen" : {},
  "left" : { "width" : "screenSizeX / 2" },
  "topLeft" : {
    "width" : "screenSizeX / 2",
    "height" : "screenSizeY / 2"
  },
  "top" : { "height" : "screenSizeY / 2" },
  "topRight" : {
    "x" : "screenOriginX + screenSizeX / 2",
    "width" : "screenSizeX / 2",
    "height" : "screenSizeY / 2"
  },
  "right" : {
    "x" : "screenOriginX + screenSizeX / 2",
    "width" : "screenSizeX / 2"
  },
  "bottomRight" : {
    "x" : "screenOriginX + screenSizeX / 2",
    "y" : "screenOriginY + screenSizeY / 2",
    "width" : "screenSizeX / 2",
    "height" : "screenSizeY / 2"
  },
  "bottom" : {
    "y" : "screenOriginY + screenSizeY / 2",
    "height" : "screenSizeY / 2"
  },
  "bottomLeft" : {
    "y" : "screenOriginY + screenSizeY / 2",
    "width" : "screenSizeX / 2",
    "height" : "screenSizeY / 2"
  },
  "rightThird" : {
    "x" : "screenOriginX + screenSizeX * 7 / 12",
    "width" : "screenSizeX * 5 / 12"
  },
  "leftTwoThirds" : { "width" : "screenSizeX * 7 / 12" },
  "middleHalf" : {
    "x" : "screenOriginX + screenSizeX / 4",
    "width" : "screenSizeX / 2"
  },
});

var harvestTasks = {
  "Tch" : {
    "project_id" : "",
    "task_id" : ""
  }
}

function bindWindowSizes(bindings) {
  _.each(bindings, function(size, key) {
    key = expandModifiers(key);
    S.bind(key, function(win) {
      if (!win) return false;

      var origRect = win.rect();
      var move = S.op("move", windowSizes[size]);

      win.doOperation(move);

      if (rectEq(origRect, win.rect())) {
        move = move.dup({ "screen" : "next" });
        win.doOperation(move);
      }
    });
  });
};

function bindQuickSwitch(bindings) {
  _.each(bindings, function(app, key) {
    var appPath = "'/Applications/" + app + ".app'"
    key = expandModifiers(key);

    S.bind(key, function() {
      S.op("focus", { "app" : app }).run() ||
        S.shell("/usr/bin/open " + appPath);
    });
  });
}

/*
 * Utility functions
 */
function rectEq(a, b) {
  return a.x === b.x &&
    a.y === b.y &&
    a.width === b.width &&
    a.height === b.height;
}

// Merge each size into the fullscreen size provided
function createWindowSizes(fullscreen, sizes) {
  windowSizes = {};

  _.each(sizes, function(size, name) {
    windowSizes[name] = _.extend({}, fullscreen, size);
  });

  return windowSizes;
}

function expandModifiers(bind) {
  return bind
    .replace("hyper", "ctrl,cmd,alt,shift")
    .replace("super", "ctrl,cmd,alt");
}

bindAll();
