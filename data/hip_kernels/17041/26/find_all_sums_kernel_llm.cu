#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void find_all_sums_kernel(bool *mask, float *node_weight, int *neighbor, int *neighbor_start, float *neighbor_accum_weight_result, float *sum_weight_result, int width, int height){
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int nid = y * width + x; // thread_index is node id

    // Check for valid thread to process
    if (x < width && y < height && mask[nid]){
        float sum = 0.0;
        
        // Use shared memory for accumulative sum (assuming a block has enough resources)
        __shared__ float shared_weight[BLOCK_SIZE];
        
        // Efficient memory access
        int start = neighbor_start[nid];
        int end = min(neighbor_start[nid + 1], start + HUB_THREASHOLD + 1);
        
        // Load data into shared memory, each thread handles one neighbor
        for (int eid = start + threadIdx.x; eid < end; eid += blockDim.x) {
            shared_weight[threadIdx.x] = node_weight[neighbor[eid]];
            __syncthreads();

            // Accumulate sum
            if (threadIdx.x == 0) {
                for (int i = start; i < end; i++) {
                    sum += shared_weight[i - start];
                    neighbor_accum_weight_result[i] = sum;
                }
            }

            // Ensure all threads have updated the weight before next iteration
            __syncthreads();
        }
        
        if (threadIdx.x == 0) {
            sum_weight_result[nid] = sum;
        }
    }
}