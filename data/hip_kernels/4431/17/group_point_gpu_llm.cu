#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    // Utilize blockIdx.x for parallel execution across batches
    int batch = blockIdx.x;
    int index = threadIdx.x;
    
    // Increment pointers based on batch number and thread index
    points += n * c * batch;
    idx += m * nsample * batch;
    out += m * nsample * c * batch;

    // Iterate over each sample and channel using parallel threads
    for (int j = index; j < m; j += blockDim.x) { // Parallelize outer loop
        for (int k = 0; k < nsample; ++k) {
            int ii = idx[j * nsample + k];
            for (int l = 0; l < c; ++l) {
                // Copy data from points to out
                out[j * nsample * c + k * c + l] = points[ii * c + l];
            }
        }
    }
}