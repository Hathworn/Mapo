#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    int batch_index = blockIdx.x;
    int thread_index = threadIdx.x;
    int batch_stride = n * c;
    int idx_stride = m * nsample;
    int out_stride = m * nsample * c;

    points += batch_stride * batch_index;
    idx += idx_stride * batch_index;
    out += out_stride * batch_index;

    for (int j = thread_index; j < m; j += blockDim.x) {
        for (int k = 0; k < nsample; ++k) {
            int ii = idx[j * nsample + k];
            for (int l = 0; l < c; ++l) {
                out[j * nsample * c + k * c + l] = points[ii * c + l];
            }
        }
    }
}