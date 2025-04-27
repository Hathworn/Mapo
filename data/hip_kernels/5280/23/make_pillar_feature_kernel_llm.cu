#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void make_pillar_feature_kernel( float* dev_pillar_point_feature_in_coors, float* dev_pillar_point_feature, float* dev_pillar_coors, int* dev_x_coors, int* dev_y_coors, float* dev_num_points_per_pillar, const int max_points, const int num_point_feature, const int grid_x_size) {
    int ith_pillar = blockIdx.x;
    int ith_point = threadIdx.x;

    // Early exit if thread index exceeds points in the pillar
    int num_points_at_this_pillar = dev_num_points_per_pillar[ith_pillar];
    if (ith_point >= num_points_at_this_pillar) return;

    // Precompute reused values
    int x_ind = dev_x_coors[ith_pillar];
    int y_ind = dev_y_coors[ith_pillar];
    int point_offset = ith_point * num_point_feature;
    int pillar_ind = ith_pillar * max_points * num_point_feature + point_offset;
    int coors_ind = (y_ind * grid_x_size + x_ind) * max_points * num_point_feature + point_offset;
    
    // Use unrolled loop for better performance on smaller num_point_feature
    #pragma unroll
    for (int i = 0; i < num_point_feature; ++i) {
        dev_pillar_point_feature[pillar_ind + i] =
            dev_pillar_point_feature_in_coors[coors_ind + i];
    }

    // Directly assign values using constant factor
    dev_pillar_coors[ith_pillar * 4 + 0] = 0.0f;  // batch idx
    dev_pillar_coors[ith_pillar * 4 + 1] = 0.0f;  // z
    dev_pillar_coors[ith_pillar * 4 + 2] = static_cast<float>(y_ind);
    dev_pillar_coors[ith_pillar * 4 + 3] = static_cast<float>(x_ind);
}