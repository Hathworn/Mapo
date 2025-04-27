#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mapScan(unsigned int *d_array, unsigned int *d_total, size_t n) {
    int tx = threadIdx.x;
    int bx = blockIdx.x;
    int index = BLOCK_WIDTH * bx + tx;

    // Ensure index access is within array bounds. Pre-calculate total for improved performance.
    if (index < n) {
        unsigned int total = d_total[bx];
        d_array[index] += total;
    }
}