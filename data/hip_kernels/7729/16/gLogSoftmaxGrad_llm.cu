#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gLogSoftmaxGrad(float* grad, const float* adj, const float* val, const int rows, const int cols) {
    for(int bid = blockIdx.x; bid < rows; bid += gridDim.x) {  // Use blockIdx.x as loop start
        if(bid < rows) {
            extern __shared__ float _share[];
            float* _sum = _share;
            
            float* gradRow = grad + bid * cols;
            const float* adjRow = adj + bid * cols;
            const float* valRow = val + bid * cols;

            float sum = 0.0;  // Use a local register for sum

            for(int tid = threadIdx.x; tid < cols; tid += blockDim.x) {  // Utilize thread index properly
                sum += adjRow[tid];
            }
            
            // Reduction
            atomicAdd(&_sum[0], sum);
            __syncthreads();  // Ensure reduction completion
            
            // Compute gradient using local sum
            for(int tid = threadIdx.x; tid < cols; tid += blockDim.x) {
                gradRow[tid] += adjRow[tid] - (expf(valRow[tid]) * _sum[0]);
            }
        }
    }
}