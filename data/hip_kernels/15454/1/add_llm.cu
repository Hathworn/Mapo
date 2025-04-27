#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int n, float a, float *x, float *y) {
    // Calculate index and stride for better utilization of threads
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use loop to handle larger data sizes
    for (int i = index; i < n; i += stride) {
        y[i] = a * x[i] + y[i];
    }
}