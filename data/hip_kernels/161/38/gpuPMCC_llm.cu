#include "hip/hip_runtime.h"
#include "includes.h"
#define FALSE 0
#define TRUE !FALSE

#define NUMTHREADS 16
#define THREADWORK 32

__global__ void gpuPMCC(const float * vectsa, size_t na, const float * vectsb, size_t nb, size_t dim, const float * numPairs, const float * means, const float * sds, float * correlations)
{
    size_t x = blockIdx.x, y = blockIdx.y, tx = threadIdx.x;
    float a, b, n, scoreA, scoreB;
    __shared__ float meanA, meanB, sdA, sdB, threadSums[NUMTHREADS];

    if((x >= na) || (y >= nb))
        return;

    // Load means, sds, and numPairs into shared memory once per block
    if(tx == 0) {
        meanA = means[x*nb*2+y*2];
        meanB = means[x*nb*2+y*2+1];
        sdA = sds[x*nb*2+y*2];
        sdB = sds[x*nb*2+y*2+1];
        n = numPairs[x*nb+y];
    }
    __syncthreads();

    threadSums[tx] = 0.f;
    // Loop unrolling for coalesced memory access
    for(size_t offset = tx; offset < dim; offset += NUMTHREADS) {
        a = vectsa[x * dim + offset];
        b = vectsb[y * dim + offset];
        if(!(isnan(a) || isnan(b))) {
            scoreA = (a - meanA) / sdA;
            scoreB = (b - meanB) / sdB;
            threadSums[tx] += scoreA * scoreB;
        }
    }
    __syncthreads();

    // Reduce using shared memory efficiently
    for(size_t stride = NUMTHREADS >> 1; stride > 0; stride >>= 1) {
        if(tx < stride) threadSums[tx] += threadSums[tx + stride];
        __syncthreads();
    }
    // Write result for this block to global memory
    if(tx == 0) correlations[x*nb+y] = threadSums[0] / (n - 1.f);
}