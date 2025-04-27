#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_grad_gpu(int b, int n, int c, int m, int nsample, const float *grad_out, const int *idx, float *grad_points) {
    int batch_idx = blockIdx.x; // Each block handles one batch
    int j = blockIdx.y; // Each thread block column handles one output column (m)
    int k = threadIdx.x; // Each thread handles one sample in nsample

    if (batch_idx < b && j < m && k < nsample) {
        int ii = idx[j * nsample + k];
        for (int l = 0; l < c; ++l) {
            atomicAdd(&grad_points[ii * c + l], grad_out[j * nsample * c + k * c + l]);
        }
    }
}
```
