#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void d_count_kernel(unsigned int *d_pivots, int *r_buckets, int pivotsLength, unsigned int *r_indices, unsigned int *r_sublist, unsigned int *d_in, int itemCount) {
    // Calculate unique thread ID
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < itemCount) {
        unsigned int element = d_in[idx];
        unsigned int index = pivotsLength / 2 - 1;
        unsigned int jump = pivotsLength / 4;
        int pivot = d_pivots[index];

        // Binary search style to find correct bucket
        while (jump >= 1) {
            index = (element < pivot) ? (index - jump) : (index + jump);
            pivot = d_pivots[index];
            jump /= 2;
        }
        index = (element < pivot) ? index : index + 1;
        r_sublist[idx] = index;

        // Efficiently update bucket index using atomic operations
        r_indices[idx] = atomicAdd(&r_buckets[index], 1);
    }
}