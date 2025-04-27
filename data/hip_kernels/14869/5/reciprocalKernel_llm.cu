#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reciprocalKernel(float *data, unsigned vectorSize) {
    unsigned idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < vectorSize) {
        float val = data[idx];
        // Avoid division if the value is zero to prevent division by zero
        if (val != 0.0) {
            data[idx] = 1.0 / val;
        }
    }
}