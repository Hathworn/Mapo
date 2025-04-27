#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void eq_strided_double(int n, int xOffset, int yOffset, double *dx, double *dy, int incx, int incy, double *result) {
    // Calculate the global index based on block and thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Stride through output array for all threads collectively
    int stride = blockDim.x * gridDim.x;

    // Process each element with stride loop
    for (; i < n; i += stride) {
        // Check bounds and strides, then compute results
        if (i >= xOffset && i >= yOffset && i % incx == 0 && i % incy == 0) {
            result[i] = dy[i] == dx[i];
        }
    }
}