#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecAdd(int n, const float *A, const float *B, float* C) {
    // Calculate global thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Check if thread index is within bounds
    if (i < n) {
        // Load A and B and compute C
        C[i] = A[i] + B[i];
    }
    
    // Introduce a delay to simulate compute time
    long long start = clock64();
    long long cycles_elapsed;
    do { cycles_elapsed = clock64() - start; } while (cycles_elapsed < 20000);
}