#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Use shared memory to reduce global memory access
    extern __shared__ float shared_s[];

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridStride = gridDim.x * blockDim.x;

    while (i < n) {
        shared_s[threadIdx.x] = s[i];
        __syncthreads(); // Synchronize shared memory between threads

        // Minimize conditional execution within the loop
        c[i] = shared_s[threadIdx.x] * a[i] + (1 - shared_s[threadIdx.x]) * (b ? b[i] : 0);

        i += gridStride; // Advance to the next set of data within the grid stride
    }
}