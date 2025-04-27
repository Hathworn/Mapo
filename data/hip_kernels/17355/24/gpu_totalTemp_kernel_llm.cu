#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_totalTemp_kernel(int N, double *partialT, double *totalT)
{
    extern __shared__ double T_cache[];
    int tid = threadIdx.x;
    
    // Load data into shared memory efficiently
    T_cache[tid] = (tid < N) ? partialT[tid] : 0.0;
    __syncthreads();
    
    int nTotalThreads = blockDim.x;
    
    // Optimize reduction with loop unrolling; process multiple elements per thread
    for (int stride = nTotalThreads / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            T_cache[tid] += T_cache[tid + stride];
        }
        __syncthreads();
    }
    
    // Only the first thread in block computes and writes the total temperature
    if (tid == 0) {
        double T = T_cache[0];
        T /= (kb * dim * N);  // Compute instantaneous temperature using the Equipartition Theorem
        *totalT = T;
    }
}