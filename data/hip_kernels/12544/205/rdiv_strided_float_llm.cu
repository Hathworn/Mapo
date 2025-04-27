#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rdiv_strided_float(int n, int xOffset, int yOffset, float *dx, float *dy, int incx, int incy, float *result) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread ID
    int stride = blockDim.x * gridDim.x; // Calculate stride

    // Iterate over elements with a stride
    for (int i = idx; i < n; i += stride) {
        if (i >= xOffset && i >= yOffset && i % incx == 0 && i % incy == 0) {
            result[i] = dx[i] / dy[i]; // Perform element-wise division only for valid indices
        }
    }
}