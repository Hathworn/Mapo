#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matadd_2d(const float *a, const float *b, float *c, int n, int m){
    // Calculate global thread index for 2D grid
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int j = blockDim.y * blockIdx.y + threadIdx.y;
    // Check bounds for both dimensions
    if(i < n && j < m){
        int idx = j * n + i;
        // Perform addition
        c[idx] = a[idx] + b[idx];
    }
}