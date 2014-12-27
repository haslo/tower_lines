// Generated by CoffeeScript 1.8.0
(function() {


}).call(this);
// Generated by CoffeeScript 1.8.0
(function() {
  var Sprite,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Sprite = (function() {
    function Sprite() {}

    Sprite.prototype.moveTo = function(map, x, y) {
      var coords;
      coords = map.mapCoords(x + this.x, y + this.y);
      return map.getGraphics().moveTo(coords[0], coords[1]);
    };

    Sprite.prototype.lineTo = function(map, x, y) {
      var coords;
      coords = map.mapCoords(x + this.x, y + this.y);
      return map.getGraphics().lineTo(coords[0], coords[1]);
    };

    return Sprite;

  })();

  this.TowerSprite = (function(_super) {
    __extends(TowerSprite, _super);

    function TowerSprite(x, y) {
      this.x = x;
      this.y = y;
    }

    TowerSprite.prototype.draw = function(map) {
      var color, scale;
      scale = map.calculateScale();
      color = 0x0000ff;
      map.getGraphics().lineStyle(2, color, 1);
      map.getGraphics().beginFill(color, 0.4);
      this.moveTo(map, 10, 10);
      this.lineTo(map, -10, 10);
      this.lineTo(map, -8, -5);
      this.lineTo(map, -8, -10);
      this.lineTo(map, 8, -10);
      this.lineTo(map, 8, -5);
      this.lineTo(map, 10, 10);
      return map.getGraphics().endFill();
    };

    return TowerSprite;

  })(Sprite);

}).call(this);
// Generated by CoffeeScript 1.8.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  this.Map = (function() {
    function Map(game, borderColor, width, height) {
      this.game = game;
      this.borderColor = borderColor;
      this.width = width;
      this.height = height;
      this.aspectRatio = this.width / this.height;
      this.offset = 5;
    }

    Map.prototype.update = function() {
      return $.noop;
    };

    Map.prototype.getGraphics = function() {
      return this.graphics;
    };

    Map.prototype.drawBorder = function() {
      this.graphics || (this.graphics = this.game.add.graphics(0, 0));
      this.graphics.lineStyle(4, this.borderColor, 1);
      this.graphics.beginFill(this.borderColor, 0.1);
      this.graphics.moveTo(this.translateXCoord(this.width, this.height, this.offset), this.translateYCoord(this.width, this.height, this.offset));
      this.graphics.lineTo(this.translateXCoord(this.width, this.height, this.width - this.offset), this.translateYCoord(this.width, this.height, this.offset));
      this.graphics.lineTo(this.translateXCoord(this.width, this.height, this.width - this.offset), this.translateYCoord(this.width, this.height, this.height - this.offset));
      this.graphics.lineTo(this.translateXCoord(this.width, this.height, this.offset), this.translateYCoord(this.width, this.height, this.height - this.offset));
      this.graphics.lineTo(this.translateXCoord(this.width, this.height, this.offset), this.translateYCoord(this.width, this.height, this.offset));
      return this.graphics.endFill();
    };

    Map.prototype.clear = function() {
      if (this.graphics !== void 0) {
        return this.graphics.clear();
      }
    };

    Map.prototype.fitSizeIntoCoords = function(width, height) {
      return [this.translateXCoord(width, height, 0), this.translateYCoord(width, height, 0), this.translateXCoord(width, height, width), this.translateYCoord(width, height, height)];
    };

    Map.prototype.translateXCoord = function(width, height, coord) {
      var desiredWidth;
      desiredWidth = height * this.aspectRatio;
      return (coord - ((width - desiredWidth) / 2)) * this.calculateScale();
    };

    Map.prototype.translateYCoord = function(width, height, coord) {
      var desiredHeight;
      desiredHeight = width / this.aspectRatio;
      console.log([coord, width, height, desiredHeight]);
      return (coord - ((height - desiredHeight) / 2)) * this.calculateScale();
    };

    Map.prototype.calculateScale = function() {
      var actualAspectRatio, height, width;
      width = this.game.width / (this.game.width > this.game.height ? 2 : 1);
      height = this.game.height;
      actualAspectRatio = width / height;
      if (actualAspectRatio > this.aspectRatio) {
        return height / this.height;
      } else {
        return width / this.width;
      }
    };

    return Map;

  })();

  this.DefaultMap = (function(_super) {
    __extends(DefaultMap, _super);

    function DefaultMap(game) {
      DefaultMap.__super__.constructor.call(this, game, 0xff0000, 200, 300);
    }

    DefaultMap.prototype.draw = function() {
      this.clear();
      return this.drawBorder();
    };

    return DefaultMap;

  })(Map);

}).call(this);
// Generated by CoffeeScript 1.8.0
(function() {
  this.Tower = (function() {
    function Tower() {}

    Tower.prototype.update = function() {
      return $.noop;
    };

    return Tower;

  })();

  this.DefaultTower = (function() {
    function DefaultTower(x, y) {
      this.x = x;
      this.y = y;
    }

    DefaultTower.prototype.draw = function(map) {
      return new TowerSprite(x, y).draw(map);
    };

    return DefaultTower;

  })();

}).call(this);
// Generated by CoffeeScript 1.8.0
(function() {
  this.Mob = (function() {
    function Mob() {}

    Mob.prototype.update = function() {
      return $.noop;
    };

    return Mob;

  })();

}).call(this);
// Generated by CoffeeScript 1.8.0
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.TowerLines = (function() {
    function TowerLines() {
      this.resizeGame = __bind(this.resizeGame, this);
      this.createListener = __bind(this.createListener, this);
      this.onDeviceReady = __bind(this.onDeviceReady, this);
    }

    TowerLines.prototype.initialize = function() {
      return this.bindEvents(this);
    };

    TowerLines.prototype.bindEvents = function() {
      return document.addEventListener('deviceready', this.onDeviceReady, false);
    };

    TowerLines.prototype.onDeviceReady = function() {
      var height, listeners, width;
      width = document.body.offsetWidth;
      height = Math.max($(document).height(), $(window).height());
      listeners = {
        create: this.createListener
      };
      this.game = new Phaser.Game(width, height, Phaser.AUTO, '', listeners);
      return $(window).resize((function(_this) {
        return function() {
          return _this.resizeGame(_this);
        };
      })(this));
    };

    TowerLines.prototype.createListener = function() {
      console.log('listening');
      this.map || (this.map = new DefaultMap(this.game));
      return this.map.draw();
    };

    TowerLines.prototype.resizeGame = function() {
      var height, width;
      height = $(window).height();
      width = $(window).width();
      this.game.width = width;
      this.game.height = height;
      this.game.stage.bounds.width = width;
      this.game.stage.bounds.height = height;
      if (this.game.renderType === Phaser.WEBGL) {
        this.game.renderer.resize(width, height);
      }
      return this.map.draw();
    };

    return TowerLines;

  })();

}).call(this);
