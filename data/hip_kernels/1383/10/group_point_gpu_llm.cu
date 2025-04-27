#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    int batch_idx = blockIdx.x; // Assign batch index to each block
    int sample_idx = threadIdx.x; // Assign sample index to each thread

    if (batch_idx < b && sample_idx < nsample * m) {
        int j = sample_idx / nsample; // Calculate m index
        int k = sample_idx % nsample; // Calculate nsample index

        int ii = idx[j * nsample + k]; // Get index from idx array

        for (int l = 0; l < c; ++l) { // Unroll innermost loop for better ILP
            out[j * nsample * c + k * c + l] = points[ii * c + l];
        }
    }
}