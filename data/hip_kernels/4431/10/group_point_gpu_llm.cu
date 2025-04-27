#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    // Calculate global thread indices
    int batch_index = blockIdx.x;
    int point_index = blockIdx.y * blockDim.y + threadIdx.y;
    int sample_index = threadIdx.x;

    // Ensure within bounds
    if (batch_index < b && point_index < m && sample_index < nsample) {
        int index = idx[point_index * nsample + sample_index];

        points += batch_index * n * c;
        out += batch_index * m * nsample * c + point_index * nsample * c + sample_index * c;

        // Copy the point data
        for (int l = 0; l < c; ++l) {
            out[l] = points[index * c + l];
        }
    }
}