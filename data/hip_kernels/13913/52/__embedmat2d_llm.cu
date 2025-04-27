#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel code
__global__ void __embedmat2d(double *a, long long *b, int nrows, int ncols, int sortdown) {
    int tid = threadIdx.x + blockDim.x * (blockIdx.x + gridDim.x * blockIdx.y);
    const int signbit = 0x80000000;
    const int mag = 0x7fffffff;
    int total_threads = blockDim.x * gridDim.x * gridDim.y; // Pre-compute total threads

    for (int i = tid; i < nrows * ncols; i += total_threads) { // Use pre-computed total_threads
        double v = a[i];
        int vi = *((int *)&v);
        vi = (vi & signbit) ? -(vi & mag) : vi; // Simplify if-else with conditional operator

        int icol = (i / nrows + 1);
        icol = sortdown ? (ncols - icol + 1) : icol; // Use conditional operator for icol computation

        b[i] = (long long)vi + (((long long)icol) << 32);
    }
}