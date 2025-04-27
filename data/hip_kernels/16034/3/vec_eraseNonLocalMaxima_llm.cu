#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_eraseNonLocalMaxima(int n, float *input, int *localMaxima)
{
    // Use shared memory to reduce global memory accesses
    __shared__ int sharedLocalMaxima[1024];
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int idy = threadIdx.y + blockIdx.y * blockDim.y;
    int id = idy * gridDim.x * blockDim.x + idx;

    // Ensure threads do not process out-of-range elements
    if (id < n) {
        sharedLocalMaxima[threadIdx.x] = localMaxima[id];
        __syncthreads();

        // Use shared memory in condition check
        if (sharedLocalMaxima[threadIdx.x] == 0) {
            input[id] = -1;
        }
    }
}