#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kBoundingBoxLogisticGrad(float* mat, int* bbox, int* label, int* seg, float* indices, float* width_offset, float* height_offset, int size, int width, int height, int depth, float scale_width, float scale_height, float* grad) {
    const int color = blockIdx.z;

    // Optimized: calculate only once per thread
    const int image_id = threadIdx.x;
    const int col = blockIdx.x;
    const int row = blockIdx.y;

    // Pre-check conditions before calculations
    if (col < width && row < height && image_id < size && color < depth) {
        int num_bboxes = 0, num_bboxes_of_this_depth = 0, num_bboxes_of_this_depth_inside = 0;
        const int src_image_id = (int)indices[image_id];
        const int src_col = (int)(scale_width * col);
        const int src_row = (int)(scale_height * row);

        const int start = seg[src_image_id];
        const int end = seg[src_image_id + 1];

        // Loop through bboxes once
        for (int box_id = start; box_id < end; box_id++) {
            const int l = label[box_id];
            const int x1 = bbox[box_id << 2] - width_offset[image_id];
            const int y1 = bbox[(box_id << 2) + 1] - height_offset[image_id];
            const int x2 = bbox[(box_id << 2) + 2] - width_offset[image_id];
            const int y2 = bbox[(box_id << 2) + 3] - height_offset[image_id];

            // Precalculate inside checking
            const int inside = (src_col >= x1 && src_col <= x2 && src_row >= y1 && src_row <= y2);

            num_bboxes += inside;
            num_bboxes_of_this_depth += (l == color);
            num_bboxes_of_this_depth_inside += (inside && (l == color));
        }
        
        const unsigned long i = image_id + size * (col + width * (row + height * color));

        // Simplified grad calculation
        if (num_bboxes > 0) {
            grad[i] = (num_bboxes_of_this_depth_inside > 0) ? (mat[i] - 1) : 0;
        } else {
            grad[i] = (num_bboxes_of_this_depth > 0) ? mat[i] : 0;
        }
    }
}