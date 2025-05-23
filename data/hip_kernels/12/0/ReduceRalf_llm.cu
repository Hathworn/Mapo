#include "hip/hip_runtime.h"
#include "includes.h"

//#define USE_DOUBLES

#ifdef USE_DOUBLES
typedef double my_float;
#else
typedef long long int my_float;
#endif

// convention   - any array without d_* is located on CPU
//              - any array with d_ is on device (GPU)

//const size_t NofS = 1<<20;
const size_t NofS = 1048576;
const size_t NofThreads = 1024;

//const size_t NofS=12;

__global__ void ReduceRalf(my_float *d_Array, my_float *d_ReducedArray, int N, int current)
{
    int my_x = threadIdx.x + blockIdx.x * blockDim.x + current;
    int tx = threadIdx.x;

    __shared__ my_float sm[1024];
    my_float cur = 0.0;
    
    // Load elements to shared memory with bounds check
    if (my_x < N)
        cur = d_Array[my_x];
    if (my_x + blockDim.x * gridDim.x < N)
        cur += d_Array[my_x + blockDim.x * gridDim.x];
    
    sm[tx] = cur;
    
    // Reduce within a block using unrolled loop for better performance
    __syncthreads();
    for (int i = blockDim.x / 2; i > 0; i /= 2)
    {
        if (tx < i)
            sm[tx] += sm[tx + i];
        __syncthreads(); // Synchronize to ensure all threads have updated the value
    }

    // Write the result for this block to global memory
    if (tx == 0)
        d_ReducedArray[blockIdx.x] = sm[0];
}