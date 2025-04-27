#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void _bcnn_vmul_kernel(int n, float *a, float *b, float *y) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index efficiently
    int stride = blockDim.x * gridDim.x; // Calculate total stride

    // Utilize the stride for coalesced memory access
    for (; i < n; i += stride) {
        y[i] = a[i] * b[i]; // Perform vector multiplication
    }
}