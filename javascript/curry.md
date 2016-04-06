# Currying in JavaScript

```javascript
// Adds method to function signature.
Function.prototype.method = function (name, func) {
    if (!this.prototype[name]) {
        this.prototype[name] = func;
        return this;
    }
};

// Adds curry to function signature.
Function.method('curry', function (  ) {
    var slice = Array.prototype.slice,
        args = slice.apply(arguments),
        that = this;
    return function (  ) {
        return that.apply(null, args.concat(slice.apply(arguments)));
    };
});

// example and asserts
var add = function (a, b) {
    return a + b;
};

eq(add(1,1), 2);

var add1 = add.curry(1);
eq(add1(6), 7);

```

Source: JavaScript: The Good Parts.
