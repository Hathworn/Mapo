#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kBoundingBoxLogisticGrad(float* mat, int* bbox, int* label, int* seg, float* indices, float* width_offset, float* height_offset, int size, int width, int height, int depth, float scale_width, float scale_height, float* grad) {
    const int image_id = threadIdx.x;
    const int col = blockIdx.x;
    const int row = blockIdx.y;
    const int color = blockIdx.z;

    if (col >= width || row >= height || image_id >= size || color >= depth) return;  // Out-of-bounds check

    int src_image_id = __ldg(&indices[image_id]);
    int src_col = __float2int_rd(scale_width * col);
    int src_row = __float2int_rd(scale_height * row);

    int start = __ldg(&seg[src_image_id]);
    int end = __ldg(&seg[src_image_id + 1]);

    int num_bboxes = 0, num_bboxes_of_this_depth = 0, num_bboxes_of_this_depth_inside = 0;

    for (int box_id = start; box_id < end; box_id++) {
        int l = __ldg(&label[box_id]);
        int x1 = __ldg(&bbox[box_id << 2]) - __ldg(&width_offset[image_id]);
        int y1 = __ldg(&bbox[(box_id << 2) + 1]) - __ldg(&height_offset[image_id]);
        int x2 = __ldg(&bbox[(box_id << 2) + 2]) - __ldg(&width_offset[image_id]);
        int y2 = __ldg(&bbox[(box_id << 2) + 3]) - __ldg(&height_offset[image_id]);

        int inside = (src_col >= x1 && src_col <= x2 && src_row >= y1 && src_row <= y2) ? 1 : 0;
        num_bboxes += inside;
        num_bboxes_of_this_depth += (l == color);
        num_bboxes_of_this_depth_inside += (inside && l == color);
    }

    unsigned long i = image_id + size * (col + width * (row + height * color));

    if (num_bboxes > 0) {
        grad[i] = (num_bboxes_of_this_depth_inside > 0) ? (mat[i] - 1) : 0;
    } else {
        grad[i] = (num_bboxes_of_this_depth > 0) ? mat[i] : 0;
    }
}