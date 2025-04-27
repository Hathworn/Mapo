#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void all_dots(int n, int k, double* data_dots, double* centroid_dots, double* dots) {
    __shared__ double local_data_dots[32];
    __shared__ double local_centroid_dots[32];

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    
    int data_index = tx + blockIdx.x * blockDim.x;
    int centroid_index = ty + blockIdx.y * blockDim.y;

    // Load data_dots into shared memory by the first warp
    if (data_index < n && ty == 0) {
        local_data_dots[tx] = data_dots[data_index];
    }
    // Load centroid_dots into shared memory by the second warp
    if (centroid_index < k && ty == 1) {
        local_centroid_dots[tx] = centroid_dots[centroid_index];
    }

    __syncthreads();

    // Calculate dots using shared memory
    if (data_index < n && centroid_index < k) {
        dots[data_index + centroid_index * n] = local_data_dots[tx] + local_centroid_dots[ty];
    }
}