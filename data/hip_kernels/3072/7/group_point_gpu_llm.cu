```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    int batch_index = blockIdx.x;
    points += n * c * batch_index;
    idx += m * nsample * batch_index;
    out += m * nsample * c * batch_index;

    int index = threadIdx.x;
    int stride = blockDim.x;

    // Unroll loop j for better parallel execution and memory access optimization
    for (int j = index; j < m; j += stride) {
        int base_out_idx = j * nsample * c;
        int base_idx = j * nsample;
        for (int k = 0; k < nsample; ++k) {
            int ii = idx[base_idx + k];
            int base_points_idx = ii * c;
            int base_out_sample_idx = base_out_idx + k * c;
            for (int l = 0; l < c; ++l) {
                out[base_out_sample_idx + l] = points[base_points_idx + l];
            }
        }
    }
}