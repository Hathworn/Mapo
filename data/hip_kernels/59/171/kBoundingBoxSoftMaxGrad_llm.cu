#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kBoundingBoxSoftMaxGrad(float* mat, int* bbox, int* label, int* seg, float* indices, float* width_offset, float* height_offset, int size, int width, int height, int depth, float scale_width, float scale_height, float* grad) {
    const unsigned int len = width * height * depth * size;
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    int image_id, src_image_id, start, end, box_id;
    float source_x, source_y;

    // Utilize shared memory for frequently accessed data
    __shared__ int sharedSeg[1024];
    __shared__ float sharedWidthOffset[1024];
    __shared__ float sharedHeightOffset[1024];

    if (threadIdx.x < size) {
        sharedSeg[threadIdx.x] = seg[threadIdx.x];
        sharedWidthOffset[threadIdx.x] = width_offset[threadIdx.x];
        sharedHeightOffset[threadIdx.x] = height_offset[threadIdx.x];
    }
    __syncthreads();

    for (unsigned int i = idx; i < len; i += numThreads) {
        int ind = i;
        image_id = ind % size; ind /= size;
        source_x = scale_width * (ind % width); ind /= width;
        source_y = scale_height * (ind % height); ind /= height;
        int source_depth = ind % depth;
        src_image_id = (int)indices[image_id];

        start = sharedSeg[src_image_id];
        end = sharedSeg[src_image_id + 1];
        int num_bboxes = 0;
        int num_bboxes_of_this_depth = 0;

        for (box_id = start; box_id < end; box_id++) {
            int x1 = bbox[box_id << 2] - sharedWidthOffset[image_id];
            int y1 = bbox[(box_id << 2) + 1] - sharedHeightOffset[image_id];
            int x2 = bbox[(box_id << 2) + 2] - sharedWidthOffset[image_id];
            int y2 = bbox[(box_id << 2) + 3] - sharedHeightOffset[image_id];

            int inside = (source_x >= x1 && source_x <= x2 && source_y >= y1 && source_y <= y2) ? 1 : 0;
            num_bboxes += inside;
            num_bboxes_of_this_depth += (inside == 1 && label[box_id] == source_depth) ? 1 : 0;
        }
        grad[i] = mat[i] - ((num_bboxes > 0) ? ((float)num_bboxes_of_this_depth / num_bboxes) : (source_depth == 0 ? 1 : 0));
    }
}