#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void print_float(float* x, int leng) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use conditional branching outside memory access
    if(i < leng) {
        printf("%f,", x[i]);
    }
}