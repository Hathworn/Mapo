#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void bf_2flags(int *Na, int *src, int *F1, int *F2, int *exists, int *Sa, int *Ea, int threadsPerBlock )
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Use blockDim.x for threadsPerBlock

    if (exists[id] == 1)
    {
        Na[id] = 65000; // MAX INT Value
        F1[id] = 0;
        F2[id] = 0;

        if (id == *src)
        {   // Starting node conditions
            Na[id] = 0;
            F1[id] = 1;
        }

        // Loop optimizations
        __shared__ int sharedF1[1024]; // Use shared memory for F1
        __shared__ int sharedF2[1024]; // Use shared memory for F2

        sharedF1[threadIdx.x] = F1[id];
        sharedF2[threadIdx.x] = F2[id];

        __syncthreads(); // Synchronize threads

        for (int i = 0; i < 103689; ++i)
        {
            if (sharedF1[threadIdx.x] == 1)
            {
                if (Na[Ea[id]] > Na[Sa[id]] + 1)
                {
                    // Relax
                    Na[Ea[id]] = Na[Sa[id]] + 1;
                    sharedF2[threadIdx.x] = 1;
                }
            }

            // Swap and update flags with synchronization
            __syncthreads();
            F1[id] = sharedF2[threadIdx.x];
            sharedF1[threadIdx.x] = sharedF2[threadIdx.x];
            sharedF2[threadIdx.x] = 0;
            __syncthreads();
        }
    }
}