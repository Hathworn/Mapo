#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void box_encode_kernel(float * targets_dx, float * targets_dy, float * targets_dw, float * targets_dh, float4 * boxes, float4 * anchors, float wx, float wy, float ww, float wh, size_t gt, size_t idxJump) {

    // Calculate global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Process elements in stride of idxJump
    for (int i = idx; i < gt; i += idxJump) {
        // Load data
        float4 curr_anchor = anchors[i];
        float4 curr_box = boxes[i];

        // Pre-compute values for transformation
        float ex_w = curr_anchor.z - curr_anchor.x + 1.0f;
        float ex_h = curr_anchor.w - curr_anchor.y + 1.0f;
        float ex_ctr_x = curr_anchor.x + 0.5f * ex_w;
        float ex_ctr_y = curr_anchor.y + 0.5f * ex_h;

        float gt_w = curr_box.z - curr_box.x + 1.0f;
        float gt_h = curr_box.w - curr_box.y + 1.0f;
        float gt_ctr_x = curr_box.x + 0.5f * gt_w;
        float gt_ctr_y = curr_box.y + 0.5f * gt_h;

        // Compute targets
        targets_dx[i] = wx * (gt_ctr_x - ex_ctr_x) / ex_w;
        targets_dy[i] = wy * (gt_ctr_y - ex_ctr_y) / ex_h;
        targets_dw[i] = ww * logf(gt_w / ex_w);
        targets_dh[i] = wh * logf(gt_h / ex_h);
    }
}