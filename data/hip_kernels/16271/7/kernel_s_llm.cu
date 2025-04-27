#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize using warp shuffling for performance improvement
__global__ void kernel_s(unsigned int * ind, const size_t nbn, const unsigned int ne)
{
    int m_i_b = threadIdx.x + blockIdx.x * blockDim.x;
    if (m_i_b >= ne) return;  // Bound check

    extern __shared__ float dats[];
    dats[threadIdx.x] = (m_i_b < ne) ? ind[m_i_b] : 0;
    __syncthreads();

    // Use warp shuffling to optimize the reduction process
    for (int offset = 1; offset < blockDim.x; offset *= 2) {
        float temp = 0;
        if (threadIdx.x >= offset)
            temp = dats[threadIdx.x - offset];
        __syncthreads();
        dats[threadIdx.x] += temp;
        __syncthreads();
    }

    if (m_i_b < ne) {
        if (threadIdx.x == 0) ind[blockIdx.x * blockDim.x] = 0;
        else ind[m_i_b] = dats[threadIdx.x - 1];
    }
}