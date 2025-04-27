#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize setValue kernel function to avoid warp divergence
__global__ void setValue(float *data, int idx, float value) {
    // Use a single thread to set the value, avoiding unnecessary conditional
    if(blockIdx.x == 0 && threadIdx.x == 0) {
        data[idx] = value;
    }
}