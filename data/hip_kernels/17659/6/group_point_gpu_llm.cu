#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    // Calculate the batch offset for current block
    int batch_index = blockIdx.x;
    points += n*c*batch_index;
    idx += m*nsample*batch_index;
    out += m*nsample*c*batch_index;

    // Calculate the global thread ID
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int total_threads = gridDim.x * blockDim.x;

    // Loop across all samples using the global thread ID for coalesced memory access
    for (int j = index; j < m * nsample; j += total_threads) {
        int sample_index = j / nsample;
        int nsample_index = j % nsample;
        int ii = idx[sample_index * nsample + nsample_index];
        
        // Directly copy the vector of `c` dimension
        for (int l = 0; l < c; ++l) {
            out[sample_index * nsample * c + nsample_index * c + l] = points[ii * c + l];
        }
    }
}