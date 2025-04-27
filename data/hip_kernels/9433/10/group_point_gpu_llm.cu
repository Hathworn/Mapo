#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    int batch_idx = blockIdx.x; // Utilize thread blocks for batches
    int sample_idx = threadIdx.x; // Utilize threads within block for samples

    if (batch_idx < b && sample_idx < nsample) {
        const float* batch_points = points + batch_idx * n * c;
        const int* batch_idx_ptr = idx + batch_idx * m * nsample;
        float* batch_out = out + batch_idx * m * nsample * c;

        for (int j = 0; j < m; ++j) {
            int ii = batch_idx_ptr[j * nsample + sample_idx];
            for (int l = 0; l < c; ++l) {
                batch_out[j * nsample * c + sample_idx * c + l] = batch_points[ii * c + l];
            }
        }
    }
}