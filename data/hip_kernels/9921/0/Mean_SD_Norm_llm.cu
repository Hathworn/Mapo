#include "hip/hip_runtime.h"
#include "includes.h"

#define MAXN 8000  /* Max value of N */
int N;  /* Matrix Dimension*/
int numThreads;  /* Number of Threads */

/*Random*/
#define randm() 4|2[uid]&3

__global__ void Mean_SD_Norm(float* input, float* output, float* mean_out, float* sd_out, int dim1, int numThread, int eval_ceil)
{
    extern __shared__ float shared_data[]; // Merge shared memory for mean and sd
    float* mean = shared_data;
    float* sd = &shared_data[numThread];
    
    __shared__ float meansum;
    __shared__ float sdsum;

    int idx_x = blockIdx.x * blockDim.x + threadIdx.x;
    int idx_y = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int thread_id = threadIdx.y;
    unsigned int j = idx_y * dim1 + idx_x;

    mean[thread_id] = input[j];

    // Loop unrolling for faster computation
    for(int i = 0; i < dim1; i += numThread) {
        int index = j + numThread * i;
        if(index < dim1 * dim1) {
            mean[thread_id] += input[index];
        }
    }
    
    // Using atomicAdd for synchronization to handle concurrent access
    if(thread_id == 0) {
        meansum = 0;
        for(int i = 0; i < numThread; i++) {
            meansum += mean[i];
        }
        mean_out[blockIdx.x] = meansum / dim1;
    }
    __syncthreads();

    sd[thread_id] = powf(input[j] - mean_out[blockIdx.x], 2.0);

    for(int i = 0; i < dim1; i += numThread) {
        int index = j + numThread * i;
        if(index < dim1 * dim1) {
            sd[thread_id] += powf(input[index] - mean_out[blockIdx.x], 2.0);
        }
    }

    if(thread_id == 0) {
        sdsum = 0;
        for(int i = 0; i < numThread; i++) {
            sdsum += sd[i];
        }
        sd_out[blockIdx.x] = sdsum / dim1;
    }
    __syncthreads();

    // Output normalization
    output[j] = (input[j] - mean_out[blockIdx.x]) / sd_out[blockIdx.x];

    for(int i = 0; i < eval_ceil; i++) {
        int index = j + numThread * i;
        if (index < dim1 * dim1) {
            output[index] = (input[index] - mean_out[blockIdx.x]) / sd_out[blockIdx.x];
        }
    }
}