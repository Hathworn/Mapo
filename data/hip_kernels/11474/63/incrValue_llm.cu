#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void incrValue(float *data, int idx, float value) {
    // Single thread in the grid performs the increment operation for efficiency
    if (blockIdx.x * blockDim.x + threadIdx.x == 0) {
        data[idx] += value;
    }
}