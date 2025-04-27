#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculate_distances(float * sweeper_pos_v, float * mine_pos_v, int num_sweepers, int num_mines, float * distance_v, float * inputs, int * sweeper_score_v, int width, int height, int size)
{
#define sweeperIdx blockIdx.y
#define mineIdx threadIdx.x*2

int distanceIdx = (blockIdx.y * num_mines) + threadIdx.x;
float vec_x;
float vec_y;
float distance;

__shared__ float sweeper_pos[2];

// Efficient global memory read using one if statement 
if (threadIdx.x < 2)
{
    sweeper_pos[threadIdx.x] = sweeper_pos_v[sweeperIdx + threadIdx.x];
    inputs[((sweeperIdx * 4) + threadIdx.x) + 2] = sweeper_pos[threadIdx.x]; //copy the sweeper position out to the inputs for the neural network in parallel
}

__syncthreads();

// Reduce repetitive access using temporary variables
vec_x = mine_pos_v[mineIdx] - sweeper_pos[0];
vec_y = mine_pos_v[mineIdx + 1] - sweeper_pos[1];
distance = sqrtf((vec_x * vec_x) + (vec_y * vec_y));  // Use sqrtf for better performance
distance_v[distanceIdx] = distance;

// Conditionally increment sweeper scores with improved access patterns
if (distance < size)
{
    mine_pos_v[mineIdx] = ((threadIdx.x + 1) * clock()) % width;
    mine_pos_v[mineIdx + 1] = ((threadIdx.x + 1) * clock()) % height;
    atomicAdd(&sweeper_score_v[sweeperIdx], 1);  // Use atomic operation for score update
}

#undef sweeperIdx
#undef mineIdx
}