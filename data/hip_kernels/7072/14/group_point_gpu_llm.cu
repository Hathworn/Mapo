#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    // Calculate global thread index
    int batch_idx = blockIdx.x;
    int sample_idx = threadIdx.x;

    if (batch_idx < b && sample_idx < nsample * c) {
        int j = sample_idx / c;
        int k = (sample_idx % c);

        for (int i = batch_idx; i < b; i += gridDim.x) {
            if(j < m) {
                int ii = idx[j * nsample + k / c]; // Index calculation based on sample
                int l = k % c;
                out[j * nsample * c + k] = points[ii * c + l];
            }
        }
    }
}