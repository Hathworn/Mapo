#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void BFS_kernel_multi_block_spill(volatile unsigned int *frontier, volatile unsigned int *frontier2, unsigned int frontier_len, volatile unsigned int *cost, volatile int *visited, unsigned int *edgeArray, unsigned int *edgeArrayAux, unsigned int numVertices, unsigned int numEdges, volatile unsigned int *frontier_length, const unsigned int max_local_mem)
{
    extern __shared__ unsigned int b_q[];

    __shared__ unsigned int b_q_length[1];
    __shared__ unsigned int b_offset[1];
    
    unsigned int tid = threadIdx.x + blockDim.x * blockIdx.x;
    unsigned int lid = threadIdx.x;

    // Initialize shared memory variables
    if (lid == 0)
    {
        b_q_length[0] = 0;
        b_offset[0] = 0;
    }
    
    __syncthreads();

    if (tid < frontier_len)
    {
        unsigned int node_to_process = frontier[tid];
        visited[node_to_process] = 0;
        unsigned int offset = edgeArray[node_to_process];
        unsigned int next = edgeArray[node_to_process + 1];

        // Traverse neighbors
        while (offset < next)
        {
            unsigned int nid = edgeArrayAux[offset];
            unsigned int v = atomicMin(&cost[nid], cost[node_to_process] + 1);

            // Update frontier if required
            if (v > cost[node_to_process] + 1 && atomicExch(&visited[nid], 1) == 0)
            {
                unsigned int t = atomicAdd(&b_q_length[0], 1);

                // Use shared memory or spill to global memory
                if (t < max_local_mem)
                {
                    b_q[t] = nid;
                }
                else
                {
                    frontier2[atomicAdd((unsigned int *)frontier_length, 1)] = nid;
                }
            }
            offset++;
        }
    }
    
    __syncthreads();

    if (lid == 0)
    {
        if (b_q_length[0] > max_local_mem)
        {
            b_q_length[0] = max_local_mem;
        }
        b_offset[0] = atomicAdd((unsigned int *)frontier_length, b_q_length[0]);
    }
    
    __syncthreads();

    if (lid < b_q_length[0])
    {
        frontier2[lid + b_offset[0]] = b_q[lid];
    }
}