#include "hip/hip_runtime.h"
#include "includes.h"

#define pi 3.14159265359f

__global__ void countCellOccKernal(unsigned int *d_hashArray, unsigned int *d_cellOccArray, int _hashTableSize, unsigned int _numPoints) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check index boundary and hash array limit
    if (idx < _numPoints) {
        unsigned int hashValue = d_hashArray[idx];
        if (hashValue < _hashTableSize) {
            // Atomically increment the occupancy count for the hash index
            atomicAdd(&(d_cellOccArray[hashValue]), 1);
        }
    }
}