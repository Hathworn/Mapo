#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sub_i32 (int* __restrict__ left_op, int* __restrict__ right_op, int* __restrict__ output, int len) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
  
    // Process only if within bounds
    if (idx < len) {
        // Use registers for local variable storage
        int left_val = left_op[idx];
        int right_val = right_op[idx];
        
        // Perform subtraction
        output[idx] = left_val - right_val;
    }
}