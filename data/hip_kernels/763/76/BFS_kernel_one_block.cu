#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void BFS_kernel_one_block( volatile unsigned int *frontier, unsigned int frontier_len, volatile unsigned int *cost, volatile int *visited, unsigned int *edgeArray, unsigned int *edgeArrayAux, unsigned int numVertices, unsigned int numEdges, volatile unsigned int *frontier_length, unsigned int num_p_per_mp, unsigned int w_q_size) { ; }