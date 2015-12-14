extern crate rand;

use std::env;
use std::str::FromStr;
use rand::distributions::{IndependentSample, Range};
use std::os::raw;

#[no_mangle]
pub extern fn montecarlopi(n: raw::c_int) -> raw::c_float {
    let between = Range::new(-1., 1.);
    let mut rng = rand::thread_rng();

    let total = n as raw::c_int;
    let mut in_circle = 0 as raw::c_int;

    for _ in 0..total {
        let a = between.ind_sample(&mut rng) as raw::c_float;
        let b = between.ind_sample(&mut rng) as raw::c_float;
        if a*a + b*b <= 1. {
            in_circle += 1;
        }
    }

    println!("{}", (4. * (in_circle as raw::c_float) / (total as raw::c_float) as 
    	raw::c_float));
    (4. * (in_circle as raw::c_float) / (total as raw::c_float) as 
    	raw::c_float)
}