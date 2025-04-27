#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void rsub_scalar_float(int n, int idx, float dx, float *dy, int incy, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Process elements in steps of stride, reducing divergence
    for (; i < n; i += stride) {
        if (i >= idx && i % incy == 0) {
            result[i] = dx - dy[i];
        }
    }
}