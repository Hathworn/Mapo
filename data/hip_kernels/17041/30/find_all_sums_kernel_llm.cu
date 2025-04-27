#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void find_all_sums_kernel(bool *mask, double *node_weight, int *neighbor, int *neighbor_start, double *neighbor_accum_weight_result, double *sum_weight_result, int width, int height) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int nid = y * width + x; // thread_index is node id

    // Check if x and y are within bounds and if mask[nid] is true
    if (x < width && y < height && mask[nid]) {
        double sum = 0.0;
        int end = min(neighbor_start[nid+1], neighbor_start[nid]+HUB_THREASHOLD+1); // Limit loop upper bound

        // Unroll loop for better performance if the number of iterations is small
        #pragma unroll 
        for (int eid = neighbor_start[nid]; eid < end; eid++) { 
            sum += node_weight[neighbor[eid]];
            neighbor_accum_weight_result[eid] = sum;
        }
        sum_weight_result[nid] = sum;
    }
}