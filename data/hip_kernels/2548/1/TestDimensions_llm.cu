#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TestDimensions()
{
    // Calculate number of threads per block and total blocks (unchanged)
    int const num_threads_per_block = blockDim.x * blockDim.y * blockDim.z;
    int const num_blocks = gridDim.x * gridDim.y * gridDim.z;
    int const threads_stride = num_threads_per_block * num_blocks;

    // Optimize calculation of thread_id using a more concise formula
    int const thread_id = ((blockIdx.z * gridDim.y + blockIdx.y) * gridDim.x + blockIdx.x) * num_threads_per_block +
                          threadIdx.z * blockDim.y * blockDim.x +
                          threadIdx.y * blockDim.x +
                          threadIdx.x;

    // Print once for the first thread
    if( thread_id == 0 ) 
    {
        printf( "gridDim   = x: %6d / y: %6d / z: %6d\r\n",
                gridDim.x, gridDim.y, gridDim.z );
        printf( "blockDim  = x: %6d / y: %6d / z: %6d\r\n",
                blockDim.x, blockDim.y, blockDim.z );
        printf( "num_threads_per_block: %6d\r\n", num_threads_per_block );
        printf( "num_blocks           : %6d\r\n", num_blocks );
        printf( "threads_stride       : %6d\r\n", threads_stride );
    }

    // Print details for all threads
    printf( "tidx | %6d | %6d | %6d | bidx | %6d | %6d | %6d | "
            "gdim | %6d | %6d | %6d | bdim | %6d | %6d | %6d | "
            "thread_id | %6d |\r\n",
            threadIdx.x, threadIdx.y, threadIdx.z,
            blockIdx.x, blockIdx.y, blockIdx.z,
            gridDim.x, gridDim.y, gridDim.z,
            blockDim.x, blockDim.y, blockDim.z, thread_id );

    return;
}