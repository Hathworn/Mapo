#include "hip/hip_runtime.h"
#include "includes.h"

// CUDA: grid stride looping
#ifndef CUDA_KERNEL_LOOP
#define CUDA_KERNEL_LOOP(i, n) for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < (n); i += blockDim.x * gridDim.x)
#endif

__global__ void psamask_distribute_backward_cuda(const int nthreads, const int feature_H_, const int feature_W_, const int mask_H_, const int mask_W_, const int half_mask_H_, const int half_mask_W_, const float* buffer_diff, float* mask_diff) {
    CUDA_KERNEL_LOOP(index, nthreads) {
        const int w = index % feature_W_;
        const int h = (index / feature_W_) % feature_H_;
        const int n = index / feature_W_ / feature_H_;
        // Precompute expressions used in the loops to avoid recalculations.
        int indexOffset = (n * feature_H_ * feature_W_ + h * feature_W_ + w) * feature_H_ * feature_W_ - half_mask_H_ * feature_W_ - half_mask_W_;
        const int hstart = max(0, half_mask_H_ - h);
        const int hend = min(mask_H_, feature_H_ + half_mask_H_ - h);
        const int wstart = max(0, half_mask_W_ - w);
        const int wend = min(mask_W_, feature_W_ + half_mask_W_ - w);

        for (int hidx = hstart; hidx < hend; ++hidx) {
            for (int widx = wstart; widx < wend; ++widx) {
                mask_diff[((n * mask_H_ * mask_W_ + hidx * mask_W_ + widx) * feature_H_ + h) * feature_W_ + w] =
                    buffer_diff[indexOffset + (hidx + h) * feature_W_ + (widx + w)];
            }
        }
    }
}