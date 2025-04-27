#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vector_add(float *out, float *a, float *b, int n) {
    // Use shared memory for efficient memory access
    __shared__ float shared_a[1024]; // Example size, adjust based on block size
    __shared__ float shared_b[1024]; // Example size, adjust based on block size

    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int local_tid = threadIdx.x;

    // Load array elements into shared memory
    if (tid < n) {
        shared_a[local_tid] = a[tid];
        shared_b[local_tid] = b[tid];
        __syncthreads();  // Ensure complete loading before proceeding

        // Perform addition using shared memory
        out[tid] = shared_a[local_tid] + shared_b[local_tid];
    }
}