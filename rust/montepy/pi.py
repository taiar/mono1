from ctypes import cdll
import ctypes

lib = cdll.LoadLibrary("target/release/libmontepi.so")

montecarlopi = lib.montecarlopi
montecarlopi.restype = ctypes.c_float
print montecarlopi(100000000)

print("done!")
