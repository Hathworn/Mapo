#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sort_boxes_by_indexes_kernel(float* filtered_box, int* filtered_label, int* filtered_dir, float* box_for_nms, int* indexes, int filter_count, float* sorted_filtered_boxes, int* sorted_filtered_label, int* sorted_filtered_dir, float* sorted_box_for_nms, const int num_box_corners, const int num_output_box_feature) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    if (tid < filter_count) {
        int sort_index = indexes[tid];

        // Use a loop for copying the features to improve readability and maintainability
        for (int i = 0; i < num_output_box_feature; ++i) {
            sorted_filtered_boxes[tid * num_output_box_feature + i] = filtered_box[sort_index * num_output_box_feature + i];
        }

        sorted_filtered_label[tid] = filtered_label[sort_index];
        sorted_filtered_dir[tid] = filtered_dir[sort_index];

        // Use a loop for copying the box corners
        for (int i = 0; i < num_box_corners; ++i) {
            sorted_box_for_nms[tid * num_box_corners + i] = box_for_nms[sort_index * num_box_corners + i];
        }
    }
}