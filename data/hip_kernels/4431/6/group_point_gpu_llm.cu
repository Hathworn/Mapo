#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    int batch_index = blockIdx.x;
    points += n*c*batch_index;
    idx += m*nsample*batch_index;
    out += m*nsample*c*batch_index;

    int index = threadIdx.x;
    int stride = blockDim.x;

    // Use shared memory to improve memory access speed
    extern __shared__ int shared_idx[];

    for (int j=index; j<m; j+=stride) {
        for (int k=0; k<nsample; ++k) {
            shared_idx[threadIdx.x * nsample + k] = idx[j*nsample + k];
        }
        __syncthreads(); // Synchronize threads to ensure all indices are loaded

        for (int k=0; k<nsample; ++k) {
            int ii = shared_idx[threadIdx.x * nsample + k];
            for (int l=0; l<c; ++l) {
                out[j*nsample*c+k*c+l] = points[ii*c+l];
            }
        }
        __syncthreads(); // Ensure all operations are done before moving to next for
    }
}