#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void find_closest_mine(float * mine_pos_v, float * distances_v, int * mineIdx_v, int num_sweeprs, int num_mines, float * inputs)
{
    #define sweeperIdx blockIdx.y
    #define first_item blockIdx.y*num_mines
    int my_index = (gridDim.x * blockIdx.x) + threadIdx.x;

    // Use shared memory for faster access to critical data
    __shared__ float shared_distances_v[1024];
    __shared__ int shared_mineIdx_v[1024];

    if (my_index < num_mines) {
        shared_distances_v[threadIdx.x] = distances_v[first_item + my_index];
        shared_mineIdx_v[threadIdx.x] = my_index;
    }
    __syncthreads();

    // Optimize with shared memory usage
    for (int stride = num_mines / 2; stride > 0; stride /= 2) {
        __syncthreads();
        if (my_index < stride && (my_index + stride) < num_mines) {
            if (shared_distances_v[threadIdx.x] < shared_distances_v[threadIdx.x + stride]) {
                shared_distances_v[threadIdx.x] = shared_distances_v[threadIdx.x + stride];
                shared_mineIdx_v[threadIdx.x] = shared_mineIdx_v[threadIdx.x + stride];
            }
        }
    }

    // After reduction, copy back results to global memory
    if (threadIdx.x == 0) {
        distances_v[first_item] = shared_distances_v[0];
        mineIdx_v[sweeperIdx] = shared_mineIdx_v[0];

        inputs[sweeperIdx * 4] = mine_pos_v[mineIdx_v[sweeperIdx] * 2];
        inputs[sweeperIdx * 4 + 1] = mine_pos_v[mineIdx_v[sweeperIdx] * 2 + 1];
    }
    #undef sweeperIdx
    #undef first_item
}