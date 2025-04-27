#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void rdiv_strided_float(int n,int xOffset,int yOffset, float *dx,float *dy,int incx,int incy,float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use stride loop to efficiently cover all elements
    int stride = blockDim.x * gridDim.x;
    for (; i < n; i += stride) {
        // Simplify condition checking by incorporating offset directly
        if ((i >= xOffset) && (i >= yOffset) && ((i - xOffset) % incx == 0) && ((i - yOffset) % incy == 0)) {
            result[i] = dx[i] / dy[i];
        }
    }
}