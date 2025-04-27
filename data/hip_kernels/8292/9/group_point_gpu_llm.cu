#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    // Calculate global index
    int batch_idx = blockIdx.x;
    int m_idx = blockIdx.y;
    int sample_idx = threadIdx.x;

    if (batch_idx < b && m_idx < m && sample_idx < nsample) {
        int ii = idx[m_idx * nsample + sample_idx];
        
        // Unroll the loop over 'c' where possible and use shared memory if necessary
        for (int l = 0; l < c; ++l) {
            out[m_idx * nsample * c + sample_idx * c + l] = points[ii * c + l];
        }
    }
}