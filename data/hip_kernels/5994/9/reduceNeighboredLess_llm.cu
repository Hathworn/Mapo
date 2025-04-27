#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceNeighboredLess(int *g_idata, int *g_odata, unsigned int n) {
    // Thread id
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Data pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x;
    // Thread id out of range
    if (threadIdx.x >= n) return;

    // Ensure the loop doesn't iterate unnecessarily
    for (int stride = 1; stride < blockDim.x / 2; stride *= 2) {
        // First data index of this thread
        int index = 2 * idx * stride;
        // Data add
        if (index + stride < blockDim.x) {
            idata[index] += idata[index + stride];
        }
        __syncthreads();  // Ensure all operations are complete before moving to the next stride
    }

    // Store the result in the output array
    if (threadIdx.x == 0) {
        g_odata[blockIdx.x] = idata[0];
    }
}