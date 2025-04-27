#include "hip/hip_runtime.h"
#include "includes.h"
#define BLOCK_WIDTH 256 // Assuming a defined block width

__global__ void scatter(unsigned int *d_inVals, unsigned int *d_outVals, unsigned int *d_inPos, unsigned int *d_outPos, unsigned int *d_zerosScan, unsigned int *d_onesScan, unsigned int *d_zerosPredicate, unsigned int *d_onesPredicate, size_t n)
{
    int tx = threadIdx.x;
    int bx = blockIdx.x;
    int index = BLOCK_WIDTH * bx + tx;

    if (index < n) {
        unsigned int scatterIdx;
        unsigned int offset = d_zerosScan[n - 1] + d_zerosPredicate[n - 1];

        // Prefetch predicate to reduce memory accesses
        unsigned int predicate = d_zerosPredicate[index];
        scatterIdx = predicate ? d_zerosScan[index] : d_onesScan[index] + offset;

        if (scatterIdx < n) { // Sanity check
            d_outVals[scatterIdx] = d_inVals[index];
            d_outPos[scatterIdx] = d_inPos[index];
        }
    }
}