#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void enumsort(int *deva, int *devn)
{
    int tid = threadIdx.x;
    int i, count = 0;

    // Use shared memory for better performance
    extern __shared__ int shared_deva[];

    // Load data into shared memory
    shared_deva[tid] = deva[tid];
    __syncthreads();

    // Perform the counting sort
    for (i = 0; i < N; i++) {
        if ((shared_deva[i] <= shared_deva[tid]) && (i != tid)) {
            count++;
        }
    }

    // Write the sorted value to devn
    devn[count] = shared_deva[tid];
}