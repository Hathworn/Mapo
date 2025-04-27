#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Scale_Optimized(float *a, float *b, float scale, size_t len)
{
    // Use shared memory to improve memory access efficiency
    extern __shared__ float shared_a[];

    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    size_t tid = threadIdx.x;

    // Boundary check to prevent out-of-bounds access
    if (idx < len) {
        // Load data into shared memory
        shared_a[tid] = a[idx];
        __syncthreads();

        // Perform operation using shared memory
        b[idx] = scale * shared_a[tid];
    }
}