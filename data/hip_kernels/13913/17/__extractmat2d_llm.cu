#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void __extractmat2d(float *a, long long *b, int nrows, int ncols) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Flattened thread index
    int stride = blockDim.x * gridDim.x; // Total threads

    const int signbit = 0x80000000;
    const int mag = 0x7fffffff;

    for (int i = tid; i < nrows * ncols; i += stride) {
        int vi = *((int *)&b[i]);
        if (vi & signbit) {
            vi = -(vi & mag);
        }
        a[i] = *((float *)&vi);
    }
}