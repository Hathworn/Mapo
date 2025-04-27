#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_grad_gpu(int b, int n, int c, int m, int nsample, const float *grad_out, const int *idx, float *grad_points) {
    extern __shared__ float shared_grad_out[];
    
    int batch_index = blockIdx.x;
    idx += m * nsample * batch_index;
    grad_out += m * nsample * c * batch_index;
    grad_points += n * c * batch_index;

    int index = threadIdx.x;
    int stride = blockDim.x;
    int j_stride = index + blockIdx.y * stride; // Spread by blockIdx.y for better parallelism

    for (int j = j_stride; j < m; j += stride * gridDim.y) { // Grid-stride loop
        for (int k = 0; k < nsample; ++k) {
            int ii = idx[j * nsample + k];
            for (int l = threadIdx.z; l < c; l += blockDim.z) { // Spread computation across z-dimension
                // Load grad_out into shared memory
                shared_grad_out[threadIdx.x * nsample * c + k * c + l] = grad_out[j * nsample * c + k * c + l];
                __syncthreads();

                // Use shared memory to reduce global memory access latency
                atomicAdd(&grad_points[ii * c + l], shared_grad_out[threadIdx.x * nsample * c + k * c + l]);
            }
        }
    }
}