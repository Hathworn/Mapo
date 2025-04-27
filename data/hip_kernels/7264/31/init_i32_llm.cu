#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_i32(int* vector, int value, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Use grid-stride loop for better optimization
    for (int i = idx; i < len; i += stride) {
        vector[i] = value;
    }
}