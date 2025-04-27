```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void calculateFinal(int n, int *intermediates0, double *intermediates1, double *intermediates2, int *s0, double *s1, double *s2, int k, int d){

    // Check if blockIdx.x is 0 to ensure only one block is active
    if (blockIdx.x > 0) return;

    // Cache some frequently used data in registers
    int thread_x = threadIdx.x;
    int thread_y = threadIdx.y;
    int blockDim_y = blockDim.y;
    int blockDim_x = blockDim.x;

    // Loop for every cluster
    for (int clust = thread_y; clust < k; clust += blockDim_y){
        // Loop for every dimension (features)
        for (int dim = thread_x; dim < d; dim += blockDim_x) {

            // Calculate S0 - Only sum counts where dim is 0
            if (dim == 0) {
                int clustIndex = clust;
                // Unroll loop to minimize index calculations
                for (int z = clustIndex; z < 450 * k; z += k) {
                    s0[clust] += intermediates0[z];
                }
            }

            // Calculate S1 and S2
            int start = clust * d + dim;
            int kd = k * d;
            double *s1cur = &intermediates1[start];
            double *s2cur = &intermediates2[start];
            double tempS1 = 0.0;
            double tempS2 = 0.0;

            // Unroll loop for faster memory access
            double *s1end = s1cur + 450 * kd;
            for (; s1cur < s1end; s1cur += kd, s2cur += kd)
            {
                tempS1 += *s1cur;
                tempS2 += *s2cur;
            }
            s1[start] = tempS1;
            s2[start] = tempS2;
        }
    }
}