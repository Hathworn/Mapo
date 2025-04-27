#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setValue(float *data, int idx, float value) {
    // Use a block-level check for setting value to prevent warp divergence
    if (blockIdx.x == 0 && threadIdx.x == 0) {
        data[idx] = value;
    }
}