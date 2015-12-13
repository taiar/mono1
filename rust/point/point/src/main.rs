use std::f32;

struct Point {
    x: f32,
    y: f32,
}

impl Point {
	fn distanceFromO(&self) -> f32 {
		f32::sqrt(self.x * self.x + self.y * self.y)
	}
}

fn main() {
    let point = Point { x: 3f32, y: 4f32 }; 
    println!("The distance of the origin is ({})", point.distanceFromO(), );
}