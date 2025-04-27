#include "hip/hip_runtime.h"
#include "includes.h"
#define FALSE 0
#define TRUE !FALSE

#define NUMTHREADS 16
#define THREADWORK 32

__global__ void noNAsPmccMeans(int nRows, int nCols, float * a, float * means) {
    int col = blockDim.x * blockIdx.x + threadIdx.x;
    if (col >= nCols) return;
    
    int inOffset = col * nRows;
    float sum = 0.f;

    __shared__ float threadSums[NUMTHREADS];

    // Unroll the loop for efficiency
    for (int i = threadIdx.y; i < nRows; i += blockDim.y) {
        sum += a[inOffset + i];
    }
    
    // Reduce sum within the block with improved stride access
    int tid = threadIdx.y;
    threadSums[tid] = sum;
    __syncthreads();

    for (int i = blockDim.y >> 1; i > 0; i >>= 1) {
        if (tid < i) {
            threadSums[tid] += threadSums[tid + i];
        }
        __syncthreads();
    }

    if (tid == 0) {
        means[col] = threadSums[0] / (float)nRows;
    }
}