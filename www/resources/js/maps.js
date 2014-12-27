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
      return coord * this.calculateScale() + (this.pixelWidth() - width * this.calculateScale()) / 2;
    };

    Map.prototype.translateYCoord = function(width, height, coord) {
      return coord * this.calculateScale() + (this.pixelHeight() - height * this.calculateScale()) / 2;
    };

    Map.prototype.calculateScale = function() {
      var actualAspectRatio;
      actualAspectRatio = this.pixelWidth() / this.pixelHeight();
      if (actualAspectRatio > this.aspectRatio) {
        return this.pixelHeight() / this.height;
      } else {
        return this.pixelWidth() / this.width;
      }
    };

    Map.prototype.pixelWidth = function() {
      if (this.game.width > this.game.height) {
        return this.game.width / 2;
      } else {
        return this.game.width;
      }
    };

    Map.prototype.pixelHeight = function() {
      return this.game.height;
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
