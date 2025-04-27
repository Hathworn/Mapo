#include "hip/hip_runtime.h"
#include "includes.h"

#define RAND_RANGE(N) ((double)rand()/((double)RAND_MAX + 1)*(N))

//data generator
__global__ void prefixScan(int* Hist,int* Hist_dev_pre, int noofpartitions,long long size)
{
    extern __shared__ int sharedpartitions[];
    int thd = threadIdx.x;
    int offset = 1;

    // Load input into shared memory
    sharedpartitions[2 * thd] = Hist[2 * thd];
    sharedpartitions[2 * thd + 1] = Hist[2 * thd + 1];

    // Up-sweep (reduce) phase
    for (int i = noofpartitions >> 1; i > 0; i >>= 1) {
        __syncthreads();
        if (thd < i) {
            int x = offset * (2 * thd + 1) - 1;
            int y = offset * (2 * thd + 2) - 1;

            sharedpartitions[y] += sharedpartitions[x];
        }
        offset *= 2;
    }

    // Clear the last element (exclusively)
    if (thd == 0) { 
        sharedpartitions[noofpartitions - 1] = 0; 
    }

    // Down-sweep phase
    for (int i = 1; i < noofpartitions; i *= 2) {
        offset >>= 1;
        __syncthreads();
        if (thd < i) {
            int x = offset * (2 * thd + 1) - 1;
            int y = offset * (2 * thd + 2) - 1;

            int tmp = sharedpartitions[x];
            sharedpartitions[x] = sharedpartitions[y];
            sharedpartitions[y] += tmp;
        }
    }
    __syncthreads();

    // Store the result back to global memory
    Hist_dev_pre[2 * thd] = sharedpartitions[2 * thd];
    Hist_dev_pre[2 * thd + 1] = sharedpartitions[2 * thd + 1];
}