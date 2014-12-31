// Generated by CoffeeScript 1.8.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  this.Tower = (function() {
    function Tower(index) {
      this.index = index;
    }

    Tower.prototype.index = function() {
      return this.index;
    };

    Tower.prototype.setCoords = function(x, y) {
      this.x = x;
      return this.y = y;
    };

    return Tower;

  })();

  this.DefaultTower = (function(_super) {
    __extends(DefaultTower, _super);

    function DefaultTower() {
      return DefaultTower.__super__.constructor.apply(this, arguments);
    }

    DefaultTower.prototype.draw = function(map, graphics) {
      return new DefaultTowerSprite(this.x, this.y).draw(map, graphics);
    };

    return DefaultTower;

  })(Tower);

}).call(this);
