#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ElementwiseNorm(float * A, float * B, int size) {
    // Calculate the global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Process multiple elements per thread to improve memory access
    for (int i = id; i < size; i += blockDim.x * gridDim.x) {
        A[i] /= B[i];
    }
}