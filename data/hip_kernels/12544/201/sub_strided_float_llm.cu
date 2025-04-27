#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sub_strided_float(int n, int xOffset, int yOffset, float *dx, float *dy, int incx, int incy, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Compute global thread index
    int stride = blockDim.x * gridDim.x; // Compute stride for the grid
    for (; i < n; i += stride) {
        if (i >= xOffset && i >= yOffset && i % incx == 0 && i % incy == 0) {
            result[i] = dy[i] - dx[i]; // Perform subtraction
        }
    }
}