#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void exp_double(int n, int idx, double *dy, int incy, double *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Loop unrolling for better performance
    for (; i < n; i += stride) {
        if (i >= idx && i % incy == 0) {
            result[i] = cos(dy[i]);
        }
    }
}