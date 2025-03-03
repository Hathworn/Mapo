#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void generate_sources(hiprandState *state, int n, uint32_t *verts) {
int first = threadIdx.x + blockIdx.x * blockDim.x;
int stride = blockDim.x * gridDim.x;

hiprandState local_state = state[first];
for (int id = first ; id < n ; id += stride) {
verts[id] = hiprand(&local_state);
}

state[first] = local_state;
}