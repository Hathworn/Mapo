#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void frontier_init_kernel(int* p_frontier_tail_d, int* c_frontier_tail_d, int* p_frontier_d, int* visited_d, int* label_d, int source) {
    // Use a single thread to perform all initialization tasks for efficiency
    if (threadIdx.x == 0) {
        visited_d[source] = 1;
        *c_frontier_tail_d = 0;
        p_frontier_d[0] = source;
        *p_frontier_tail_d = 1;
        label_d[source] = 0;
    }
}