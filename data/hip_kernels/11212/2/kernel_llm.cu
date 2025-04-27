#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel( int *a, int *b, int *c ) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < N) {
        // Use shared memory to reduce global memory accesses
        __shared__ int shared_a[256];
        __shared__ int shared_b[256];

        shared_a[threadIdx.x] = a[idx];
        shared_b[threadIdx.x] = b[idx];

        __syncthreads();

        int idx1 = (threadIdx.x + 1) % 256;
        int idx2 = (threadIdx.x + 2) % 256;
        
        float as = (shared_a[threadIdx.x] + shared_a[idx1] + shared_a[idx2]) / 3.0f;
        float bs = (shared_b[threadIdx.x] + shared_b[idx1] + shared_b[idx2]) / 3.0f;

        // Eliminate repeated divisions to improve performance
        c[idx] = (as + bs) * 0.5f;
    }
}