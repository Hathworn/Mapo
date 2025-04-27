#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize the kernel function
__global__ void eq_strided_float(int n, int xOffset, int yOffset, float *dx, float *dy, int incx, int incy, float *result) {
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the global index is within bounds and strides are met
    if(i < n && i >= xOffset && i >= yOffset && i % incx == 0 && i % incy == 0) {
        result[i] = dy[i] == dx[i];
    }
}