#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getAggregateStartIndicesKernel(int size, int *fineAggregateSort, int *aggregateRemapIndex)
{
    // Calculate global thread index using block and thread indices.
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure idx is within bounds and execute only when necessary.
    if (idx < size)
    {
        // Use shared memory to minimize global memory access latency.
        __shared__ int sharedFineAggregateSort[256]; // Assuming a block size of 256 for simplification.
        
        // Each thread loads its element into shared memory.
        sharedFineAggregateSort[threadIdx.x] = fineAggregateSort[idx];
        __syncthreads(); // Synchronize to ensure shared memory is fully populated.
       
        // Perform the boundary check and comparison within shared memory.
        if (idx == 0 || sharedFineAggregateSort[threadIdx.x] != sharedFineAggregateSort[threadIdx.x - 1])
        {
            // Write the result back to global memory.
            aggregateRemapIndex[sharedFineAggregateSort[threadIdx.x]] = idx;
        }
    }
}