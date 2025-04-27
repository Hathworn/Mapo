#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd(float *in1, float *in2, float *out, int len) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
  
    // Ensure thread index is within bounds
    if (idx < len) {
        // Perform vector addition
        out[idx] = in1[idx] + in2[idx];
    }
}