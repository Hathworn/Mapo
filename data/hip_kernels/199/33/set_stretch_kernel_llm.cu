#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_stretch_kernel(int samps, float mean, float *d_input) {
    // Calculate global thread index
    int t = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within the valid range
    if (t < samps) {
        d_input[t] = mean; // Set value at the valid index
    }
}