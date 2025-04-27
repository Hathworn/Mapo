#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for matrix multiplication by a constant
__global__ void matrix_multiply_by_const(const float *d_input, float *d_output, float val, int n) {
    // Calculate the global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Process multiple elements per thread to optimize memory access and computation
    int stride = gridDim.x * blockDim.x;
    for (int i = index; i < n; i += stride) {
        d_output[i] = d_input[i] * val;
    }
}