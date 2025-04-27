#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_i32(int* __restrict__ vector, int* __restrict__ output, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < len) {
        // Use register memory for computation, restrict pointers for optimization
        int val = vector[idx];
        output[idx] = val * val;
    }
}