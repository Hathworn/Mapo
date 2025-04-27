#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ceil_double(int n, int idx, double *dy, int incy, double *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    int stride = blockDim.x * gridDim.x; // Stride for stepping through elements

    for (; i < n; i += stride) { // Loop over elements with stride
        if (i >= idx && i % incy == 0) // Check index conditions
            result[i] = ceil(dy[i]); // Perform ceiling operation
    }
}