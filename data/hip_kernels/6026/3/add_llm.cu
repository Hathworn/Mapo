#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int n, float *a, float *b, float *sum) {
    // Unrolling the loop for better performance (assuming n is a multiple of 4)
    int i = blockIdx.x * blockDim.x + threadIdx.x * 4;
    if (i + 3 < n) {
        sum[i] = a[i] + b[i];
        sum[i + 1] = a[i + 1] + b[i + 1];
        sum[i + 2] = a[i + 2] + b[i + 2];
        sum[i + 3] = a[i + 3] + b[i + 3];
    }
    // Handle remaining elements
    for (int j = i; j < n && j < i + 4; j++) {
        sum[j] = a[j] + b[j];
    }
}