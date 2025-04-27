#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void abs_float(int n, int idx, float *dy, int incy, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread index
    int gridStride = blockDim.x * gridDim.x;        // Calculate grid stride
    for (; i < n; i += gridStride) {                // Use grid-stride loop
        if (i >= idx && i % incy == 0)              // Conditional execution
            result[i] = fabsf(dy[i]);               // Use fabsf for float
    }
}