#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void aggregateEnergies(double *energies, int numEnergies, int interval, int batchSize)
{
    // Calculate global index based on block and thread index
    int idx = batchSize * interval * (blockIdx.x * blockDim.x + threadIdx.x);

    // Check if main index is within bounds
    if (idx < numEnergies) 
    {
        double sum = energies[idx];  // Initialize sum
        for (int i = 1; i < batchSize; i++)
        {
            int offsetIdx = idx + i * interval;
            // Only add if the offset index is within bounds
            if (offsetIdx < numEnergies)
            {
                sum += energies[offsetIdx];
                energies[offsetIdx] = 0;
            }
        }
        energies[idx] = sum;  // Update the main index with the aggregated sum
    }
}