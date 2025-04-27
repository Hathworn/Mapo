#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline float devIoU(const float *a, const float *b) {
    // a: [5, ] b: [5, ], ymin, xmin, ymax, xmax, score
    float w = max(0.0f, min(a[2], b[2]) - max(a[0], b[0]));
    float h = max(0.0f, min(a[3], b[3]) - max(a[1], b[1]));
    float intersect = w * h;
    float sa = (a[2] - a[0]) * (a[3] - a[1]);
    float sb = (b[2] - b[0]) * (b[3] - b[1]);
    float _union = sa + sb - intersect;
    float eps = 1e-4f;
    return intersect / (_union + eps);
}

__global__ void nms_kernel(float *bbox_dev, unsigned long long *mask_dev, int num_boxes, int col_blocks, float threshold) {
    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;

    const int row_size = min(num_boxes - by * THREADS, THREADS);
    const int col_size = min(num_boxes - bx * THREADS, THREADS);

    __shared__ float sh[THREADS * 5];

    if (tx < col_size) {
        int cols = tx + bx * THREADS;
        #pragma unroll
        for (int j = 0; j < 5; j++) {
            sh[tx * 5 + j] = bbox_dev[cols * 5 + j];
        }
    }
    __syncthreads();

    if (tx < row_size) {
        const int cur_box_idx = (by * THREADS) + tx;
        float *cur_box = bbox_dev + cur_box_idx * 5;

        int start = (bx == by) ? tx + 1 : 0;
        unsigned long long t = 0;

        // Iterate only required times for reduced warp divergence
        for (int i = start; i < col_size; i++) {
            if (devIoU(cur_box, &sh[i * 5]) >= threshold) {
                t |= (1ULL << i);
            }
        }

        const int mask_idx = cur_box_idx * col_blocks + bx;
        mask_dev[mask_idx] = t;
    }
}
```
