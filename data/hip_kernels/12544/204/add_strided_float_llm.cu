#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_strided_float(int n, int xOffset, int yOffset, float *dx, float *dy, int incx, int incy, float *result) {
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride loop to handle array bounds
    int stride = blockDim.x * gridDim.x;
    
    // Loop with improved boundary checks
    for (; i < n; i += stride) {
        if (i >= xOffset && i >= yOffset && i % incx == 0 && i % incy == 0) {
            result[i] = dy[i] + dx[i];
        }
    }
}