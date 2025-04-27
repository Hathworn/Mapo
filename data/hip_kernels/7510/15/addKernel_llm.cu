#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addKernel(float* A, float* B, float* C, int numberIterations, int size) {

    // Calculate the global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int start = idx * numberIterations;
    
    // Unroll the loop to improve performance
    #pragma unroll
    for (int i = 0; i < numberIterations && start + i < size; ++i) {
        int entryIndex = start + i;
        C[entryIndex] = A[entryIndex] + B[entryIndex];
    }
}