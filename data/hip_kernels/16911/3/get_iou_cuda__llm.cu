#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void get_iou_cuda_(int nInstance, int nProposal, int *proposals_idx, int *proposals_offset, long *instance_labels, int *instance_pointnum, float *proposals_iou) {
    int proposal_id = blockIdx.x * blockDim.x + threadIdx.x;
    if (proposal_id < nProposal) {  // Ensure valid proposal_id
        int start = proposals_offset[proposal_id];
        int end = proposals_offset[proposal_id + 1];
        int proposal_total = end - start;

        extern __shared__ int shared_instance_points[];  // Shared memory to hold instance point calculations

        for (int instance_id = blockIdx.y; instance_id < nInstance; instance_id += gridDim.y) {
            int instance_total = instance_pointnum[instance_id];
            int intersection = 0;

            for (int i = start; i < end; i++) {
                int idx = proposals_idx[i];
                if ((int)instance_labels[idx] == instance_id) {
                    intersection += 1;
                }
            }

            // Calculate IOU and store in shared memory
            shared_instance_points[threadIdx.x] = intersection;
            __syncthreads();

            if(threadIdx.x == 0) {  // Single thread in the block computes final IOU
                int total_intersection = 0;
                for (int i = 0; i < blockDim.x; i++) {
                    total_intersection += shared_instance_points[i];
                }
                // Store result in global memory
                proposals_iou[proposal_id * nInstance + instance_id] = (float)total_intersection / ((float)(proposal_total + instance_total - total_intersection) + 1e-5);
            }
            __syncthreads();
        }
    }
}