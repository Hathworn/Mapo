#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scatter_kernel(int *x_coors, int *y_coors, float *pfe_output, float *scattered_feature, const int MAX_NUM_PILLARS_, const int GRID_X_SIZE, const int GRID_Y_SIZE)
{
    // Use shared memory to cache frequently accessed values
    __shared__ int x_ind_shared;
    __shared__ int y_ind_shared;

    if (threadIdx.x == 0) {
        x_ind_shared = x_coors[blockIdx.x];
        y_ind_shared = y_coors[blockIdx.x];
    }
    __syncthreads();

    // Calculate global feature index using shared memory variables
    int i_feature = threadIdx.x;
    float feature = pfe_output[i_feature * MAX_NUM_PILLARS_ + blockIdx.x];
    int global_index = i_feature * GRID_Y_SIZE * GRID_X_SIZE + y_ind_shared * GRID_X_SIZE + x_ind_shared;
    scattered_feature[global_index] = feature;
}