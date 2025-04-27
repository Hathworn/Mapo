```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sub_strided_double(int n, int xOffset, int yOffset, double *dx, double *dy, int incx, int incy, double *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a loop stride that matches the total number of threads
    int stride = blockDim.x * gridDim.x;

    // Loop through the array with the proper stride
    for (; i < n; i += stride) {
        if (i >= xOffset && i >= yOffset && i % incx == 0 && i % incy == 0) {
            result[i] = dy[i] - dx[i];
        }
    }
}