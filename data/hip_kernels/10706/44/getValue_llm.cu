#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getValue(float *outdata, float *indata) {
    // Simplify conditional logic by using ternary operator directly
    *outdata = *indata == 0 ? 3.0f : 2.0f;
}