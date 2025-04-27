#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    int batch_index = blockIdx.x;
    points += n * c * batch_index;
    idx += m * nsample * batch_index;
    out += m * nsample * c * batch_index;

    int index = threadIdx.x;
    int stride = blockDim.x;

    // Use shared memory to store points indices for better memory coalescing
    __shared__ int shared_idx[256];
    
    for (int j = index; j < m; j += stride) {
        for (int k = 0; k < nsample; ++k) {
            if (k < 256) {
                shared_idx[k] = idx[j * nsample + k]; // Load indices into shared memory
            }
            __syncthreads();
            
            // Loop through point coordinates
            for (int l = 0; l < c; ++l) {
                int ii = k < 256 ? shared_idx[k] : idx[j * nsample + k];
                out[j * nsample * c + k * c + l] = points[ii * c + l];
            }
        }
    }
}