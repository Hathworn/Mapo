#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setValue(float *data, int idx, float value) {
    // Use block-based indexing to assign value
    if(blockIdx.x == 0 && threadIdx.x == 0) {
        data[idx] = value;
    }
}