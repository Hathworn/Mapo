#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void find_all_sums_kernel(bool *mask, double *node_weight, int *neighbor, int *neighbor_start, double *sum_weight_result, int width, int height) {
    // Calculate unique thread index
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int nid = y * width + x;
    
    // Early exit if thread is out of bounds or mask is false
    if (x >= width || y >= height || !mask[nid]) return;

    double sum = 0.0;
    
    // Use shared memory to improve performance by reducing global memory access
    extern __shared__ double shared_weights[];
    int end = min(neighbor_start[nid + 1], neighbor_start[nid] + HUB_THREASHOLD + 1);
    
    // Load weights into shared memory
    for (int eid = neighbor_start[nid] + threadIdx.x; eid < end; eid += blockDim.x) {
        shared_weights[threadIdx.x] = node_weight[neighbor[eid]];
        __syncthreads();
        
        // Perform reduction in shared memory
        for (int s = blockDim.x / 2; s > 0; s >>= 1) {
            if (threadIdx.x < s) {
                shared_weights[threadIdx.x] += shared_weights[threadIdx.x + s];
            }
            __syncthreads();
        }
        
        // Only thread 0 writes the result
        if (threadIdx.x == 0) {
            sum += shared_weights[0];
        }
    }
    
    sum_weight_result[nid] = sum;
}