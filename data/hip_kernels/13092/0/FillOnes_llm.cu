#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FillOnes( float *vec, int size ) {
    // Use a stride loop to handle larger arrays efficiently
    for (int idx = blockIdx.x * blockDim.x + threadIdx.x; idx < size; idx += gridDim.x * blockDim.x) {
        vec[idx] = 1.0f;
    }
}