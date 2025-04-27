#include "hip/hip_runtime.h"
#include "includes.h"

// FILE IO RELATED
#define MAX_ROWS_TRAINING 16896
#define MAX_COLUMNS_TRAINING 26
#define MAX_ROWS_TESTING 4096
#define MAX_COLUMNS_TESTING 26
#define MAX_CHAR 300

__constant__ int features = 26;
__constant__ int num_rows = 16896;

long mem_cpy_time = 0;
long beta_cpy_time = 0;

__global__ void logistic_func(float* log_func_v, float* betas, float* data) {
    int row_index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Utilize shared memory to reduce global memory access
    __shared__ float shared_betas[MAX_COLUMNS_TRAINING];
    if (threadIdx.x < features) {
        shared_betas[threadIdx.x] = betas[threadIdx.x];
    }
    __syncthreads();
    
    // Check if row_index is within bounds
    if (row_index < num_rows) {
        float temp = 0.0f;
        for (int j = 0; j < features; j++) {
            float accessed_data = data[(row_index * features) + j];
            temp += shared_betas[j] * accessed_data;
        }
        log_func_v[row_index] = 1.0f / (1.0f + expf(-temp));
    }
}