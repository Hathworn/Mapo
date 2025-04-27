#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setValue(float *data, int idx, float value) {
    // Only one thread in the block needs to update the data
    if(blockIdx.x == 0 && threadIdx.x == 0) {
        data[idx] = value;
    }
}