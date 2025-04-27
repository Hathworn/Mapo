#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rdiv_strided_double(int n, int xOffset, int yOffset, double *dx, double *dy, int incx, int incy, double *result) {
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride to cover the entire data set
    int stride = blockDim.x * gridDim.x;

    // Loop over each element using the stride
    for (; i < n; i += stride) {
        // Check condition once here to minimize checks
        if(i >= xOffset && i >= yOffset && i % incx == 0 && i % incy == 0) {
            result[i] = dx[i] - dy[i];
        }
    }
}