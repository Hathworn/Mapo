#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel( int *a, int *b, int *c ) {

    // Calculate thread index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure idx is within bounds
    if (idx < N) {

        // Pre-calculate boundary indices
        int idx1 = idx + 1;
        int idx2 = idx + 2;

        // Use shared memory to reduce global memory accesses
        __shared__ int shared_a[256];
        __shared__ int shared_b[256];

        shared_a[threadIdx.x] = a[idx];
        shared_b[threadIdx.x] = b[idx];

        // Ensure boundary conditions
        if (threadIdx.x == blockDim.x - 1) {
            shared_a[(threadIdx.x + 1) % 256] = a[idx1 % N];
            shared_b[(threadIdx.x + 1) % 256] = b[idx1 % N];
            shared_a[(threadIdx.x + 2) % 256] = a[idx2 % N];
            shared_b[(threadIdx.x + 2) % 256] = b[idx2 % N];
        }

        __syncthreads();

        // Compute average using preloaded shared memory
        float as = (shared_a[threadIdx.x] + shared_a[(threadIdx.x + 1) % 256] + shared_a[(threadIdx.x + 2) % 256]) / 3.0f;
        float bs = (shared_b[threadIdx.x] + shared_b[(threadIdx.x + 1) % 256] + shared_b[(threadIdx.x + 2) % 256]) / 3.0f;
        
        // Store result in global memory
        c[idx] = (as + bs) / 2;
    }
}