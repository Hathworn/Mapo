#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_fill(float4* d_dx1, float val, int numel) {
    size_t col = threadIdx.x + blockIdx.x * blockDim.x;
    if (col < numel) { // Moved return logic to if condition for clarity
        float4 fillVal = {val, val, val, val}; // Precompute fill value
        d_dx1[col] = fillVal; // Assign fill value directly
    }
}