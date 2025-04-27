#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    // Calculate the global thread index
    int batch_index = blockIdx.x;
    int thread_index = threadIdx.x;
    int index = batch_index * blockDim.x + thread_index;

    if (index >= b) return;  // Early exit for out-of-bounds threads

    // Adjust pointers for this batch
    points += n * c * index;
    idx += m * nsample * index;
    out += m * nsample * c * index;

    for (int j = 0; j < m; ++j) {
        for (int k = 0; k < nsample; ++k) {
            int ii = idx[j * nsample + k];
            for (int l = 0; l < c; ++l) {
                out[j * nsample * c + k * c + l] = points[ii * c + l];  // Copy points to output
            }
        }
    }
}