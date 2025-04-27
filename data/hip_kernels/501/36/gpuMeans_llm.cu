#include "hip/hip_runtime.h"
#include "includes.h"
#define FALSE 0
#define TRUE !FALSE

#define NUMTHREADS 16
#define THREADWORK 32

__global__ void gpuMeans(const float *vectsA, size_t na, const float *vectsB, size_t nb, size_t dim, float *means, float *numPairs) {
    size_t bx = blockIdx.x, by = blockIdx.y, tx = threadIdx.x;
    float a, b;

    // Reduced shared memory usage by using one array with structures
    __shared__ struct {
        float sumA;
        float sumB;
        float count;
    } smem[NUMTHREADS];

    if (bx >= na || by >= nb) return;

    smem[tx].sumA = smem[tx].sumB = smem[tx].count = 0.f;

    for (size_t offset = tx; offset < dim; offset += NUMTHREADS) {
        a = vectsA[bx * dim + offset];
        b = vectsB[by * dim + offset];
        if (!isnan(a) && !isnan(b)) {
            smem[tx].sumA += a;
            smem[tx].sumB += b;
            smem[tx].count += 1.f;
        }
    }
    __syncthreads();

    for (size_t stride = NUMTHREADS >> 1; stride > 0; stride >>= 1) {
        if (tx < stride) {
            smem[tx].sumA += smem[tx + stride].sumA;
            smem[tx].sumB += smem[tx + stride].sumB;
            smem[tx].count += smem[tx + stride].count;
        }
        __syncthreads();
    }

    if (tx == 0) {
        means[bx * nb * 2 + by * 2] = smem[0].sumA / smem[0].count;
        means[bx * nb * 2 + by * 2 + 1] = smem[0].sumB / smem[0].count;
        numPairs[bx * nb + by] = smem[0].count;
    }
}