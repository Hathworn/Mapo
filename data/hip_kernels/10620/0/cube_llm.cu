#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cube(float *d_out, const float *d_in) {
    // Use blockIdx.x to support arrays larger than block size
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure index doesn't exceed the bounds of array
    if (idx < N) { 
        float f = d_in[idx];
        d_out[idx] = f * f * f;
    }
}