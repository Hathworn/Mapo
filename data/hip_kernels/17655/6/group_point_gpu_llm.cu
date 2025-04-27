#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    int batch_index = blockIdx.x;
    points += n * c * batch_index;
    idx += m * nsample * batch_index;
    out += m * nsample * c * batch_index;
    
    int index = threadIdx.x + blockDim.x * blockIdx.y; // Use 2D grid for better parallelization
    int stride = blockDim.x * gridDim.y;
    
    for (int j = index; j < m * nsample; j += stride) { // Unroll nested loops for efficiency
        int j_idx = j / nsample;
        int k_idx = j % nsample;
        int ii = idx[j_idx * nsample + k_idx];
        for (int l = 0; l < c; ++l) {
            out[j_idx * nsample * c + k_idx * c + l] = points[ii * c + l];
        }
    }
}