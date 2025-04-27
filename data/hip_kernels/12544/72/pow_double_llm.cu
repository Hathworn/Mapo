#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void pow_double(int n, int idx, double *dy, int incy, double raise, double *result) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Iterate through elements with stride of total threads
    for (; i < n; i += blockDim.x * gridDim.x) {
        // Check conditions only once per loop iteration
        if (i >= idx && i % incy == 0) {
            result[i] = pow(dy[i], raise);
        }
    }
}