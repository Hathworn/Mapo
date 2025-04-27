#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cube(float * d_out, float * d_in) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread index
    if(i < 96) {
        float val = d_in[i];
        d_out[i] = val * val * val;  // Compute cube using temporary variable
    }
}