#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcRouteBackwardGPU( float *dz_in, float *dz, int in_size_x, int in_size_y, int in_size_z, int z_offset, int elements )
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Calculate stride for efficient global memory access
    
    for (; id < elements; id += stride) { // Loop over elements with stride
        int temp_id = id; // Use a temporary variable to preserve original id for indexing
        int x = temp_id % in_size_x;
        temp_id /= in_size_x;
        int y = temp_id % in_size_y;
        temp_id /= in_size_y;
        int z = temp_id % in_size_z;
        temp_id /= in_size_z;
        int b = temp_id;

        int id_in = b * (in_size_z * in_size_x * in_size_y) + (z + z_offset) * (in_size_x * in_size_y) + y * in_size_x + x;
        atomicAdd(&dz[id], dz_in[id_in]); // Use atomicAdd to prevent race conditions
    }
}