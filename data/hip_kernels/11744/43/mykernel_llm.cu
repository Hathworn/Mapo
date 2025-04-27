#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mykernel(float *d1, float *d2, float *d3, float *d4, float *d5) {
    // Use blockDim to ensure only one thread executes the conditional
    if(blockIdx.x == 0 && threadIdx.x == 0) {
        // Store constant value in shared variable to reduce redundancy
        const float value = 123.0f;
        d1[0] = value;
        d2[0] = value;
        d3[0] = value;
        d4[0] = value;
        d5[0] = value;
    }
}