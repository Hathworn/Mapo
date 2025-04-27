#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel0(int n, float a, float *x, float *y) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < n) {
        y[i] = fmaf(a, x[i], y[i]);  // Use fmaf for better performance and precision
    }
}