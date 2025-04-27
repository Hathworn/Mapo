#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void copy_sort_int(const int *orig, const unsigned int *sort_idx, const unsigned int nitems, int *sorted) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (i < nitems) { // Ensure index is within bounds
        sorted[sort_idx[i]] = orig[i]; // Copy and sort element
    }
}