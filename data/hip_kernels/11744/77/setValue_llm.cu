#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel function by removing condition and using block-level synchronization
__global__ void setValue(float *data, int idx, float value) {
    if(blockIdx.x * blockDim.x + threadIdx.x == idx) {
        data[idx] = value;
    }
}