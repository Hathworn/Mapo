#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void neq_strided_double(int n, int xOffset, int yOffset, double *dx, double *dy, int incx, int incy, double *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a single loop to reduce thread divergence and improve readability
    while (i < n) {
        if (i >= xOffset && i >= yOffset && i % incx == 0 && i % incy == 0) {
            result[i] = dy[i] != dx[i];
        }
        i += blockDim.x * gridDim.x; // Move to the next index handled by this thread
    }
}