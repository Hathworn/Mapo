#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    int batch_index = blockIdx.x;
    int index = threadIdx.x;
    
    // Calculate offset for batch
    points += n * c * batch_index;
    idx += m * nsample * batch_index;
    out += m * nsample * c * batch_index;
    
    // Use parallel threads over samples in each iteration
    for (int j = 0; j < m; ++j) {
        for (int l = 0; l < c; ++l) {
            for (int k = index; k < nsample; k += blockDim.x) {
                int ii = idx[j * nsample + k];
                out[j * nsample * c + k * c + l] = points[ii * c + l];
            }
        }
    }
}