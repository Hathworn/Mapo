#include "hip/hip_runtime.h"
#include "includes.h"
#ifdef INFINITY
/* INFINITY is supported */
#endif

float **A, **D, *d2; // Table A distance, D minimum distance, d2 tempTable 1-d

__global__ void calc(float *d_D, int n, int k) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure i and j are within bounds
    if (i < n && j < n) {
        float new_dist = d_D[i + k * n] + d_D[k + j * n];
        // Use local variable to minimize global memory access
        float current_dist = d_D[i + j * n];
        if (current_dist > new_dist) {
            d_D[i + j * n] = new_dist;
        }
    }
}