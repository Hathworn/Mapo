#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_stretch_kernel(int samps, float mean, float *d_input) {
    int t = blockIdx.x * blockDim.x + threadIdx.x;

    // Removed unnecessary check for non-negative index
    if (t < samps) 
        d_input[t] = mean;
}