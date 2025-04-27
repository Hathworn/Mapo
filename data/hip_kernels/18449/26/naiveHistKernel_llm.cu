#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void optimizedHistKernel(int* bins, int nbins, int* in, int nrows) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    auto offset = blockIdx.y * nrows;
    auto binOffset = blockIdx.y * nbins;
    
    // Use shared memory to temporarily store bin counts for warp-level atomic operations
    extern __shared__ int sharedBins[];
    int laneId = threadIdx.x % warpSize;

    // Initialize shared memory
    for (int i = threadIdx.x; i < nbins; i += blockDim.x) {
        sharedBins[i] = 0;
    }
    __syncthreads();

    // Process input data
    for (; tid < nrows; tid += stride) {
        int id = in[offset + tid];
        id = max(0, min(id, nbins - 1)); // Clamp id to valid range
        atomicAdd(&sharedBins[id], 1);
    }
    __syncthreads();

    // Aggregate results from shared memory to global memory
    for (int i = laneId; i < nbins; i += warpSize) {
        atomicAdd(bins + binOffset + i, sharedBins[i]);
    }
}