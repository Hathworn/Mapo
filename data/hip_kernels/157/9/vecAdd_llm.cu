#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd(float * in1, float * in2, float * out, int len) {
    // Calculate the global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Perform vector addition if index is within bounds
    if (idx < len) {
        out[idx] = in1[idx] + in2[idx];
    }
}