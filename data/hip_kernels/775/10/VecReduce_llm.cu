#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecReduce(float* g_idata, float* g_odata, int N)
{
    // shared memory size declared at kernel launch
    extern __shared__ float sdata[];

    // Load thread and global indices
    unsigned int tid = threadIdx.x;
    unsigned int globalid = blockIdx.x * blockDim.x + tid;

    // For thread ids greater than data space
    if (globalid < N) {
        sdata[tid] = g_idata[globalid];
    } else {
        sdata[tid] = 0;  // Case of extra threads above N
    }

    // Each thread loads one element from global to shared mem
    __syncthreads();

    // Do reduction in shared mem
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write result for this block to global mem
    if (tid == 0) {
        g_odata[blockIdx.x] = sdata[0];
    }
}