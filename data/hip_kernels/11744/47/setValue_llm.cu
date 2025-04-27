#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setValue(float *data, int idx, float value) {
    // Use blockIdx.x to set value, avoiding warp divergence
    if(threadIdx.x + blockIdx.x * blockDim.x == idx) {
        data[idx] = value;
    }
}