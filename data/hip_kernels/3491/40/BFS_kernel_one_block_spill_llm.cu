#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BFS_kernel_one_block_spill(volatile unsigned int *frontier, unsigned int frontier_len, volatile unsigned int *cost, volatile int *visited, unsigned int *edgeArray, unsigned int *edgeArrayAux, unsigned int numVertices, unsigned int numEdges, volatile unsigned int *frontier_length, const unsigned int max_local_mem)
{
    extern volatile __shared__ unsigned int s_mem[];
    
    // Block queues
    unsigned int *b_q = (unsigned int *)&s_mem[0];
    unsigned int *b_q2 = (unsigned int *)&s_mem[max_local_mem];
    
    volatile __shared__ unsigned int b_offset[1];
    volatile __shared__ unsigned int b_q_length[1];
    
    // Get the threadId
    unsigned int tid = threadIdx.x;

    // Load stable memory only once
    const unsigned int maxLM = max_local_mem; 

    // Copy frontier queue from global queue to local block queue
    if (tid < frontier_len) {
        b_q[tid] = frontier[tid];
    }

    unsigned int f_len = frontier_len;
    while (1) {
        // Initialize the block queue size to 0
        if (tid == 0) {
            b_q_length[0] = 0;
            b_offset[0] = 0;
        }
        __syncthreads();

        if (tid < f_len) {
            // Get the nodes to traverse from block queue
            unsigned int node_to_process = *(volatile unsigned int *)&b_q[tid];
            visited[node_to_process] = 0; // Remove from frontier

            // Get the offsets of the vertex in the edge list
            unsigned int offset = edgeArray[node_to_process];
            unsigned int next = edgeArray[node_to_process + 1];

            // Iterate through neighbors of the vertex
            while (offset < next) {
                unsigned int nid = edgeArrayAux[offset]; // Get neighbor
                unsigned int v = atomicMin((unsigned int *)&cost[nid], cost[node_to_process] + 1);

                // If cost is less than previously set add to frontier
                if (v > cost[node_to_process] + 1) {
                    int is_in_frontier = atomicExch((int *)&visited[nid], 1);
                    if (is_in_frontier == 0) { // If node already in frontier do nothing
                        unsigned int t = atomicAdd((unsigned int *)&b_q_length[0], 1);

                        // Add to local memory if not full
                        if (t < maxLM) {
                            b_q2[t] = nid;
                        } else {
                            int off = atomicAdd((unsigned int *)&b_offset[0], 1);
                            frontier[off] = nid; // Write to global memory if shared memory full
                        }
                    }
                }
                offset++;
            }
        }
        __syncthreads();

        if (tid < maxLM) {
            b_q[tid] = *(volatile unsigned int *)&b_q2[tid];
        }
        __syncthreads();

        // Traversal complete exit
        if (b_q_length[0] == 0) {
            if (tid == 0) {
                frontier_length[0] = 0;
            }
            return;
        }
        
        // If frontier exceeds one block in size copy warp queues to global frontier queue and exit
        else if (b_q_length[0] > blockDim.x || b_q_length[0] > maxLM) {
            if (tid < (b_q_length[0] - b_offset[0])) {
                frontier[b_offset[0] + tid] = *(volatile unsigned int *)&b_q[tid];
            }
            if (tid == 0) {
                frontier_length[0] = b_q_length[0];
            }
            return;
        }
        f_len = b_q_length[0];
        __syncthreads();
    }
}
```
