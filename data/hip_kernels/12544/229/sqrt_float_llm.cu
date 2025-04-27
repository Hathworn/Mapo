#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized Kernel Function with Improved Memory Access Pattern
__global__ void sqrt_float(int n, int idx, float *dy, int incy, float *result) {
    // Use shared memory when applicable
    extern __shared__ float shared_dy[];

    int thread_id = threadIdx.x + blockIdx.x * blockDim.x;

    if (thread_id < n) {
        // Only load relevant data into shared memory
        if (thread_id >= idx && thread_id % incy == 0) {
            shared_dy[threadIdx.x] = dy[thread_id];
            __syncthreads();

            // Perform computation using shared memory
            result[thread_id] = sqrtf(shared_dy[threadIdx.x]);
        }
    }
}