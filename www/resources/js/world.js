// Generated by CoffeeScript 1.8.0
(function() {
  this.World = (function() {
    function World(map) {
      this.map = map;
      this.towers = [];
      this.mobs = [];
    }

    World.prototype.add = function(item) {
      if (item instanceof Map) {
        this.map = item;
      }
      if (item instanceof Tower) {
        this.map.initTower(item, item.index);
        this.towers.push(item);
      }
      if (item instanceof Mob) {
        this.map.initMob(item, item.index);
        return this.mobs.push(item);
      }
    };

    World.prototype.update = function() {
      var map;
      map = this.map;
      map.update();
      $.each(this.towers, function(_, tower) {
        return tower.update(map);
      });
      return $.each(this.mobs, function(_, mob) {
        return mob.update(map);
      });
    };

    World.prototype.draw = function() {
      var map;
      map = this.map;
      map.draw();
      $.each(this.towers, function(_, tower) {
        return tower.draw(map);
      });
      return $.each(this.mobs, function(_, mob) {
        return mob.draw(map);
      });
    };

    return World;

  })();

}).call(this);
