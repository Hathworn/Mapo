#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mini1(int *a,int *b,int n)
{
    // Use shared memory for partial results
    __shared__ int shared_min[256];

    int idx = threadIdx.x;
    int globalIdx = blockIdx.x * 256 + idx;

    // Initialize shared memory
    shared_min[idx] = INT_MAX;

    // Load data into shared memory if within bounds
    if (globalIdx < n) {
        shared_min[idx] = a[globalIdx];
    }
    __syncthreads();

    // Perform parallel reduction in shared memory
    for (int stride = 128; stride > 0; stride /= 2) {
        if (idx < stride && (idx + stride) < 256) {
            shared_min[idx] = min(shared_min[idx], shared_min[idx + stride]);
        }
        __syncthreads();
    }

    // Write the result for this block to global memory
    if (idx == 0) {
        b[blockIdx.x] = shared_min[0];
    }
}