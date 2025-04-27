#include "hip/hip_runtime.h"
#include "includes.h"
#define FALSE 0
#define TRUE !FALSE

#define NUMTHREADS 16
#define THREADWORK 32

__global__ void noNAsPmccMeans(int nRows, int nCols, float * a, float * means)
{
    int col = blockDim.x * blockIdx.x + threadIdx.x;
    if(col >= nCols) return;

    int inOffset = col * nRows;
    int outOffset = threadIdx.x * blockDim.y + threadIdx.y;
    
    extern __shared__ float threadSums[];
    float sum = 0.f;

    for(int i = threadIdx.y; i < nRows; i += blockDim.y) {
        sum += a[inOffset + i];
    }
    
    threadSums[outOffset] = sum;
    __syncthreads();

    if(threadIdx.y == 0) {
        float totalSum = 0.f;
        // Efficient reduction in shared memory
        for(int i = 0; i < blockDim.y; ++i) {
            totalSum += threadSums[outOffset + i];
        }
        means[col] = totalSum / (float)nRows;
    }
}