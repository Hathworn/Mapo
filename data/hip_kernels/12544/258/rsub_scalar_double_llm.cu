#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for rsub_scalar_double
__global__ void rsub_scalar_double(int n, int idx, double dx, double *dy, int incy, double *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    // Using stride loop ensures all threads perform useful work
    for (; i < n; i += stride) {
        if (i >= idx && i % incy == 0) {
            result[i] = dx - dy[i];
        }
    }
}