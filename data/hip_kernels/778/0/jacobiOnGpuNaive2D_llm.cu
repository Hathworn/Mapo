#include "hip/hip_runtime.h"
#include "includes.h"
#define DEBUG 0

__global__ void jacobiOnGpuNaive2D(double *MatA, double *d_MatC, int dim_x, int dim_y, int iter_max) {
    unsigned long long int i = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned long long int j = blockDim.y * blockIdx.y + threadIdx.y * 4;
    unsigned long long int index = i * dim_y + j;

    // Cache boundary conditions
    bool within_bounds = (i > 0 && j > 0 && i < (dim_x - 1) && j < (dim_y - 1));

    for (int k = 0; k < iter_max; k++) {
        if (within_bounds) {
            d_MatC[index] = 0.25 * (MatA[(i-1) * dim_y + j] + MatA[(i+1) * dim_y + j] + 
                                    MatA[i * dim_y + (j-1)] + MatA[i * dim_y + (j+1)]);
            // Reduce index calculation by using local variable with unrolling
            for (int offset = 1; offset <= 3; ++offset) {
                unsigned long long int idx = index - offset;
                d_MatC[idx] = 0.25 * (MatA[idx + 1] + MatA[idx - 1] + 
                                      MatA[idx + dim_y] + MatA[idx - dim_y]);
            }

            if (DEBUG) {
                printf("index %llu %llu %llu %llu\n", index, index - 3, index - 2, index - 1);
            }
        }
        __syncthreads();
        if (index < dim_x * dim_y) MatA[index] = d_MatC[index];
    }
}