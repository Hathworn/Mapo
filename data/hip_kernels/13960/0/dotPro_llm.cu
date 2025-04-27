#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX_THREADS 20
#define pi(x) printf("%d\n",x);
#define HANDLE_ERROR(err) ( HandleError( err, __FILE__, __LINE__ ) )
#define th_p_block  256

__global__ void dotPro(long n, double *vec1, double *vec2, double *vec3) {

    __shared__ double cache[th_p_block];
    unsigned tid = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int cacheIdx =  threadIdx.x;
    double temp = 0;

    // Load data into shared memory and compute partial dot product
    while(tid < n) {
        temp += vec1[tid] * vec2[tid];
        tid += blockDim.x * gridDim.x;
    }
    cache[cacheIdx] = temp;
    __syncthreads();

    // Perform parallel reduction
    for(unsigned int i = blockDim.x/2; i > 0; i >>= 1) {
        if(cacheIdx < i) {
            cache[cacheIdx] += cache[cacheIdx + i];
        }
        __syncthreads(); // Ensure that all additions at this level are complete
    }

    // Write result for this block to global memory
    if(cacheIdx == 0) {
        vec3[blockIdx.x] = cache[0];
    }
}