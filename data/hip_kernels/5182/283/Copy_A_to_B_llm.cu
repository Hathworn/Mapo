#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Copy_A_to_B(float* A, float* B, int size) {
    int id = blockDim.x * (blockIdx.x + blockIdx.y * gridDim.x) + threadIdx.x; // Simplified ID calculation
    if (id < size) {
        B[id] = A[id]; // Direct assignment
    }
}