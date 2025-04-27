#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calc(float *d_D, int n, int k) {
    __shared__ float s_d[4*3*256]; // Shared table within a block
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculation of i and j
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    int b_index = 4 * 3 * (threadIdx.x + blockDim.x * threadIdx.y); // Shared mem index
    int istep = blockDim.x * gridDim.x, jstep = blockDim.y * gridDim.y;
    
    int l, m, v = 0;
    
    // Loop unrolling for loading data into shared memory
    #pragma unroll
    for (l = 0; l < 2; l++) {
        #pragma unroll
        for (m = 0; m < 2; m++) {
            s_d[b_index + 3 * v] = d_D[(i + l * istep) + (j + m * jstep) * n];
            s_d[b_index + (3 * v + 1)] = d_D[(i + l * istep) + k * n];
            s_d[b_index + (3 * v + 2)] = d_D[k + (j + m * jstep) * n];
            v++;
        }
    }
    
    // Compute new cell values with branchless conditional logic
    #pragma unroll
    for (v = 0; v < 4; v++) {
        float sum = s_d[b_index + (3 * v + 1)] + s_d[b_index + (3 * v + 2)];
        float original = s_d[b_index + 3 * v];
        s_d[b_index + 3 * v] = fminf(original, sum); // Use fminf intrinsic for branchless min
    }
    
    v = 0;
    // Loop unrolling for storing data back to global memory
    #pragma unroll
    for (l = 0; l < 2; l++) {
        #pragma unroll
        for (m = 0; m < 2; m++) {
            d_D[(i + l * istep) + (j + m * jstep) * n] = s_d[b_index + 3 * v];
            v++;
        }
    }
}