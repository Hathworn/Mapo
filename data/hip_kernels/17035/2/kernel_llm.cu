#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float *id, float *od, int w, int h, int depth) 
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int z = blockIdx.z * blockDim.z + threadIdx.z;
    const int dataTotalSize = w * h * depth;
    const int radius = 2;
    const int filter_size = 2 * radius + 1;
    const int sW = 6;

    if (x >= w || y >= h || z >= depth) return;

    int idx = z * w * h + y * w + x;

    // Use shared memory
    __shared__ unsigned char smem[sW][sW];

    // Calculate shared memory indices with clamping
    int s_IdxY = threadIdx.y + radius;
    int s_IdxX = threadIdx.x + radius;

    // Load halo data into shared memory with boundary checks
    if (threadIdx.y < blockDim.y + 2 * radius && threadIdx.x < blockDim.x + 2 * radius) {
        int globalY = min(max(y - radius, 0), h - 1);
        int globalX = min(max(x - radius, 0), w - 1);
        int g_Idx = globalY * w + globalX;
        smem[s_IdxY][s_IdxX] = id[g_Idx];
    }
    __syncthreads();
    
    // Compute the sum using shared memory within the block
    float avg = 0.0;
    for (int i = -radius; i <= radius; i++) {
        avg += smem[s_IdxY + i][s_IdxX];
    }
    
    avg /= filter_size;

    // Write the result back to the global memory
    if (idx < dataTotalSize)
        od[idx] = avg;
}