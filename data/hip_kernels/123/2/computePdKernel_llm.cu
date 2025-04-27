#include "hip/hip_runtime.h"
#include "includes.h"
__device__ void sumByReduction(volatile double* sdata, double mySum, const unsigned int tid)
{
    sdata[tid] = mySum;
    __syncthreads();

    // Optimize reduction with less synchronization
    if (tid < 128) sdata[tid] += sdata[tid + 128];
    __syncthreads();
    if (tid < 64) sdata[tid] += sdata[tid + 64];
    __syncthreads();

    if (tid < 32)
    {
        // Loop unrolling for last warp
        if (tid < 32) sdata[tid] += sdata[tid + 32];
        if (tid < 16) sdata[tid] += sdata[tid + 16];
        if (tid < 8) sdata[tid] += sdata[tid + 8];
        if (tid < 4) sdata[tid] += sdata[tid + 4];
        if (tid < 2) sdata[tid] += sdata[tid + 2];
        if (tid < 1) sdata[tid] += sdata[tid + 1];
    }
}

__global__ void computePdKernel(double* particle_pd, int particles_per_feature, int n_features, double* feature_pd)
{
    __shared__ double shmem[256];
    for (int n = blockIdx.x; n < n_features; n += gridDim.x)
    {
        int offset = n * particles_per_feature;
        double val = 0;
        // Coalesced access by using a stride
        for (int i = offset + threadIdx.x; i < offset + particles_per_feature; i += blockDim.x)
        {
            val += particle_pd[i];
        }
        
        sumByReduction(shmem, val, threadIdx.x);

        // Write the result from thread 0
        if (threadIdx.x == 0)
            feature_pd[n] = shmem[0] / particles_per_feature;
            
        __syncthreads();
    }
}