#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void add_strided_double(int n, int xOffset, int yOffset, double *dx, double *dy, int incx, int incy, double *result) {
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Loop with striding
    for (; i < n; i += stride) {
        if (i >= xOffset && i >= yOffset && i % incx == 0 && i % incy == 0) {
            result[i] = dy[i] + dx[i]; // Perform element-wise addition
        }
    }
}