#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    int batch_index = blockIdx.x;
    points += n * c * batch_index;
    idx += m * nsample * batch_index;
    out += m * nsample * c * batch_index;

    int index = threadIdx.x;
    int stride = blockDim.x;

    for (int j = index; j < m; j += stride) {
        for (int k = 0; k < nsample; ++k) {
            int ii = idx[j * nsample + k];
            const float* point_ptr = &points[ii * c]; // Precompute point address
            float* out_ptr = &out[j * nsample * c + k * c]; // Precompute output address

            for (int l = 0; l < c; ++l) {
                out_ptr[l] = point_ptr[l]; // Use precomputed addresses
            }
        }
    }
}