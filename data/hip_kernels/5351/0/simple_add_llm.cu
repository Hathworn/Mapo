#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize memory access by using shared memory, and handle uncoalesced access
__global__ void simple_add(float* a, float* b, int n) {
    extern __shared__ float shared_b[];

    int tid = threadIdx.x;
    int i = blockIdx.x * blockDim.x + tid;

    // Load b into shared memory
    if (i < n) {
        shared_b[tid] = b[i];
        __syncthreads();

        // Perform addition using shared memory
        a[i] += shared_b[tid];
    }
}