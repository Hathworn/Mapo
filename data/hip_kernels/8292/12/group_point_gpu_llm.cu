#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    int batch_index = blockIdx.x;
    points += n * c * batch_index;
    idx += m * nsample * batch_index;
    out += m * nsample * c * batch_index;

    int index = threadIdx.x + blockIdx.y * blockDim.x; // Combine blockDim.y for more threads
    int stride = blockDim.x * gridDim.y; // Update stride for new configuration

    // Loop with new stride to utilize more threads
    for (int j = index; j < m * nsample; j += stride) {
        int sample_idx = j % nsample;
        int out_idx = j * c;
        int ii = idx[out_idx];
        for (int l = 0; l < c; ++l) {
            out[out_idx + l] = points[ii * c + l];
        }
    }
}