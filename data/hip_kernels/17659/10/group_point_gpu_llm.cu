#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    // Calculate global thread indices
    int batch_index = blockIdx.z;
    int m_index = blockIdx.y * blockDim.y + threadIdx.y;
    int sample_index = blockIdx.x * blockDim.x + threadIdx.x;

    if (batch_index < b && m_index < m && sample_index < nsample) {
        int ii = idx[m_index * nsample + sample_index];
        for (int l = 0; l < c; ++l) {
            out[(m_index * nsample + sample_index) * c + l] = points[ii * c + l];
        }
    }
}