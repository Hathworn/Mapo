#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sign_float(int n, int idx, float *dy, int incy, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Unrolled loop to optimize memory access and improve performance
    for (; i < n; i += stride) {
        if (i >= idx && i % incy == 0) {
            float x = dy[i];
            result[i] = (x > 0) - (x < 0);
        }
    }
}