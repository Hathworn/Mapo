#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void eq_strided_float(int n, int xOffset, int yOffset, float *dx, float *dy, int incx, int incy, float *result) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Utilize shared memory to reduce global memory access
    __shared__ float shared_dx[256];
    __shared__ float shared_dy[256];

    for (int i = idx; i < n; i += blockDim.x * gridDim.x) {
        if (i >= max(xOffset, yOffset) && i % incx == 0 && i % incy == 0) {
            // Load data into shared memory
            shared_dx[threadIdx.x] = dx[i];
            shared_dy[threadIdx.x] = dy[i];
            __syncthreads();

            // Perform computation
            result[i] = shared_dy[threadIdx.x] == shared_dx[threadIdx.x];
        }
    }
}