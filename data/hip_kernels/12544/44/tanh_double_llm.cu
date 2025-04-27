#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void tanh_double(int n, int idx, double *dy, int incy, double *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    // Streamlined loop condition for efficiency
    for (; i < n; i += stride) {
        if (i >= idx && i % incy == 0) {
            // Avoid redundant calculations
            double val = dy[i];
            result[i] = tanh(val);
        }
    }
}