#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void euclideanDistance(const float *data_a, int nrow_a, const float *data_b, int nrow_b, int ncol, float *ans)
{
    // Optimize thread indexing for coalesced memory access
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    if(i < nrow_a && j < nrow_b) {
        int off_a = i;
        int off_b = j;
        float sum = 0;
        
        // Loop unrolling for optimization
        int k = 0;
        for(; k <= ncol - 4; k += 4, off_a += 4 * nrow_a, off_b += 4 * nrow_b) {
            float tmp1 = data_a[off_a] - data_b[off_b];
            float tmp2 = data_a[off_a + nrow_a] - data_b[off_b + nrow_b];
            float tmp3 = data_a[off_a + 2 * nrow_a] - data_b[off_b + 2 * nrow_b];
            float tmp4 = data_a[off_a + 3 * nrow_a] - data_b[off_b + 3 * nrow_b];
            sum += tmp1 * tmp1 + tmp2 * tmp2 + tmp3 * tmp3 + tmp4 * tmp4;
        }
        
        // Handling the remaining elements
        for(; k < ncol; k++, off_a += nrow_a, off_b += nrow_b) {
            float tmp = data_a[off_a] - data_b[off_b];
            sum += tmp * tmp;
        }
        ans[i + j * nrow_a] = sqrt(sum);
    }
}