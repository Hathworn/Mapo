#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _badd(int nrows, int ncols, float *y, float *b) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global thread index
    int stride = blockDim.x * gridDim.x; // Determine stride
    for (int i = idx; i < ncols * nrows; i += stride) { // Iterate over array using stride
        y[i] += b[i % nrows]; // Update y array element
    }
}