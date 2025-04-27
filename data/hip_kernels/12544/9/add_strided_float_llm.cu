#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void add_strided_float(int n, int xOffset, int yOffset, float *dx, float *dy, int incx, int incy, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread index

    // Use loop unrolling and simplify conditions for better performance
    while (i < n) {
        if (i >= xOffset && i >= yOffset && i % incx == 0 && i % incy == 0) {
            result[i] = dy[i] + dx[i];  // Perform addition
        }
        i += blockDim.x * gridDim.x;  // Stride the index
    }
}