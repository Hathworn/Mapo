#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ElementwiseNorm(float * A, float *B, int size) {
    // Calculate a single unique index for the thread.
    int id = blockDim.x * (blockIdx.x + blockIdx.y * gridDim.x) + threadIdx.x;
    
    // Ensure that the index is within bounds and perform the division.
    if (id < size) {
        A[id] /= B[id];
    }
}