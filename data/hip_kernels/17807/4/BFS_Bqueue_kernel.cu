#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void BFS_Bqueue_kernel(int* p_frontier, int* p_frontier_tail, int* c_frontier, int* c_frontier_tail, int* edges, int* dest, int* label, int* visited) {

__shared__ int c_frontier_s[BLOCK_QUEUE_SIZE];
__shared__ int c_frontier_tail_s;
__shared__ int our_c_frontier_tail;

if (threadIdx.x == 0) {
c_frontier_tail_s = 0;
}
__syncthreads();
int subQueueIndex = threadIdx.x & (NUM_SUB_QUEUE - 1);
if (subQueueIndex < NUM_SUB_QUEUE) {
const int tid = blockIdx.x * blockDim.x + threadIdx.x;
if (tid < *p_frontier_tail) {
const int my_vertex = p_frontier[tid];
for (int i = edges[my_vertex]; i < edges[my_vertex + 1]; ++i) {
const int was_visited = atomicExch(&(visited[dest[i]]), 1);
if (not was_visited) {
label[dest[i]] = label[my_vertex] + 1;
const int my_tail = atomicAdd(&c_frontier_tail_s, 1);
if (my_tail < BLOCK_QUEUE_SIZE) {
c_frontier_s[my_tail] = dest[i];
} else {
c_frontier_tail_s = BLOCK_QUEUE_SIZE;
const int my_global_tail = atomicAdd(c_frontier_tail, 1);
c_frontier[my_global_tail] = dest[i];
}
}
}
}
__syncthreads();

if (threadIdx.x == 0) {
our_c_frontier_tail = atomicAdd(c_frontier_tail, c_frontier_tail_s);
}
__syncthreads();

for (int i = threadIdx.x; i < c_frontier_tail_s; i+= blockDim.x) {
c_frontier[our_c_frontier_tail + i] = c_frontier_s[i];
}
}
__syncwarp();
}