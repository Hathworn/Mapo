#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _mat_sum_col(float *m, float *target, int nrow, int ncol) {
    // Use shared memory to improve memory access efficiency
    extern __shared__ float shared_sum[];

    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    if(tid < ncol) {
        float sum = 0.0f;

        for (int i = threadIdx.x; i < nrow; i += blockDim.x) {
            sum += m[i * ncol + tid];
        }

        shared_sum[threadIdx.x] = sum;
        __syncthreads(); // Synchronize threads within block

        // Reduce using shared memory
        if (threadIdx.x == 0) {
            float total_sum = 0.0f;
            for (int i = 0; i < blockDim.x; ++i) {
                total_sum += shared_sum[i];
            }
            target[tid] = total_sum;
        }
    }
}