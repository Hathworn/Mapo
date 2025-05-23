#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void all_dots(int n, int k, double* data_dots, double* centroid_dots, double* dots) {
    // Use shared memory to minimize global memory access
    __shared__ double local_data_dots[32];
    __shared__ double local_centroid_dots[32];

    int data_index = threadIdx.x + blockIdx.x * blockDim.x;
    int centroid_index = threadIdx.y + blockIdx.y * blockDim.y;

    // Load data_dots into shared memory if within bounds
    if ((data_index < n) && (threadIdx.y == 0)) {
        local_data_dots[threadIdx.x] = data_dots[data_index];
    }

    // Load centroid_dots into shared memory if within bounds
    if ((centroid_index < k) && (threadIdx.x == 0)) {
        local_centroid_dots[threadIdx.y] = centroid_dots[centroid_index];
    }

    __syncthreads();

    // Calculate dot product if within bounds
    if ((data_index < n) && (centroid_index < k)) {
        dots[data_index + centroid_index * n] = local_data_dots[threadIdx.x] +
                                                local_centroid_dots[threadIdx.y];
    }
}