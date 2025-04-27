#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceNeighbored(int *g_idata, int *g_odata, unsigned int n) {
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x;

    // Boundary check
    if (idx >= n) return;

    // In-place reduction in shared memory for faster access
    for (int stride = 1; stride < blockDim.x; stride *= 2) {
        // Ensure access is not out of bounds
        if (tid + stride < blockDim.x) {
            if ((tid % (2 * stride)) == 0) {
                idata[tid] += idata[tid + stride];
            }
        }
        // Synchronize within threadblock
        __syncthreads();
    }

    // Write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}