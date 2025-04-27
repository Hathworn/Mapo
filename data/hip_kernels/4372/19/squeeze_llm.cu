#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel launch configuration using stride loop
__global__ void squeeze(float *B, int dim, int length, float L, float M) {
    int index = (blockIdx.x * blockDim.x) + threadIdx.x + length;
    int stride = gridDim.x * blockDim.x; // Calculate stride for loop unrolling
    while (index < length + dim) { // Use loop to calculate multiple elements per thread
        B[index] = 1 / (1 + expf(-L * (B[index] - M)));
        index += stride; // Increment index by stride
    }
}