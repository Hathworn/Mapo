#include "hip/hip_runtime.h"
#include "includes.h"

// CUDA: grid stride looping
#ifndef CUDA_KERNEL_LOOP
#define CUDA_KERNEL_LOOP(i, n) for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < (n); i += blockDim.x * gridDim.x)
#endif

__global__ void psamask_collect_forward_cuda(const int nthreads, const int feature_H_, const int feature_W_, const int mask_H_, const int mask_W_, const int half_mask_H_, const int half_mask_W_, const float* mask_data, float* buffer_data) {
    CUDA_KERNEL_LOOP(index, nthreads) {
        const int w = index % feature_W_;
        const int h = (index / feature_W_) % feature_H_;
        const int n = index / feature_W_ / feature_H_;
        
        // Effective mask region : [hstart, hend) x [wstart, wend) with mask-indexed
        const int hstart = max(0, half_mask_H_ - h);
        const int hend = min(mask_H_, feature_H_ + half_mask_H_ - h);
        const int wstart = max(0, half_mask_W_ - w);
        const int wend = min(mask_W_, feature_W_ + half_mask_W_ - w);
        
        // Precompute index offsets for efficiency
        const int feature_offset = n * feature_H_ * feature_W_;
        const int mask_offset = n * mask_H_ * mask_W_;
        
        for (int hidx = hstart; hidx < hend; hidx++) {
            for (int widx = wstart; widx < wend; widx++) {
                const int h_feature_idx = hidx + h - half_mask_H_;
                const int w_feature_idx = widx + w - half_mask_W_;
                buffer_data[(feature_offset + h_feature_idx * feature_W_ + w_feature_idx) * feature_H_ * feature_W_ + h * feature_W_ + w] =
                    mask_data[((mask_offset + hidx * mask_W_ + widx) * feature_H_ + h) * feature_W_ + w];
            }
        }
    }
}