#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_grad_gpu(int b, int n, int c, int m, int nsample, const float *grad_out, const int *idx, float *grad_points) {
    // Calculate global thread ID
    int batch_idx = blockIdx.x;
    int point_idx = threadIdx.x;

    if (batch_idx < b && point_idx < m * nsample) {
        // Calculate the sample index within the batch
        int sample_idx = point_idx;
        
        // Get the point index from indices
        int ii = idx[sample_idx];
        
        // Use a loop to accumulate the gradients for the channels
        for (int l = 0; l < c; ++l) {
            atomicAdd(&grad_points[ii * c + l], grad_out[sample_idx * c + l]);
        }
    }
}