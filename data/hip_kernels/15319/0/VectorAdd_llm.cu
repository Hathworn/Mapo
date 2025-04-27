#include "hip/hip_runtime.h"
#include "includes.h"

#define SIZE 1024

__global__ void VectorAdd(int *a, int *b, int *c, int n) {
    // Compute a unique index for each thread in the grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure that we do not read/write beyond the array bounds
    if (i < n) {
        // Perform vector addition for the valid index
        c[i] = a[i] + b[i];
        printf("i: %d, c[i] = %d, a[i] = %d, b[i] = %d\n", i, c[i], a[i], b[i]);
    }
}