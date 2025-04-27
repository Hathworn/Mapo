#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX_THREADS 20
#define pi(x) printf("%d\n",x);
#define HANDLE_ERROR(err) ( HandleError( err, __FILE__, __LINE__ ) )
#define th_p_block  256

__global__ void dotPro(long n, float *vec1, float *vec2, float *vec3) {

    // Allocate shared memory
    __shared__ float cache[th_p_block];

    unsigned tid = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int cacheIdx = threadIdx.x;

    float temp = 0;
    // Efficient strided loop
    for (; tid < n; tid += blockDim.x * gridDim.x) {
        temp += vec1[tid] * vec2[tid];
    }

    cache[cacheIdx] = temp;
    __syncthreads();

    // Efficient reduction using loop unrolling
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (cacheIdx < stride) {
            cache[cacheIdx] += cache[cacheIdx + stride];
        }
        __syncthreads();
    }

    // Only first thread writes the result
    if (cacheIdx == 0) {
        vec3[blockIdx.x] = cache[0];
    }
}