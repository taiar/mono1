use std::f32;

struct Point {
    x: f32,
    y: f32,
}

impl Point {
	fn squareDistanceFromO(&self) -> f32 {
		(self.x * self.x + self.y * self.y)
	}
}

fn fast_inv_sqrt(x: f32) -> f32 {
    let f: f32 = unsafe {
        let i: i32 = std::mem::transmute(x);
        std::mem::transmute(0x5f3759df - (i >> 1))
    };
     1./(f * (1.5 - 0.5 * x * f * f);)
    (1. / ret)
}

fn main() {
    let point = Point { x: 3f32, y: 4f32 }; 
    println!("The distance of the origin is ({})", fast_inv_sqrt(point.squareDistanceFromO()), );
}