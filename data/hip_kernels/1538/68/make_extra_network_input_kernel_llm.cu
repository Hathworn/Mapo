#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void make_extra_network_input_kernel(float* dev_x_coors_for_sub, float* dev_y_coors_for_sub, float* dev_num_points_per_pillar, float* dev_x_coors_for_sub_shaped, float* dev_y_coors_for_sub_shaped, float* dev_pillar_feature_mask, const int MAX_NUM_POINTS_PER_PILLAR) {
    int ith_pillar = blockIdx.x;
    int ith_point = threadIdx.x;
    int ind = ith_pillar * MAX_NUM_POINTS_PER_PILLAR + ith_point;
    
    // Cache x and y as shared for potential use across threads
    float x = dev_x_coors_for_sub[ith_pillar];
    float y = dev_y_coors_for_sub[ith_pillar];
    
    // Simplify and compact memory writes with combined assignments
    dev_x_coors_for_sub_shaped[ind] = x;
    dev_y_coors_for_sub_shaped[ind] = y;
    
    int num_points_for_a_pillar = dev_num_points_per_pillar[ith_pillar];
    
    // Use conditional operator for a concise mask assignment
    dev_pillar_feature_mask[ind] = (ith_point < num_points_for_a_pillar) ? 1.0f : 0.0f;
}