#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bf_2flags(int *Na, int *src, int *F1, int *F2, int *exists, int *Sa, int *Ea, int threadsPerBlock)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Use blockDim.x for dimension

    if (exists[id] == 1)
    {
        Na[id] = 65000; // MAX INT Value
        F1[id] = 0;
        F2[id] = 0;

        if (id == *src)
        { // Starting node conditions
            Na[id] = 0;
            F1[id] = 1;
        }

        // Use a shared memory flag for synchronization
        // __shared__ int localF1[blockDim.x];
        // __shared__ int localF2[blockDim.x];

        for (int i = 0; i < 103689; ++i)
        {
            if (F1[Sa[id]] == 1)
            {
                // Replace atomic operation with direct update (not thread-safe)
                if (Na[Ea[id]] > Na[Sa[id]] + 1)
                {
                    Na[Ea[id]] = Na[Sa[id]] + 1;
                    F2[Ea[id]] = 1;
                }
            }

            // Swap and reset flags using temporary variable
            int temp = F1[id];
            F1[id] = F2[id];
            F2[id] = temp;
        }
    }
}