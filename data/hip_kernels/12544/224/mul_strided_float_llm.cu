#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_strided_float(int n, int xOffset, int yOffset, float *dx, float *dy, int incx, int incy, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Iterate over array with stride
    for (; i < n; i += stride) {
        // Check conditions only when necessary
        if (i >= xOffset && i >= yOffset && i % incx == 0 && i % incy == 0) {
            result[i] = dx[i] * dy[i];
        }
    }
}