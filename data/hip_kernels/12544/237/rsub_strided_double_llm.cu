#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rsub_strided_double(int n, int xOffset, int yOffset, double *dx, double *dy, int incx, int incy, double *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Loop unrolling and avoid recalculating indexes
    int stride = blockDim.x * gridDim.x;
    while (i < n) {
        if(i >= xOffset && i >= yOffset && i % incx == 0 && i % incy == 0)
            result[i] = dx[i] / dy[i];
        i += stride;
    }
}