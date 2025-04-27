#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void setValue(float *data, int idx, float value) {
    data[idx] = value;
}

__device__ float bar(float a, float b) {
    return a + b;
}

__global__ void setValueOptimized(float *data, int idx, float value) {
    // Eliminate unnecessary thread check by using a single thread block
    if (blockIdx.x == 0 && threadIdx.x == 0) {
        setValue(data, idx, value);
    }
}