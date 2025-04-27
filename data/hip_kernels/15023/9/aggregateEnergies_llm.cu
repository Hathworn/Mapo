#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void aggregateEnergies(double *energies, int numEnergies, int interval, int batchSize)
{
    int idx = batchSize * interval * (blockIdx.x * blockDim.x + threadIdx.x);
    
    // Early exiting if index is out of bounds
    if (idx >= numEnergies) return;

    // Reduce access to global memory by using a local accumulator
    double accumulator = energies[idx];
    for (int i = 1; i < batchSize; i++)
    {
        int offset = idx + i * interval;
        if (offset < numEnergies)
        {
            accumulator += energies[offset];
            energies[offset] = 0;
        }
    }
    energies[idx] = accumulator;
}