#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kBoundingBoxLogisticGrad( float* mat, int* bbox, int* label, int* seg, float* indices, float* width_offset, float* height_offset, int size, int width, int height, int depth, float scale_width, float scale_height, float* grad) {
    const int color = blockIdx.z;

    // Optimize thread and block calculation: Calculate indices efficiently
    const int image_id = threadIdx.x + blockIdx.x * blockDim.x;
    const int row = threadIdx.y + blockIdx.y * blockDim.y;

    int num_bboxes = 0, num_bboxes_of_this_depth = 0, num_bboxes_of_this_depth_inside = 0;
    if (image_id < size && row < height && color < depth) {
        int src_image_id = (int)indices[image_id];
        int src_col = (int)(scale_width * image_id);
        int src_row = (int)(scale_height * row);
        
        int start = seg[src_image_id];
        int end = seg[src_image_id + 1];
        int x1, y1, x2, y2, l, inside;
        for (int box_id = start; box_id < end; box_id++) {
            l = label[box_id];
            x1 = bbox[box_id << 2] - width_offset[image_id];
            y1 = bbox[(box_id << 2) + 1] - height_offset[image_id];
            x2 = bbox[(box_id << 2) + 2] - width_offset[image_id];
            y2 = bbox[(box_id << 2) + 3] - height_offset[image_id];
            inside = (src_col >= x1 && src_col <= x2 && src_row >= y1 && src_row <= y2) ? 1:0;
            num_bboxes += inside;
            num_bboxes_of_this_depth += (l == color) ? 1: 0;
            num_bboxes_of_this_depth_inside += (inside == 1 && l == color) ? 1: 0;
        }
    }
    
    // Calculate global index more efficiently
    unsigned long i = image_id + size * (row + height * color);
    __syncthreads();
    
    if (image_id < size && row < height && color < depth) {
        if (num_bboxes > 0) {
            grad[i] = (num_bboxes_of_this_depth_inside > 0) ? (mat[i] - 1) : 0;
        } else {
            grad[i] = (num_bboxes_of_this_depth > 0) ? mat[i] : 0;
        }
    }
}