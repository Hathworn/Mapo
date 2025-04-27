#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void mul_strided_float(int n, int xOffset, int yOffset, float *dx, float *dy, int incx, int incy, float *result) {
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride-based loop
    int stride = blockDim.x * gridDim.x;

    // Iterate over the elements
    for (; i < n; i += stride) {
        // Ensure indices and strides are respected
        if (i >= xOffset && i >= yOffset && i % incx == 0 && i % incy == 0) {
            result[i] = dx[i] * dy[i];
        }
    }
}