#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize by calculating offsets outside inner loop
__global__ void scatter_kernel(int *x_coors, int *y_coors, float *pfe_output, float *scattered_feature, const int MAX_NUM_PILLARS_, const int GRID_X_SIZE, const int GRID_Y_SIZE)
{
    int i_pillar = blockIdx.x;
    int i_feature = threadIdx.x;

    // Calculate index only once outside of accessing array
    int pillar_idx = i_feature * MAX_NUM_PILLARS_ + i_pillar;
    int scatter_idx = i_feature * GRID_Y_SIZE * GRID_X_SIZE + y_coors[i_pillar] * GRID_X_SIZE + x_coors[i_pillar];

    // Fetch feature and store to global memory
    scattered_feature[scatter_idx] = pfe_output[pillar_idx];
}