#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void div_strided_double(int n, int xOffset, int yOffset, double *dx, double *dy, int incx, int incy, double *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop with stride over the grid to cover all elements
    while (i < n) {
        // Check conditions to ensure valid indices before division
        if (i >= xOffset && i >= yOffset && i % incx == 0 && i % incy == 0) {
            result[i] = dy[i] / dx[i];
        }
        // Increment index by total number of threads in the grid for next stride
        i += blockDim.x * gridDim.x;
    }
}