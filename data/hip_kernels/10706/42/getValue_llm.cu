#include "hip/hip_runtime.h"
#include "includes.h"

// Simplified kernel function using ternary operator correctly
__global__ void getValue(float *outdata, float *indata) {
    outdata[0] = (*indata == 0.0f) ? 3.0f : 2.0f;
}