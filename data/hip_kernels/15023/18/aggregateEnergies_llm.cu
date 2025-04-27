#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void aggregateEnergies(double *energies, int numEnergies, int interval, int batchSize)
{
    int idx = batchSize * interval * (blockIdx.x * blockDim.x + threadIdx.x);

    // Use shared memory to optimize global memory access
    extern __shared__ double sharedEnergies[];

    // Load data into shared memory
    for (int i = 0; i < batchSize && idx + i * interval < numEnergies; i++) {
        sharedEnergies[i] = energies[idx + i * interval];
    }
    __syncthreads();

    // Reduce values using shared memory
    if (idx < numEnergies) {
        for (int i = 1; i < batchSize; i++) {
            if (idx + i * interval < numEnergies) {
                sharedEnergies[0] += sharedEnergies[i];
            }
        }
        
        // Write back the result to global memory
        energies[idx] = sharedEnergies[0];
        for (int i = 1; i < batchSize; i++) {
            if (idx + i * interval < numEnergies) {
                energies[idx + i * interval] = 0.0;
            }
        }
    }
}