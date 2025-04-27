#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square(float* d_out, float* d_in) {
    // Compute the global index of the thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Compute squared value only if global index is within bounds
    if (idx < N) {
        float f = d_in[idx];
        d_out[idx] = f * f;
    }
}