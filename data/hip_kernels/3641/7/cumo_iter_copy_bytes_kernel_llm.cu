#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cumo_iter_copy_bytes_kernel(char *p1, char *p2, ssize_t s1, ssize_t s2, size_t *idx1, size_t *idx2, uint64_t n, ssize_t elmsz)
{
    // Calculate the global thread index
    uint64_t i = blockIdx.x * blockDim.x + threadIdx.x;
    // Loop through the index space in strides of total number of threads
    while (i < n) {
        // Compute source and destination addresses
        char *p1_ = p1 + (idx1 ? idx1[i] : i * s1);
        char *p2_ = p2 + (idx2 ? idx2[i] : i * s2);
        // Perform memory copy
        memcpy(p2_, p1_, elmsz);
        // Update the global index for the next iteration
        i += blockDim.x * gridDim.x;
    }
}