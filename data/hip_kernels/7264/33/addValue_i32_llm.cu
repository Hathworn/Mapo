#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addValue_i32 (int* vector, int value, int* output, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Calculate stride for loop unrolling
    for (int i = idx; i < len; i += stride) { // Loop unrolling for better load balancing
        output[i] = vector[i] + value;
    }
}