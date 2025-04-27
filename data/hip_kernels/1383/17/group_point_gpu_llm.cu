#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    int batchIndex = blockIdx.x;
    int threadIndex = threadIdx.x;

    points += n * c * batchIndex;
    idx += m * nsample * batchIndex;
    out += m * nsample * c * batchIndex;
    
    // Assigning each thread to handle a single sample from m * nsample
    int globalIndex = threadIndex;
    while (globalIndex < m * nsample) {
        int j = globalIndex / nsample;
        int k = globalIndex % nsample;
        int ii = idx[j * nsample + k];
        for (int l = 0; l < c; ++l) {
            out[j * nsample * c + k * c + l] = points[ii * c + l];
        }
        globalIndex += blockDim.x;
    }
}