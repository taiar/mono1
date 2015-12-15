var ffi = require('ffi');

var pipi = ffi.Library('./target/release/libmontepi.so', {
    'montecarlopi': ['float', ['int']]
});

console.log(pipi.montecarlopi(100000000));