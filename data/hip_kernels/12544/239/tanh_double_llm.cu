#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void tanh_double(int n, int idx, double *dy, int incy, double *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    while (i < n) {
        // Process elements conditionally within index range and step
        if (i >= idx && i % incy == 0) {
            result[i] = tanh(dy[i]);
        }
        i += stride;
    }
}