#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scatter_kernel( int *x_coors, int *y_coors, float *pfe_output, float *scattered_feature, const int MAX_NUM_PILLARS_, const int GRID_X_SIZE, const int GRID_Y_SIZE)
{
    // Cache the indices in shared memory to reduce global memory accesses
    extern __shared__ int shared_mem[];
    int *shared_x_coors = &shared_mem[0];
    int *shared_y_coors = &shared_mem[MAX_NUM_PILLARS_];

    int i_pillar = blockIdx.x;
    int i_feature = threadIdx.x;

    if (i_feature == 0) { 
        shared_x_coors[i_pillar] = x_coors[i_pillar];
        shared_y_coors[i_pillar] = y_coors[i_pillar];
    }
    __syncthreads();

    int x_ind = shared_x_coors[i_pillar];
    int y_ind = shared_y_coors[i_pillar];

    float feature = pfe_output[i_feature*MAX_NUM_PILLARS_ + i_pillar];
    scattered_feature[i_feature*GRID_Y_SIZE*GRID_X_SIZE + y_ind * GRID_X_SIZE + x_ind] = feature;
}