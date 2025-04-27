#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcSumTable(const float *rowCumSum, float *SumTable, int rowNumberN, int colNumberM) {
    int xIndex = threadIdx.x + blockIdx.x * blockDim.x;
    if (xIndex >= colNumberM) return;

    // Use shared memory to reduce global memory accesses
    extern __shared__ float sharedMem[];
    
    for (int i = 1; i < rowNumberN; i++) {
        int globalIndex = i * colNumberM + xIndex;
        int prevGlobalIndex = (i - 1) * colNumberM + xIndex;

        // Load data into shared memory
        sharedMem[threadIdx.x] = rowCumSum[prevGlobalIndex];
        __syncthreads();

        // Update SumTable with values from shared memory
        SumTable[globalIndex] += sharedMem[threadIdx.x];
        __syncthreads(); // Ensure all threads have completed their updates
    }
}