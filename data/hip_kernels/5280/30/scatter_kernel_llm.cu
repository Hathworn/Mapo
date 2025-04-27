#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scatter_kernel(int *x_coors, int *y_coors, float *pfe_output, float *scattered_feature, const int max_num_pillars_, const int grid_x_size, const int grid_y_size) {
    // Compute global thread index
    int i_pillar = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread does not exceed the number of pillars
    if (i_pillar < max_num_pillars_) {
        int i_feature = threadIdx.y; // Use second thread dimension for feature

        // Calculate coordinates
        int x_ind = x_coors[i_pillar];
        int y_ind = y_coors[i_pillar];

        // Access and write feature safely
        float feature = pfe_output[i_feature * max_num_pillars_ + i_pillar];
        scattered_feature[i_feature * grid_y_size * grid_x_size + y_ind * grid_x_size + x_ind] = feature;
    }
}