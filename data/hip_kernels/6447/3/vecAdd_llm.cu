#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd(float* C, float* A, float* B, int n) {
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread is within bounds and perform vector addition
    if (id < n) {
        C[id] = A[id] + B[id];
    }
}