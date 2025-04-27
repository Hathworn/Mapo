#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void exp_float(int n, int idx, float *dy, int incy, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    int stride = blockDim.x * gridDim.x; // Calculate stride for grid-stride loop
    for (; i < n; i += stride) { // Use grid-stride loop for better scalability
        if (i >= idx && i % incy == 0) {
            result[i] = cosf(dy[i]); // Compute cosf for valid indices
        }
    }
}