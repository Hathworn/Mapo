#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void exp_float(int n, int idx, float *dy, int incy, float *result) {
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Check bounds and condition
    if (i < n && i >= idx && i % incy == 0) {
        // Perform the exponentiation
        result[i] = expf(dy[i]);
    }
}