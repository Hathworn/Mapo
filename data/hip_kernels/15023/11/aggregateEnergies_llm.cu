#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void aggregateEnergies(double *energies, int numEnergies, int interval, int batchSize)
{
    // Calculate the global thread index
    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate initial energy index based on batchSize, interval, and thread index 
    int idx = batchSize * interval * globalIdx;

    // Use shared memory to store energies temporarily for faster access
    extern __shared__ double sharedEnergies[];

    // Load energies into shared memory
    for (int i = 0; i < batchSize; i++) {
        int index = idx + i * interval;
        if (index < numEnergies) {
            sharedEnergies[threadIdx.x * batchSize + i] = energies[index];
        }
    }
    __syncthreads(); // Ensure all threads have loaded their data

    // Aggregate energies in shared memory
    double sum = sharedEnergies[threadIdx.x * batchSize];
    for (int i = 1; i < batchSize; i++) {
        sum += sharedEnergies[threadIdx.x * batchSize + i];
    }
    
    // Store aggregated result back to global memory
    if (idx < numEnergies) {
        energies[idx] = sum; 
    }
    
    // Zero the remaining energies
    for (int i = 1; i < batchSize; i++) {
        int index = idx + i * interval;
        if (index < numEnergies) {
            energies[index] = 0;
        }
    }
}