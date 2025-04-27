#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void init_row_perm(int *d_permutation, int M)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unrolling the loop for performance improvement
    if (i < M) {
        d_permutation[i] = i;
        if (i + blockDim.x < M) {
            d_permutation[i + blockDim.x] = i + blockDim.x;
            if (i + 2 * blockDim.x < M) {
                d_permutation[i + 2 * blockDim.x] = i + 2 * blockDim.x;
                if (i + 3 * blockDim.x < M) {
                    d_permutation[i + 3 * blockDim.x] = i + 3 * blockDim.x;
                }
            }
        }
    }
}