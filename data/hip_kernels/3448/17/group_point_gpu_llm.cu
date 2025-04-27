#include "hip/hip_runtime.h"
#include "includes.h"

// Macro definitions would go here if there are any

__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    int batch_index = blockIdx.x;
    int thread_index = threadIdx.x;

    points += n * c * batch_index;  // Move points pointer to the current batch
    idx += m * nsample * batch_index;  // Move idx pointer to the current batch
    out += m * nsample * c * batch_index;  // Move out pointer to the current batch

    // Optimize loop by unrolling
    for (int j = thread_index; j < m; j += blockDim.x) {
        for (int k = 0; k < nsample; ++k) {
            int ii = idx[j * nsample + k];
            #pragma unroll 4  // Unroll the innermost loop for better performance
            for (int l = 0; l < c; ++l) {
                out[j * nsample * c + k * c + l] = points[ii * c + l];
            }
        }
    }
}