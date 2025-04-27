#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setValue(float *data, int idx, float value) {
    // Use blockIdx.x and blockDim.x for control instead of checking threadIdx.x for efficiency
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if(tid == 0) {
        data[idx] = value;
    }
}