extern crate rand;

use rand::Rng;

static N: u32 = 6;
static ITERS: u32 = 1000;

fn convolve<T>(into: &mut [T], a: &[T], b: &[T]) {
    // we want `a` to be the longest array
    if a.len() < b.len() {
        convolve(into, b, a);
        return
    }

    assert_eq!(into.len(), a.len() - b.len() + 1);

    for (n,place) in into.mut_iter().enumerate() {
        for (x, y) in a.slice_from(n).iter().zip(b.iter()) {
            *place = *place + *x * *y
        }
    }
}

fn main() {
    let mut first_zero = 0;
    let mut both_zero = 0;
    let mut rng = rand::XorShiftRng::new().unwrap();

    for s in PlusMinus::new() {
        for _ in rand::thread_rng().gen_range(0, ITERS) {
            let mut f = [0, .. N];
            while f.iter().all(|x| *x == 0) {
                for p in f.mut_iter() {
                    match rng.gen::<u32>() % 4 {
                        0 => *p = -1,
                        1 | 2 => *p = 0,
                        _ => *p = 1
                    }
                }
            }

            let mut fs = [0, .. 2];
            convolve(fs, s, f);

            if fs[0] == 0 { first_zero += 1 }
            if fs.iter().all(|&x| x == 0) { both_zero += 1 }
        }
    }

    println!("{}\n{}", first_zero, both_zero);
}



/// An iterator over [+-]1 arrays of the appropriate length
struct PlusMinus {
    done: bool,
    current: [i32; ..5]
}
impl PlusMinus {
    fn new() -> PlusMinus {
        PlusMinus { done: false, current: [-1, .. N + 1] }
    }
}

impl Iterator<[i32; .. N + 1]> for PlusMinus {
    fn next(&mut self) -> Option<[i32; .. N+1]> {
        if self.done {
            return None
        }

        let ret = self.current;

        // a binary "adder", that just adds one to a bit vector (where
        // -1 is the zero, and 1 is the one).
        for (i, place) in self.current.mut_iter().enumerate() {
            *place = -*place;
            if *place == 1 {
                break
            } else if i == N {
                // we've wrapped, so we want to stop after this one
                self.done = true
            }
        }

        Some(ret)
    }
}
