#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AddIntsCUDA(int* a, int* b) {
    // Use shared memory for faster access
    __shared__ int temp_a;
    __shared__ int temp_b;
    
    // Load data into shared memory
    if (threadIdx.x == 0) {
        temp_a = a[0];
        temp_b = b[0];
    }
    __syncthreads();

    // Use a single thread to perform addition and avoid redundant global memory access
    if (threadIdx.x == 0) {
        for (int i = 0; i < 1000005; i++) {
            temp_a += temp_b;
        }
    }
    __syncthreads();

    // Write result back to global memory
    if (threadIdx.x == 0) {
        a[0] = temp_a;
    }
}