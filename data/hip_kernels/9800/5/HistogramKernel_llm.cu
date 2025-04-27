#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize for shared memory and reduce atomic operations
__global__ void HistogramKernel(unsigned int * input, unsigned int size, unsigned int* histogram, unsigned int pass) {

    extern __shared__ unsigned int localHist[]; // Shared memory for local histogram
    int tid = threadIdx.x;
    int mid = tid + blockIdx.x * blockDim.x;

    // Initialize shared memory
    if (tid < 2) {
        localHist[tid] = 0;
    }
    __syncthreads();

    // Accumulate local histogram
    if (mid < size) {
        atomicAdd(&localHist[(input[mid]>>pass) & 0x01], 1);
    }
    __syncthreads();

    // Reduce local histograms to global histogram
    if (tid < 2) {
        atomicAdd(&histogram[tid], localHist[tid]);
    }
}