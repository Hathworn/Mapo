#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(int *a, int *b, int *c) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Optimize by checking if index is within bounds before calculations
    if (idx < N) {
        int idx1 = (idx + 1) % 256;
        int idx2 = (idx + 2) % 256;

        // Optimize memory accesses with shared memory for frequently accessed data
        __shared__ float shared_a[256];
        __shared__ float shared_b[256];
        
        shared_a[threadIdx.x] = a[idx];
        shared_b[threadIdx.x] = b[idx];
        
        __syncthreads(); // Ensure all threads have completed memory copy to shared
        
        float as = (shared_a[threadIdx.x] + shared_a[idx1] + shared_a[idx2]) / 3.0f;
        float bs = (shared_b[threadIdx.x] + shared_b[idx1] + shared_b[idx2]) / 3.0f;
        
        c[idx] = (as + bs) / 2;
    }
}