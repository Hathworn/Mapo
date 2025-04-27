#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void d_bucketsort(unsigned int * d_in, unsigned int * d_indices, unsigned int * d_sublist, unsigned int * r_outputlist, unsigned int * d_bucketoffsets, int itemCount) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < itemCount) {
        // Reduce redundant calculations of newpos within the loop
        unsigned int sublist_index = d_sublist[idx];
        unsigned int index_offset = d_indices[idx];
        int newpos = d_bucketoffsets[sublist_index] + index_offset;
        r_outputlist[newpos] = d_in[idx];
    }
}