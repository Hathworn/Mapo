#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void rdiv_scalar_float(int n, int idx, float dx, float *dy, int incy, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Unroll the loop to process multiple elements per iteration
    for (; i < n; i += stride) {
        int index = i * incy;
        if (index >= idx) {
            result[index] = dx / dy[index];
        }
    }
}