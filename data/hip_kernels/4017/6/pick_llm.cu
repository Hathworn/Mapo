#include "hip/hip_runtime.h"
#include "includes.h"

/**
 * Optimized Kronecker product of two matrices kernel
 * input :
 * a : first matrix
 * nax, nay : matrix a dimensions
 * b: second matrix
 * nbx, nby : matrix b dimensions
 * results : kronecker product of a and b
 **/

__global__ void pick(size_t N , size_t * d_dst, unsigned long seed)
{
    int myId = blockIdx.x * blockDim.x + threadIdx.x;
    if (myId >= N)
        return;

    hiprandState state;
    // Initialize hiprand state with unique per thread stride for efficiency
    hiprand_init(seed, myId, 0, &state);

    // Use volatile to prevent compiler optimizations influencing random number generation
    volatile float RANDOM = hiprand_uniform(&state);
    d_dst[myId] = (size_t)(RANDOM * N);  // Remove unnecessary subtraction for efficiency
}