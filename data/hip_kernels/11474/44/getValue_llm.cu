#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void getValue(float *outdata, float *indata) {
    // Use ternary operator with conditional memory operations
    outdata[0] = (*indata == 0.0f) ? 3.0f : 2.0f;
}