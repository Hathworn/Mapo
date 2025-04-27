#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void generate_sources(hiprandState *state, int n, uint32_t *verts)
{
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Use a conditional check to avoid out-of-bounds access
    if (tid < n) {
        hiprandState local_state = state[tid];
        for (int id = tid; id < n; id += stride) {
            verts[id] = hiprand(&local_state);
        }
        state[tid] = local_state;
    }
}