from ctypes import cdll
import ctypes

lib = cdll.LoadLibrary("target/release/libmontepi.so")

print lib.montecarlopi(1000000)

print("done!")
