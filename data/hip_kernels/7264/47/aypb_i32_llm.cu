#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void aypb_i32 (int a, int* y, int b, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate the global thread index
    if (idx >= len) return; // Early exit if index is out of bounds

    // Perform the operation only for valid indices
    y[idx] = a * y[idx] + b; 
}