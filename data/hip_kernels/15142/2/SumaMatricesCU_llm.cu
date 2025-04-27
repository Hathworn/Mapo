#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SumaMatricesCU(int* A, int* B, int* C, int width) {
    // Calculate global index for thread
    int idx = blockIdx.y * blockDim.y * width + blockIdx.x * blockDim.x + threadIdx.y * width + threadIdx.x;
    
    // Ensure index is within matrix bounds
    if (idx < width * width) {
        C[idx] = A[idx] + B[idx]; // Perform addition
    }
}