#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void applyLinearFunction(int size, const short *x, short *y, short a, short b) {
    // Use an unsigned int for faster integer arithmetic operations
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    // Prefetch input element to reduce memory latency
    if (ix < size) {
        short xVal = x[ix];
        y[ix] = a + b * xVal;
    }
}