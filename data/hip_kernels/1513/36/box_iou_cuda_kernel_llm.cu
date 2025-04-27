#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void box_iou_cuda_kernel(float *box_iou, float4 *box1, float4 *box2, long M, long N, int idxJump) {

    // Calculate global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop over stride to alleviate thread divergence and utilize the GPU efficiently
    for (long i = idx; i < M * N; i += idxJump) {

        size_t b1_idx = i / N;
        size_t b2_idx = i % N;

        // Load box coordinates from global memory
        float4 b1 = box1[b1_idx];
        float4 b2 = box2[b2_idx];

        // Compute intersection box coordinates
        float x_tl = fmaxf(b1.x, b2.x);
        float y_tl = fmaxf(b1.y, b2.y);
        float x_br = fminf(b1.z, b2.z);
        float y_br = fminf(b1.w, b2.w);

        // Compute intersection width and height
        float w = fmaxf(0.0f, x_br - x_tl + 1);
        float h = fmaxf(0.0f, y_br - y_tl + 1);

        // Compute intersection area
        float inter = w * h;

        // Compute both box areas
        float area1 = (b1.z - b1.x + 1) * (b1.w - b1.y + 1);
        float area2 = (b2.z - b2.x + 1) * (b2.w - b2.y + 1);

        // Calculate IoU
        float iou = inter / (area1 + area2 - inter);

        // Write the result to global memory
        box_iou[b1_idx * N + b2_idx] = iou;
    }
}