#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_grad_gpu(int b, int n, int c, int m, int nsample, const float *grad_out, const int *idx, float *grad_points) {
    // Calculate global thread ID
    int batchIdx = blockIdx.x;
    int idxStride = m * nsample;
    int gradOutStride = idxStride * c;
    int gradPointsStride = n * c;

    if (batchIdx < b) {
        grad_out += batchIdx * gradOutStride;
        idx += batchIdx * idxStride;
        grad_points += batchIdx * gradPointsStride;

        // Use shared memory to reduce memory accesses
        extern __shared__ int sharedIdx[];
        for (int j = threadIdx.x; j < idxStride; j += blockDim.x) {
            sharedIdx[j] = idx[j];
        }
        __syncthreads();

        // Optimize loop ordering and memory access
        for (int j = threadIdx.x; j < m; j += blockDim.x) {
            for (int k = 0; k < nsample; ++k) {
                int ii = sharedIdx[j * nsample + k];

                for (int l = 0; l < c; ++l) {
                    atomicAdd(&grad_points[ii * c + l], grad_out[j * nsample * c + k * c + l]);
                }
            }
        }
    }
}