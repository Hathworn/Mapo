#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findAdjacencySizesKernel(int size, int *adjIndexes, int *output) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        // Load adjacent indices into shared memory for coalesced access
        __shared__ int sharedAdj[1024];
        sharedAdj[threadIdx.x] = adjIndexes[idx];
        __syncthreads();

        if (threadIdx.x < blockDim.x - 1)
            output[idx] = sharedAdj[threadIdx.x + 1] - sharedAdj[threadIdx.x];
        else if (idx + 1 < size)
            output[idx] = adjIndexes[idx + 1] - sharedAdj[threadIdx.x];
    }
}