#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    int batch_index = blockIdx.x;
    points += n * c * batch_index;
    idx += m * nsample * batch_index;
    out += m * nsample * c * batch_index;

    int index = threadIdx.x;
    int stride = blockDim.x;

    // Use shared memory for repeated access to reduce global memory access
    extern __shared__ float shared_points[];

    for (int j = index; j < m; j += stride) {
        for (int k = 0; k < nsample; ++k) {
            int ii = idx[j * nsample + k];
            
            // Load points into shared memory
            for (int l = threadIdx.x; l < c; l += stride) {
                shared_points[threadIdx.x] = points[ii * c + l];
            }
            __syncthreads();

            // Copy from shared memory to output
            for (int l = 0; l < c; ++l) {
                out[j * nsample * c + k * c + l] = shared_points[l];
            }
        }
    }
}