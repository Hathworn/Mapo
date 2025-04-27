#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void make_extra_network_input_kernel(float* dev_x_coors_for_sub, float* dev_y_coors_for_sub, float* dev_num_points_per_pillar, float* dev_x_coors_for_sub_shaped, float* dev_y_coors_for_sub_shaped, float* dev_pillar_feature_mask, const int MAX_NUM_POINTS_PER_PILLAR)
{
    int ith_pillar = blockIdx.x;
    int ith_point = threadIdx.x;
    int ind = ith_pillar * MAX_NUM_POINTS_PER_PILLAR + ith_point;
    
    // Directly assign x and y to shaped arrays
    dev_x_coors_for_sub_shaped[ind] = dev_x_coors_for_sub[ith_pillar];
    dev_y_coors_for_sub_shaped[ind] = dev_y_coors_for_sub[ith_pillar];
    
    // Use conditional operator for mask assignment
    dev_pillar_feature_mask[ind] = ith_point < dev_num_points_per_pillar[ith_pillar] ? 1.0f : 0.0f;
}