#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fillPartitionLabelKernel(int size, int *coarseAggregate, int *fineAggregateSort, int *partitionLabel)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for faster access in the same block
    extern __shared__ int sharedCoarseAggregate[];

    if (threadIdx.x < size) {
        sharedCoarseAggregate[threadIdx.x] = coarseAggregate[threadIdx.x];
    }

    __syncthreads();

    if (idx < size) {
        partitionLabel[idx] = sharedCoarseAggregate[fineAggregateSort[idx]];
    }
}