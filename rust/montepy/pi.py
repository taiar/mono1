from ctypes import cdll

lib = cdll.LoadLibrary("target/release/libmontepi.so")

print lib.montecarlopi(100000000)

print("done!")
