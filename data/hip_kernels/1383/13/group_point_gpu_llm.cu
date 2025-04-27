#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    int batch_index = blockIdx.x;
    points += n * c * batch_index;
    idx += m * nsample * batch_index;
    out += m * nsample * c * batch_index;

    int j = blockIdx.y * blockDim.x + threadIdx.x;  // Use 2D grid to map threads to 'j' for reduced iterations

    if (j < m) {  // Check to ensure 'j' doesn't exceed bounds
        for (int k = 0; k < nsample; ++k) {
            int ii = idx[j * nsample + k];
            for (int l = 0; l < c; ++l) {
                out[j * nsample * c + k * c + l] = points[ii * c + l];
            }
        }
    }
}
```
