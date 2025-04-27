#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= b) return; // Ensure the index does not exceed bounds

    points += n * c * index;
    idx += m * nsample * index;
    out += m * nsample * c * index;

    // Loop unrolling for better performance
    for (int j = 0; j < m; ++j) {
        int j_offset_out = j * nsample * c;
        int j_offset_idx = j * nsample;
        for (int k = 0; k < nsample; ++k) {
            int ii = idx[j_offset_idx + k];
            int k_offset_out = k * c;
            for (int l = 0; l < c; ++l) {
                out[j_offset_out + k_offset_out + l] = points[ii * c + l];
            }
        }
    }
}