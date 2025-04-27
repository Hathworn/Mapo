#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    int batch = blockIdx.x; // Use blockIdx for each batch
    int thread = threadIdx.x; // Use threadIdx for parallel execution among threads
    points += n * c * batch;
    idx += m * nsample * batch;
    out += m * nsample * c * batch;

    for (int j = thread; j < m; j += blockDim.x) { // Distribute work using thread index
        for (int k = 0; k < nsample; ++k) {
            int ii = idx[j * nsample + k];
            for (int l = 0; l < c; ++l) {
                out[j * nsample * c + k * c + l] = points[ii * c + l];
            }
        }
    }
}