#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_vb(float *d_verts_ptr, int vertex_count, float timeElapsed)
{
    // Calculate the threadId and check the range within vertex_count
    unsigned long long int threadId = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned long long int idx = threadId * 4;

    // Ensure the access is within bounds
    if (threadId < vertex_count)
    {
        // Direct computation and updating to improve memory coalescing
        d_verts_ptr[idx + 0] *= timeElapsed;
        d_verts_ptr[idx + 1] *= timeElapsed;
        d_verts_ptr[idx + 2] *= timeElapsed;
    }
}