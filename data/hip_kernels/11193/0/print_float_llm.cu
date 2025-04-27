#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void print_float(float* x, int leng) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure valid index and remove redundant array access
    if (i < leng) {
        float value = x[i];  // Cache value to reduce global memory access
        printf("%f,", value); // Print cached value
    }
}