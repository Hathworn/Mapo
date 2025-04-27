#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_grad_gpu(int b, int n, int c, int m, int nsample, const float *grad_out, const int *idx, float *grad_points) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int total_threads = gridDim.x * blockDim.x;

    // Loop over points handled by each thread using a stride approach
    for (int id = index; id < b * m; id += total_threads) {
        int batch = id / m;
        int j = id % m;

        const int *idx_ptr = idx + (batch * m + j) * nsample;
        const float *grad_out_ptr = grad_out + ((batch * m + j) * nsample * c);
        float *grad_points_ptr = grad_points + batch * n * c;

        for (int k = 0; k < nsample; ++k) {
            int ii = idx_ptr[k];
            for (int l = 0; l < c; ++l) {
                atomicAdd(&grad_points_ptr[ii * c + l], grad_out_ptr[k * c + l]); // Use atomicAdd for thread safety
            }
        }
    }
}