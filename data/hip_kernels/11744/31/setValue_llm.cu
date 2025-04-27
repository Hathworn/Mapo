#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setValue(float *data, int idx, float value) {
    // Only one thread in the block is needed, we should ensure it's executed once per block
    if(blockIdx.x * blockDim.x + threadIdx.x == 0) {
        data[idx] = value;
    }
}