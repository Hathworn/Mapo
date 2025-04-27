#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_sort_int(const float *orig, const unsigned int *sort_idx, const unsigned int nitems, float *sorted) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Each thread handles one index
    if (idx < nitems) {
        sorted[sort_idx[idx]] = orig[idx];
    }
}