#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void optimizedHistKernel(int* bins, int nbins, int* in, int nrows) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    auto offset = blockIdx.y * nrows;
    auto binOffset = blockIdx.y * nbins;

    // Use shared memory for bins to reduce global memory accesses
    extern __shared__ int sharedBins[];
    for (int i = threadIdx.x; i < nbins; i += blockDim.x) {
        sharedBins[i] = 0; // Initialize shared bins
    }
    __syncthreads();

    for (; tid < nrows; tid += stride) {
        int id = in[offset + tid];
        if (id < 0)
            id = 0;
        else if (id >= nbins)
            id = nbins - 1;
        atomicAdd(&sharedBins[id], 1); // Atomic add in shared memory
    }
    __syncthreads();

    // Commit results from shared memory to global memory
    for (int i = threadIdx.x; i < nbins; i += blockDim.x) {
        atomicAdd(bins + binOffset + i, sharedBins[i]);
    }
}