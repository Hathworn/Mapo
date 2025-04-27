#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_linear(float* softmaxP, float* b, int rows, int cols) {
    int tid = threadIdx.x;
    int bid = blockIdx.x;
    int gid = tid + blockDim.x * bid;

    extern __shared__ float _share[];

    if (gid < rows * cols) {
        // Load data into shared memory
        float val = b[gid];
        _share[tid] = val;
        __syncthreads();

        // Compute max
        float _max = val;
        for (int offset = 1; offset < blockDim.x; offset <<= 1) {
            if (tid + offset < rows) {
                _max = max(_max, _share[tid + offset]);
            }
        }
        __syncthreads();

        // Compute exponentials and sum
        float exp_val = __expf(_share[tid] - _max);
        _share[tid] = exp_val;
        sum = exp_val;
        
        for (int offset = 1; offset < blockDim.x; offset <<= 1) {
            if (tid + offset < rows) {
                sum += _share[tid + offset];
            }
        }
        __syncthreads();

        // Write results to output
        softmaxP[gid] = _share[tid] / sum;
    }
}