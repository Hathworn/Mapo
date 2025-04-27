#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void make_pillar_feature_kernel( float* dev_pillar_x_in_coors, float* dev_pillar_y_in_coors, float* dev_pillar_z_in_coors, float* dev_pillar_i_in_coors, float* dev_pillar_x, float* dev_pillar_y, float* dev_pillar_z, float* dev_pillar_i, int* dev_x_coors, int* dev_y_coors, float* dev_num_points_per_pillar, const int max_points, const int GRID_X_SIZE)
{
    // Cache number of points to reduce global memory access
    int ith_pillar = blockIdx.x;
    int num_points_at_this_pillar = dev_num_points_per_pillar[ith_pillar];
    int ith_point = threadIdx.x;

    // Exit early if the thread index exceeds the number of points
    if (ith_point >= num_points_at_this_pillar)
        return;

    // Prevent excessive recalculation of indices
    int x_ind = dev_x_coors[ith_pillar];
    int y_ind = dev_y_coors[ith_pillar];
    int pillar_base = ith_pillar * max_points;
    int coors_base = y_ind * GRID_X_SIZE * max_points + x_ind * max_points;

    int pillar_ind = pillar_base + ith_point;
    int coors_ind = coors_base + ith_point;

    // Use stored indices for memory access, reducing recalculation
    dev_pillar_x[pillar_ind] = dev_pillar_x_in_coors[coors_ind];
    dev_pillar_y[pillar_ind] = dev_pillar_y_in_coors[coors_ind];
    dev_pillar_z[pillar_ind] = dev_pillar_z_in_coors[coors_ind];
    dev_pillar_i[pillar_ind] = dev_pillar_i_in_coors[coors_ind];
}