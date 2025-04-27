#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    int batch_index = blockIdx.x;
    points += n * c * batch_index;
    idx += m * nsample * batch_index;
    out += m * nsample * c * batch_index;
    
    int index = threadIdx.x + blockIdx.y * blockDim.x;  // Use 2D grid for better mapping
    int stride = blockDim.x * gridDim.y;  // Adjust stride based on total threads
    
    // Unroll loops for better performance
    for (int j = index; j < m; j += stride) {
        #pragma unroll
        for (int k = 0; k < nsample; ++k) {
            int ii = idx[j * nsample + k];
            #pragma unroll
            for (int l = 0; l < c; ++l) {
                out[j * nsample * c + k * c + l] = points[ii * c + l];
            }
        }
    }
}