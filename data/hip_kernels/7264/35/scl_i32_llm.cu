#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scl_i32 (int* __restrict__ vector, int value, int* __restrict__ output, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < len) {
        // Use registers for intermediate calculations
        int temp = vector[idx];
        output[idx] = temp * value;
    }
}