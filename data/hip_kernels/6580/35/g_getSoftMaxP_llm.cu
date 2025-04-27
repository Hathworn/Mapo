```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void g_getSoftMaxP(float* softMaxP, float* b, int cols, int row) {
    int bid = blockIdx.x;
    extern __shared__ float _share[];
    float* _max = _share;
    float* _sum = _share + blockDim.x;
    float* sp = softMaxP + bid * cols;

    // Initialize shared memory
    _sum[threadIdx.x] = 0.0f;
    _max[threadIdx.x] = -100000000.0f;

    // Find maximum value for the row
    for (int tid = threadIdx.x; tid < cols; tid += blockDim.x) {
        int index = bid * cols + tid;
        sp[tid] = b[index];
        _max[threadIdx.x] = max(_max[threadIdx.x], sp[tid]);
    }
    __syncthreads();

    // Reduce max values
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            _max[threadIdx.x] = max(_max[threadIdx.x], _max[threadIdx.x + offset]);
        }
        __syncthreads();
    }

    // Subtract max, exponentiate, and compute sum
    for (int tid = threadIdx.x; tid < cols; tid += blockDim.x) {
        sp[tid] = __expf(sp[tid] - _max[0]);
        _sum[threadIdx.x] += sp[tid];
    }
    __syncthreads();

    // Reduce sum values
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            _sum[threadIdx.x] += _sum[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // Normalize the softmax probabilities
    for (int tid = threadIdx.x; tid < cols; tid += blockDim.x) {
        sp[tid] /= _sum[0];
    }
}