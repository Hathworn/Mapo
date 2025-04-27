#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scatter_kernel(int *x_coors, int *y_coors, float *pfe_output, float *scattered_feature, const int MAX_NUM_PILLARS_, const int GRID_X_SIZE, const int GRID_Y_SIZE)
{
    int i_pillar = blockIdx.x;
    int num_features = blockDim.x;

    // Use shared memory for thread synchronization
    __shared__ int x_shared;
    __shared__ int y_shared;

    if (threadIdx.x == 0) {
        x_shared = x_coors[i_pillar];
        y_shared = y_coors[i_pillar];
    }

    // Synchronize threads to ensure shared memory is set
    __syncthreads();

    // Load feature data and update output
    if (i_pillar < MAX_NUM_PILLARS_ && threadIdx.x < num_features) {
        int idx = threadIdx.x * MAX_NUM_PILLARS_ + i_pillar;
        float feature = pfe_output[idx];
        int output_idx = threadIdx.x * GRID_Y_SIZE * GRID_X_SIZE + y_shared * GRID_X_SIZE + x_shared;
        scattered_feature[output_idx] = feature;
    }
}