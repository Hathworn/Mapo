#include "hip/hip_runtime.h"
#include "includes.h"

#define DATA float
#define BOOL int
#define MAX_ERR (float)1e-5
#define MAX_EPOCHS 3

#define MAX(a,b) ((a)>(b)?(a):(b))
#define MIN(a,b) ((a)<(b)?(a):(b))

#define OPTIMUM_BLOCK_NUM 4
#define BLOCK_SIDE 16

#define OPTIMUM_BLOCK_NUM_FIRST_LAYER 2
#define BLOCK_SIDE_FIRST_LAYER 32

typedef struct grid_settings {
    int grid[3];
    int block[3];
} grid_settings;

grid_settings gs = { { OPTIMUM_BLOCK_NUM_FIRST_LAYER, OPTIMUM_BLOCK_NUM, OPTIMUM_BLOCK_NUM }, { BLOCK_SIDE_FIRST_LAYER, BLOCK_SIDE, BLOCK_SIDE } };

#define NEURO_INPUT 784
#define NEURO_H_0 56
#define NEURO_H_1 28
#define NEURO_OUTPUT 10
#define TOTAL_PATT 60000
#define NUM_HIDDEN 2
#define TOTAL_LAYER 4

#define NSTREAMS 3

texture<DATA, 2, hipReadModeElementType> texreference_target;

__constant__ DATA alpha_const[1];
__constant__ DATA eta_const[1];

__global__ void updateWeightBiasMat(DATA *delta_weightbias, DATA *weight, int rows, int cols) {
    // Calculate flattened thread index for better memory coalescing
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;
    int thread_index = idy * cols + idx;

    // Ensure threads are within bounds
    if (idx < cols && idy < rows) {
        // Access derivative directly using flattened index
        DATA derivative = delta_weightbias[thread_index];
        // Perform atomic addition to handle concurrent updates safely
        atomicAdd(&weight[thread_index], derivative);
        // Update delta_weightbias with constant alpha factor
        delta_weightbias[thread_index] *= alpha_const[0];
    }
}