#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kBoundingBoxSoftMaxGrad( 
    float* __restrict__ mat, 
    int* __restrict__ bbox, 
    int* __restrict__ label, 
    int* __restrict__ seg, 
    float* __restrict__ indices, 
    float* __restrict__ width_offset, 
    float* __restrict__ height_offset, 
    int size, 
    int width, 
    int height, 
    int depth, 
    float scale_width, 
    float scale_height, 
    float* __restrict__ grad) 
{
    const unsigned int len = width * height * depth * size;
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Use register to cache frequently used variables
    __shared__ float shared_bbox[1024];
    
    for (unsigned int i = idx; i < len; i += numThreads) {
        int ind = i;
        const int image_id = ind % size; ind /= size;
        const float source_x = scale_width * (ind % width); ind /= width;
        const float source_y = scale_height * (ind % height); ind /= height;
        const int source_depth = ind % depth;
        const int src_image_id = (int) indices[image_id];

        // Move unnecessary computations outside loop
        const int start = seg[src_image_id];
        const int end = seg[src_image_id + 1];
        int num_bboxes = 0;
        int num_bboxes_of_this_depth = 0;

        for (int box_id = start; box_id < end; box_id++) {
            if (threadIdx.x < 4) shared_bbox[threadIdx.x * (end-start) + box_id - start] = bbox[(box_id << 2) + threadIdx.x];
            __syncthreads(); // Ensure all threads have loaded the relevant data
            
            const int x1 = shared_bbox[(box_id - start) * 4] - width_offset[image_id];
            const int y1 = shared_bbox[(box_id - start) * 4 + 1] - height_offset[image_id];
            const int x2 = shared_bbox[(box_id - start) * 4 + 2] - width_offset[image_id];
            const int y2 = shared_bbox[(box_id - start) * 4 + 3] - height_offset[image_id];
            
            const int inside = (source_x >= x1 && source_x <= x2 && source_y >= y1 && source_y <= y2) ? 1:0;
            num_bboxes += inside;
            num_bboxes_of_this_depth += (inside == 1 && label[box_id] == source_depth) ? 1 : 0;
        }

        grad[i] = mat[i] - ((num_bboxes > 0) ? ((float)num_bboxes_of_this_depth / num_bboxes) : (source_depth == 0 ? 1 : 0));
    }
}