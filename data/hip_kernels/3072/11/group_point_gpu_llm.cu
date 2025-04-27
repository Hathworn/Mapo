#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    int batch_idx = blockIdx.x;
    int sample_idx = threadIdx.x;

    if (batch_idx < b && sample_idx < m * nsample) {
        int j = sample_idx / nsample; // Calculate m index
        int k = sample_idx % nsample; // Calculate nsample index
        int ii = idx[j * nsample + k];
        for (int l = 0; l < c; ++l) {
            // Direct indexing using calculated indices
            out[j * nsample * c + k * c + l] = points[ii * c + l];
        }
    }
}