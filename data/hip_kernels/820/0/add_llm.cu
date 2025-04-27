#include "hip/hip_runtime.h"
#include "includes.h"

#define block_size   32
#define vector_size  10000000

__global__ void add( int *a, int *b, int *c ) {
    int tid = (blockIdx.x*blockDim.x) + threadIdx.x;

    // Use a loop to handle multiple elements per thread.
    for (int i = tid; i < vector_size; i += blockDim.x * gridDim.x) {
        // Perform addition leveraging memory coalescing if applicable.
        c[i] = a[i] + b[i];
    }
}