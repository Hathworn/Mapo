#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void make_pillar_index_kernel(int* dev_pillar_count_histo, int* dev_counter, int* dev_pillar_count, 
                                         int* dev_x_coors, int* dev_y_coors, 
                                         float* dev_x_coors_for_sub, float* dev_y_coors_for_sub, 
                                         float* dev_num_points_per_pillar, int* dev_sparse_pillar_map, 
                                         const int max_pillars, const int max_points_per_pillar, 
                                         const int GRID_X_SIZE, const float PILLAR_X_SIZE, const float PILLAR_Y_SIZE, 
                                         const int NUM_INDS_FOR_SCAN) {
    int x = blockIdx.x;
    int y = threadIdx.x;
    int num_points_at_this_pillar = dev_pillar_count_histo[y * GRID_X_SIZE + x];

    // Exit early if no points at this pillar
    if (num_points_at_this_pillar == 0) {
        return;
    }

    int count = atomicAdd(dev_counter, 1);

    // Ensure count is within max_pillars
    if (count < max_pillars) {
        atomicAdd(dev_pillar_count, 1);

        // Clamp number of points per pillar to max_points_per_pillar
        dev_num_points_per_pillar[count] = min(num_points_at_this_pillar, max_points_per_pillar);

        dev_x_coors[count] = x;
        dev_y_coors[count] = y;

        // Calculate coordinates for sub
        dev_x_coors_for_sub[count] = x * PILLAR_X_SIZE + 0.1f;
        dev_y_coors_for_sub[count] = y * PILLAR_Y_SIZE - 39.9f;

        // Update sparse pillar map
        dev_sparse_pillar_map[y * NUM_INDS_FOR_SCAN + x] = 1;
    }
}