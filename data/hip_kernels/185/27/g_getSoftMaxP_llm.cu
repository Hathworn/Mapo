#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void g_getSoftMaxP(float* softMaxP, float* b, int cols) {
    int bid = blockIdx.x;
    extern __shared__ float _share[];
    float* _max = _share;
    float* _sum = _share + blockDim.x;
    float* sp = softMaxP + bid * cols;

    // Initialize shared memory values
    _sum[threadIdx.x] = 0.0;
    _max[threadIdx.x] = -FLT_MAX;

    // Calculate max and accumulate sum
    for (int tid = threadIdx.x; tid < cols; tid += blockDim.x) {
        sp[tid] += b[tid];
        _max[threadIdx.x] = max(_max[threadIdx.x], sp[tid]);
    }
    __syncthreads();

    // Reduce to find global max
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            _max[threadIdx.x] = max(_max[threadIdx.x], _max[threadIdx.x + stride]);
        }
        __syncthreads();
    }

    // Normalize and exponentiate
    float max_val = _max[0];
    for (int tid = threadIdx.x; tid < cols; tid += blockDim.x) {
        sp[tid] -= max_val;
        sp[tid] = __expf(sp[tid]);
        _sum[threadIdx.x] += sp[tid];
    }
    __syncthreads();

    // Reduce to find global sum
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            _sum[threadIdx.x] += _sum[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Final normalization
    float sum_val = _sum[0];
    for (int tid = threadIdx.x; tid < cols; tid += blockDim.x) {
        sp[tid] /= sum_val;
    }
}