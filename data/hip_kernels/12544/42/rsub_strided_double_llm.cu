#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

// Optimized kernel function
__global__ void rsub_strided_double(int n, int xOffset, int yOffset, double *dx, double *dy, int incx, int incy, double *result) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use a stride loop to handle the full range of data
    int stride = blockDim.x * gridDim.x;
    // Process all elements with stride
    for (; i < n; i += stride) {
        if(i >= xOffset && i >= yOffset && i % incx == 0 && i % incy == 0)
            result[i] = dx[i] / dy[i];
    }
}