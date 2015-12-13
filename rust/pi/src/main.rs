extern crate rand;

use rand::distributions::{IndependentSample, Range};

fn montecarlopi(n: u32) -> f32 {
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

fn main() {
   let between = Range::new(-1f32, 1.);
   let mut rng = rand::thread_rng();

   let total = 1_000_000;
   let mut in_circle = 0;

   for _ in 0..total {
       let a = between.ind_sample(&mut rng);
       let b = between.ind_sample(&mut rng);
       if a*a + b*b <= 1. {
           in_circle += 1;
       }
   }

   // prints something close to 3.14159...
   println!("{}", montecarlopi(100000000));
}
