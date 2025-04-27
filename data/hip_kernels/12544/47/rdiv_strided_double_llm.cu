#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void rdiv_strided_double(int n, int xOffset, int yOffset, double *dx, double *dy, int incx, int incy, double *result) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop with stride for handling larger data
    while (i < n) {
        // Check strided conditions
        if (i >= xOffset && i >= yOffset && i % incx == 0 && i % incy == 0) {
            result[i] = dx[i] - dy[i];
        }
        // Increment index with grid stride
        i += blockDim.x * gridDim.x;
    }
}