#include "hip/hip_runtime.h"
#include "includes.h"

#define UMUL(a, b) ((a) * (b))
#define UMAD(a, b, c) (UMUL((a), (b)) + (c))

typedef unsigned int uint;
typedef unsigned short ushort;
typedef unsigned char uchar;

#define SHARED_MEMORY_SIZE 49152
#define MERGE_THREADBLOCK_SIZE 128

static uint *d_PartialHistograms;

/*
*	Function that maps value to bin in range 0 inclusive to binCount exclusive
*/
__global__ void clearHistogram(uint *d_Histogram, uint binCount)
{
    // Allocate shared memory for histogram bins
    __shared__ uint s_Histogram[MERGE_THREADBLOCK_SIZE];

    // Initialize shared memory histogram bins to zero
    uint tid = threadIdx.x;
    s_Histogram[tid] = 0;
    __syncthreads();

    // Iterate over histogram bins using shared memory
    for (uint bin = UMAD(blockIdx.x, blockDim.x, threadIdx.x); bin < binCount; bin += UMUL(blockDim.x, gridDim.x)) {
        // Clear histogram using shared memory
        atomicAdd(&s_Histogram[tid % MERGE_THREADBLOCK_SIZE], d_Histogram[bin]);
        d_Histogram[bin] = 0;
    }

    __syncthreads();

    // Write shared memory bins back to global memory
    atomicAdd(&d_Histogram[tid], s_Histogram[tid]);
}