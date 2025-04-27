#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gLogSoftmaxGrad(float* grad, const float* adj, const float* val, const int rows, const int cols) {
    // Using a single block to process multiple rows
    for (int bid = blockIdx.x; bid < rows; bid += gridDim.x) {
        int j = bid;
        if (j < rows) {
            extern __shared__ float _share[];
            float* _sum = _share;

            float* gradRow = grad + j * cols;
            const float* adjRow = adj + j * cols;
            const float* valRow = val + j * cols;

            // Reset _sum for current row
            _sum[threadIdx.x] = 0.0;
            for (int tid = threadIdx.x; tid < cols; tid += blockDim.x) {
                // Calculate partial sum using each thread
                _sum[threadIdx.x] += adjRow[tid];
            }
            __syncthreads();

            // Reduce partial sums to compute the total sum
            for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
                if (threadIdx.x < offset) {
                    _sum[threadIdx.x] += _sum[threadIdx.x + offset];
                }
                __syncthreads();
            }

            // Calculate gradient adjustments using total sum
            for (int tid = threadIdx.x; tid < cols; tid += blockDim.x) {
                gradRow[tid] += adjRow[tid] - (expf(valRow[tid]) * _sum[0]);
            }
        }
    }
}