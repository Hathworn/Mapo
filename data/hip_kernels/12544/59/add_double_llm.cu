#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void add_double(int n, double *a, double *b, double *sum) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Add stride for grid-stride loop
    for (; i < n; i += stride) { // Use grid-stride loop for better utilization
        sum[i] = a[i] + b[i];
    }
}