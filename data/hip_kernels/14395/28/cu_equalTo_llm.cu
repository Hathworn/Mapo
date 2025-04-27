#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cu_equalTo(const float* __restrict__ src, float* __restrict__ dst, const float val, const int n) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use loop unrolling for better performance
    while (tid < n) {
        if (src[tid] == val) {
            dst[tid] = 1.0;
        } else {
            dst[tid] = 0.0;
        }
        tid += stride;

        if (tid < n) {
            if (src[tid] == val) {
                dst[tid] = 1.0;
            } else {
                dst[tid] = 0.0;
            }
            tid += stride;
        }

        if (tid < n) {
            if (src[tid] == val) {
                dst[tid] = 1.0;
            } else {
                dst[tid] = 0.0;
            }
            tid += stride;
        }

        if (tid < n) {
            if (src[tid] == val) {
                dst[tid] = 1.0;
            } else {
                dst[tid] = 0.0;
            }
            tid += stride;
        }
    }
}