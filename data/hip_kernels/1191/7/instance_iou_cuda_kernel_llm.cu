#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void instance_iou_cuda_kernel(int64_t total_gt_instances, const int64_t* __restrict__ nInstance, int nProposal, const int64_t* __restrict__ proposals_idx, const int64_t* __restrict__ proposals_offset, const int64_t* __restrict__ instance_labels, const int64_t* __restrict__ offset_num_gt_instances, const int64_t* __restrict__ batch, const int64_t* __restrict__ instance_pointnum, float* proposals_iou)
{
    int proposal_id = blockIdx.x;
    if (proposal_id >= nProposal) return; // Eliminate unnecessary work.

    int start = proposals_offset[proposal_id];
    int end = proposals_offset[proposal_id + 1];
    int sampleIdx = batch[proposals_idx[start]];
    int sampleNInstances = nInstance[sampleIdx];
    int instanceOffset = offset_num_gt_instances[sampleIdx];
    int proposal_total = end - start;

    // Use shared memory to reduce global memory accesses for instance labels
    extern __shared__ int shared_mem[];
    int *shared_instance_labels = shared_mem;
  
    for (int i = threadIdx.x; i < end - start; i += blockDim.x) {
        shared_instance_labels[i] = instance_labels[proposals_idx[start + i]];
    }
    __syncthreads(); // Ensure all labels are loaded

    for (int instance_id = threadIdx.x; instance_id < sampleNInstances; instance_id += blockDim.x)
    {
        int instance_total = instance_pointnum[instanceOffset + instance_id];
        int intersection = 0;
        
        // Use shared memory to compare labels
        for (int i = 0; i < end - start; i++)
        {
            if (shared_instance_labels[i] == instance_id + 1) // 0 for "no instance"
            {
                intersection++;
            }
        }

        proposals_iou[instanceOffset + instance_id + proposal_id * total_gt_instances] =
            (float)intersection / ((float)(proposal_total + instance_total - intersection) + 1e-5);
    }
}
```
