#include "hip/hip_runtime.h"
#include "includes.h"

//FILE IO RELATED
//max number of lines in the training dataset
#define MAX_ROWS_TRAINING 16896
// max number of columns/features in the training dataset
#define MAX_COLUMNS_TRAINING 26
// max number of rows in the testing dataset
#define MAX_ROWS_TESTING 4096
// max number of columns in the testing data
#define MAX_COLUMNS_TESTING 26
//max number of characters/line
#define MAX_CHAR 300

__constant__ int features = 26;
__constant__ int num_rows = 16896;

long mem_cpy_time = 0;
long beta_cpy_time = 0;

// parallelized across the rows

// parallelized across the features

__global__ void log_gradient(float* log_func_v, float* gradient, float* betas, float* data, int* yvec) {
    extern __shared__ float sdata[];  // Shared memory for intermediate results
    int feature_index = blockIdx.x * blockDim.x + threadIdx.x;
    float temp = 0.0f;

    // Reduce global memory access by reading to shared memory
    for (int i = threadIdx.x; i < num_rows; i += blockDim.x) {
        float sub = log_func_v[i] - yvec[i];
        sdata[threadIdx.x] = sub * data[(i * features) + feature_index];
        __syncthreads();

        // Reduce within the block
        for (int s = blockDim.x / 2; s > 0; s >>= 1) {
            if (threadIdx.x < s) {
                sdata[threadIdx.x] += sdata[threadIdx.x + s];
            }
            __syncthreads();
        }
    }

    // Write the result for this block to global memory
    if (threadIdx.x == 0) {
        atomicAdd(&gradient[feature_index], sdata[0]);
    }
}