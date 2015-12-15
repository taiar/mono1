extern crate rand;

use std::env;
use std::str::FromStr;
use rand::distributions::{IndependentSample, Range};

#[no_mangle]
pub extern fn montecarlopi(n: u32) -> f32 {
    let between = Range::new(-1f32, 1.);
    let mut rng = rand::thread_rng();

    let total = n;
    let mut in_circle = 0;

    for _ in 0..total {
        let a = between.ind_sample(&mut rng);
        let b = between.ind_sample(&mut rng);
        if a*a + b*b <= 1. {
            in_circle += 1;
        }
    }
    4. * (in_circle as f32) / (total as f32)
}