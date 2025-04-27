#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void div_strided_float(int n, int xOffset, int yOffset, float *dx, float *dy, int incx, int incy, float *result) {
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use strided loop with the total threads count as the stride
    int stride = blockDim.x * gridDim.x;
    while (i < n) {
        // Check conditions and perform division if met
        if(i >= xOffset && i >= yOffset && i % incx == 0 && i % incy == 0) {
            result[i] = dy[i] / dx[i];
        }
        i += stride; // Move to the next element in the stride
    }
}