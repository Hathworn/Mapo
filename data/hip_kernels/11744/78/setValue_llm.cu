#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setValue(float *data, int idx, float value) {
    // Use blockIdx.x to allow setting multiple values in parallel
    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x; // Compute global index
    if(globalIdx == idx) {
        data[idx] = value;
    }
}