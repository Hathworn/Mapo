#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scatter_kernel(int *x_coors, int *y_coors, float *pfe_output, float *scattered_feature, const int MAX_NUM_PILLARS_, const int GRID_X_SIZE, const int GRID_Y_SIZE)
{
    // Use blockIdx and threadIdx to calculate a unique thread index
    int thread_idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    int num_features = blockDim.x;  // Assuming number of features is blockDim.x

    if (threadIdx.x < num_features && blockIdx.x < MAX_NUM_PILLARS_) {
        int x_ind = x_coors[blockIdx.x];
        int y_ind = y_coors[blockIdx.x];
        float feature = pfe_output[threadIdx.x * MAX_NUM_PILLARS_ + blockIdx.x];

        int index = threadIdx.x * GRID_Y_SIZE * GRID_X_SIZE + y_ind * GRID_X_SIZE + x_ind;
        scattered_feature[index] = feature;
    }
}