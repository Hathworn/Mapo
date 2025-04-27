#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeSimilarities(const float* nvccResults, int* activelayers, int writestep, int writenum, float* similarities, int active_patches, int patches)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < active_patches)
    {
        float res = nvccResults[tid];
        int patch = activelayers[tid];

        // Use shared memory to optimize global memory access pattern
        __shared__ float sharedRes;
        sharedRes = res;
        __syncthreads();

        for (int i = 0; i < writenum; ++i)
        {
            // Minimize arithmetic operations within the loop
            similarities[(i * writestep * patches) + patch] = sharedRes;
        }
    }
}