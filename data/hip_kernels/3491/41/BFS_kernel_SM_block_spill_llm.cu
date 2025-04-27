#include "hip/hip_runtime.h"
#include "includes.h"

#define WARP_SIZE 32

__device__ void __gpu_sync(int blocks_to_synch) {
  __syncthreads();
  int tid_in_block = threadIdx.x;

  // Only thread 0 is used for synchronization
  if (tid_in_block == 0) {
    atomicAdd((int*)&g_mutex, 1);
    // Only when all blocks add 1 to g_mutex will g_mutex equal to blocks_to_synch
    while (g_mutex < blocks_to_synch);
  }
  __syncthreads();
}

__global__ void BFS_kernel_SM_block_spill(
    volatile unsigned int* frontier, volatile unsigned int* frontier2,
    unsigned int frontier_len, volatile unsigned int* cost,
    volatile int* visited, unsigned int* edgeArray, unsigned int* edgeArrayAux,
    unsigned int numVertices, unsigned int numEdges, volatile unsigned int* frontier_length,
    const unsigned int max_local_mem) {
  
  extern volatile __shared__ unsigned int b_q[];

  __shared__ unsigned int b_q_length;
  __shared__ unsigned int b_offset;

  unsigned int tid = threadIdx.x + blockDim.x * blockIdx.x;
  unsigned int lid = threadIdx.x;

  int loop_index = 0;
  unsigned int l_mutex = g_mutex2;
  unsigned int f_len = frontier_len;

  while (1) {
    // Initialize the block queue length and warp queue offset
    if (lid == 0) {
      b_q_length = 0;
      b_offset = 0;
    }
    __syncthreads();

    // Processing nodes
    if (tid < f_len) {
      unsigned int node_to_process = (loop_index == 0) ? frontier[tid] : frontier2[tid];
      visited[node_to_process] = 0;  // Mark node as visited

      unsigned int offset = edgeArray[node_to_process];
      unsigned int next = edgeArray[node_to_process + 1];

      while (offset < next) {
        unsigned int nid = edgeArrayAux[offset];
        unsigned int v = atomicMin((unsigned int*)&cost[nid], cost[node_to_process] + 1);

        if (v > cost[node_to_process] + 1) {
          int is_in_frontier = atomicExch((int*)&visited[nid], 1);

          if (is_in_frontier == 0) {
            unsigned int t = atomicAdd((unsigned int*)&b_q_length, 1);
            if (t < max_local_mem) {
              b_q[t] = nid;
            }
            // Write to global memory if shared memory full
            else {
              int off = atomicAdd((unsigned int*)g_q_offsets, 1);
              if (loop_index == 0) {
                frontier2[off] = nid;
              } else {
                frontier[off] = nid;
              }
            }
          }
        }
        offset++;
      }
    }
    __syncthreads();

    if (lid == 0) {
      if (b_q_length > max_local_mem) {
        b_q_length = max_local_mem;
      }
      b_offset = atomicAdd((unsigned int*)g_q_offsets, b_q_length);
    }
    __syncthreads();

    l_mutex += gridDim.x;
    __gpu_sync(l_mutex);

    if (tid == 0) {
      g_q_size[0] = g_q_offsets[0];
      g_q_offsets[0] = 0;
    }

    if (lid < b_q_length) {
      if (loop_index == 0) {
        frontier2[lid + b_offset] = b_q[lid];
      } else {
        frontier[lid + b_offset] = b_q[lid];
      }
    }

    l_mutex += gridDim.x;
    __gpu_sync(l_mutex);

    if (g_q_size[0] < blockDim.x || g_q_size[0] > blockDim.x * gridDim.x) {
      break;
    }
    loop_index = (loop_index + 1) % 2;
    f_len = g_q_size[0];
  }

  if (loop_index == 0) {
    for (int i = tid; i < g_q_size[0]; i += blockDim.x * gridDim.x) {
      frontier[i] = frontier2[i];
    }
  }

  if (tid == 0) {
    frontier_length[0] = g_q_size[0];
  }
}