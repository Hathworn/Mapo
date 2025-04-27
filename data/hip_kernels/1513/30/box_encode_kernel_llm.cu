#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void box_encode_kernel(float *targets_dx, float *targets_dy, float *targets_dw, float *targets_dh, float4 *boxes, float4 *anchors, float wx, float wy, float ww, float wh, size_t gt, size_t idxJump) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory for faster repeated access
    __shared__ float4 s_anchors[BLOCK_SIZE];
    __shared__ float4 s_boxes[BLOCK_SIZE];

    while (idx < gt) {
        // Load data into shared memory
        s_anchors[threadIdx.x] = anchors[idx];
        s_boxes[threadIdx.x] = boxes[idx];
        __syncthreads();  // Ensure all threads have loaded data
        
        // Read from shared memory
        float anchors_x1 = s_anchors[threadIdx.x].x;
        float anchors_y1 = s_anchors[threadIdx.x].y;
        float anchors_x2 = s_anchors[threadIdx.x].z;
        float anchors_y2 = s_anchors[threadIdx.x].w;

        float boxes_x1 = s_boxes[threadIdx.x].x;
        float boxes_y1 = s_boxes[threadIdx.x].y;
        float boxes_x2 = s_boxes[threadIdx.x].z;
        float boxes_y2 = s_boxes[threadIdx.x].w;

        float ex_w = anchors_x2 - anchors_x1 + 1;
        float ex_h = anchors_y2 - anchors_y1 + 1;
        float ex_ctr_x = anchors_x1 + 0.5f * ex_w;
        float ex_ctr_y = anchors_y1 + 0.5f * ex_h;

        float gt_w = boxes_x2 - boxes_x1 + 1;
        float gt_h = boxes_y2 - boxes_y1 + 1;
        float gt_ctr_x = boxes_x1 + 0.5f * gt_w;
        float gt_ctr_y = boxes_y1 + 0.5f * gt_h;

        // Reuse previously computed results
        float inv_ex_w = 1.0f / ex_w;
        float inv_ex_h = 1.0f / ex_h;

        targets_dx[idx] = wx * (gt_ctr_x - ex_ctr_x) * inv_ex_w;
        targets_dy[idx] = wy * (gt_ctr_y - ex_ctr_y) * inv_ex_h;
        targets_dw[idx] = ww * logf(gt_w * inv_ex_w);
        targets_dh[idx] = wh * logf(gt_h * inv_ex_h);

        idx += idxJump;
    }
}