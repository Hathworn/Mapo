#include "hip/hip_runtime.h"
#include "includes.h"

//kernel for computing histogram right in memory

//compute partial histogram on shared memory and mix them on global memory

__global__ void hist_inShared (const int* values, int length, int* hist) {

//load shared memory
extern __shared__ int shHist[];

// Each thread block initializes its own shared memory histogram to 0
shHist[threadIdx.x] = 0;
__syncthreads();

// Compute global index and stride for this thread
int idx = blockDim.x * blockIdx.x + threadIdx.x;
int stride = gridDim.x * blockDim.x;

// Iterate over all values within bounds that this thread should process
while (idx < length) {
    int val = values[idx];

    // Increment value frequency on shared histogram
    atomicAdd(&shHist[val], 1);

    // Move to the next value that this thread should process
    idx += stride;
}

// Wait for all threads to finish updating shared histogram
__syncthreads();

// Combine partial histogram on shared memory to create a full histogram
atomicAdd(&hist[threadIdx.x], shHist[threadIdx.x]);
}