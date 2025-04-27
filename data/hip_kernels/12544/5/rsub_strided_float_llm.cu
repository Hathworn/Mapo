#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void rsub_strided_float(int n, int xOffset, int yOffset, float *dx, float *dy, int incx, int incy, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate the global thread index
    int step = blockDim.x * gridDim.x;  // Calculate the step size

    while (i < n) {
        // Process elements only if they meet the conditions
        if (i >= xOffset && i >= yOffset && i % incx == 0 && i % incy == 0) {
            result[i] = dx[i] - dy[i];
        }
        i += step;  // Move to the next set of elements
    }
}