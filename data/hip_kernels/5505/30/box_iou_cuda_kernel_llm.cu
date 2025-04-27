#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void box_iou_cuda_kernel(float * box_iou, float4 * box1, float4 * box2, long M, long N, int idxJump) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (idx >= M * N) return; // Early exit if index is out of bounds

    size_t b1_idx = idx / N;
    size_t b2_idx = idx % N;

    float4 b1 = box1[b1_idx];
    float4 b2 = box2[b2_idx];

    float xmin1 = b1.x, ymin1 = b1.y, xmax1 = b1.z, ymax1 = b1.w;
    float xmin2 = b2.x, ymin2 = b2.y, xmax2 = b2.z, ymax2 = b2.w;

    // Compute inter-area dimensions
    float x_tl = fmaxf(xmin1, xmin2);
    float y_tl = fmaxf(ymin1, ymin2);
    float x_br = fminf(xmax1, xmax2);
    float y_br = fminf(ymax1, ymax2);

    float w = fmaxf(0.0f, x_br - x_tl + 1); // Width of the intersection area
    float h = fmaxf(0.0f, y_br - y_tl + 1); // Height of the intersection area

    float inter = w * h;
    float area1 = (xmax1 - xmin1 + 1) * (ymax1 - ymin1 + 1);
    float area2 = (xmax2 - xmin2 + 1) * (ymax2 - ymin2 + 1);
    float iou = inter / (area1 + area2 - inter);

    box_iou[b1_idx * N + b2_idx] = iou;
}