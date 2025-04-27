#include "hip/hip_runtime.h"
#include "includes.h"
#ifdef INFINITY
/* INFINITY is supported */
#endif

float **A, **D, *d2; //Table A distance, D minimum distance,d2 tempTable 1-d

__global__ void calc(float *d_D, int n, int k){
    // Calculate global thread indices for better hardware utilization
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure indices are within bounds to prevent out-of-bounds access
    if (i < n && j < n) {
        // Perform the core computation with reduced memory accesses
        float ik = d_D[i + k * n];
        float kj = d_D[k + j * n];
        float ij = d_D[i + j * n];
        
        if (ij > ik + kj) {
            d_D[i + j * n] = ik + kj;
        }
    }
}