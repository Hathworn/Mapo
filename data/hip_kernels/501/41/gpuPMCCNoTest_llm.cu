#include "hip/hip_runtime.h"
#include "includes.h"
#define FALSE 0
#define TRUE !FALSE

#define NUMTHREADS 16
#define THREADWORK 32

__global__ void gpuPMCCNoTest(const float * vectsa, size_t na, const float * vectsb, size_t nb, size_t dim, const float * numPairs, const float * means, const float * sds, float * correlations)
{
    size_t x = blockIdx.x, y = blockIdx.y, tx = threadIdx.x;
    float a, b, n, scoreA, scoreB;
    __shared__ float meanA, meanB, sdA, sdB, threadSums[NUMTHREADS];

    if((x >= na) || (y >= nb))
        return;

    // Load shared data only once per block
    if(tx == 0) {
        size_t idx = x * nb + y;
        meanA = means[idx * 2];
        meanB = means[idx * 2 + 1];
        sdA = sds[idx * 2];
        sdB = sds[idx * 2 + 1];
        n = numPairs[idx];
    }
    __syncthreads();

    float sum = 0.f;
    // Unrolling loop for efficient memory access
    for(size_t offset = tx; offset < dim; offset += NUMTHREADS) {
        a = vectsa[x * dim + offset];
        b = vectsb[y * dim + offset];
        sum += ((a - meanA) / sdA) * ((b - meanB) / sdB);
    }
    
    threadSums[tx] = sum;
    __syncthreads();

    // Reduce sum using in-place reduction
    for(size_t stride = NUMTHREADS / 2; stride > 0; stride >>= 1) {
        if(tx < stride) {
            threadSums[tx] += threadSums[tx + stride];
        }
        __syncthreads();
    }

    // Store result in the correlations array
    if(tx == 0) correlations[x * nb + y] = threadSums[0] / (n - 1.f);
}