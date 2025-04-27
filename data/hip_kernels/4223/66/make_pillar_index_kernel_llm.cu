#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void make_pillar_index_kernel(int* dev_pillar_count_histo, int* dev_counter, int* dev_pillar_count, int* dev_x_coors, int* dev_y_coors, float* dev_x_coors_for_sub, float* dev_y_coors_for_sub, float* dev_num_points_per_pillar, int* dev_sparse_pillar_map, const int max_pillars, const int max_points_per_pillar, const int GRID_X_SIZE, const float PILLAR_X_SIZE, const float PILLAR_Y_SIZE, const int NUM_INDS_FOR_SCAN)
{
    // Calculate indexes for current thread
    int x = blockIdx.x;
    int y = threadIdx.x;
    
    // Calculate number of points in this pillar
    int num_points_at_this_pillar = dev_pillar_count_histo[y * GRID_X_SIZE + x];
    if (num_points_at_this_pillar == 0)
    {
        return;  // Early exit for empty pillars
    }

    int count = atomicAdd(dev_counter, 1);
    if (count < max_pillars)
    {
        atomicAdd(dev_pillar_count, 1);
        
        // Populate point count up to max_points_per_pillar
        dev_num_points_per_pillar[count] = min(num_points_at_this_pillar, max_points_per_pillar);
        
        // Assign coordinates
        dev_x_coors[count] = x;
        dev_y_coors[count] = y;
        
        // Calculate offsets for sub-coordinates
        dev_x_coors_for_sub[count] = x * PILLAR_X_SIZE + 0.1f;
        dev_y_coors_for_sub[count] = y * PILLAR_Y_SIZE - 39.9f;
        
        // Mark the pillar as occupied
        dev_sparse_pillar_map[y * NUM_INDS_FOR_SCAN + x] = 1;
    }
}