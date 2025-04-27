#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    int batch_index = blockIdx.x;
    points += n * c * batch_index;
    idx += m * nsample * batch_index;
    out += m * nsample * c * batch_index;

    int index = threadIdx.x;
    int stride = blockDim.x;
    int j = index;

    // Iterate over potentially large dimensions in parallel
    while (j < m) {
        for (int k = 0; k < nsample; ++k) {
            int ii = idx[j * nsample + k];
            #pragma unroll  // Unroll the loop for better memory access patterns
            for (int l = 0; l < c; ++l) {
                out[j * nsample * c + k * c + l] = points[ii * c + l];
            }
        }
        j += stride;
    }
}