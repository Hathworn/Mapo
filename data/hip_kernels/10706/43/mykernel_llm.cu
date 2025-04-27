#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mykernel(float *d1, float *d2, float *d3, float *d4, float *d5) {
    // Use thread 0 in block 0 to perform initialization once
    if(blockIdx.x == 0 && threadIdx.x == 0) {
        float val = 123.0f; // Assign the value once to reduce redundant operations
        d1[0] = val;
        d2[0] = val;
        d3[0] = val;
        d4[0] = val;
        d5[0] = val;
    }
}