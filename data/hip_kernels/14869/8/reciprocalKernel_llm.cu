#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reciprocalKernel(float *data, unsigned vectorSize) {
    unsigned idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < vectorSize) {
        // Use a local variable to optimize memory access
        float val = data[idx];
        data[idx] = 1.0f / val;
    }
}