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
      this.map.resize();
      return this.map.draw();
    };

    return TowerLines;

  })();

}).call(this);
