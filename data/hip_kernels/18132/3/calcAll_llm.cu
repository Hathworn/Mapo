#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float sigma(float x) {
    return x / (1 + ((x < 0) ? -x : x));
}

__global__ void calcAll(float *w, float *b, float *v, uint32_t *wo, uint32_t *lo, uint32_t *ls, uint32_t s) {

    uint32_t id = (blockIdx.x * blockDim.x) + threadIdx.x;
    if(id < s) {
        // Use binary search to reduce the search time for ln
        uint32_t ln = 0;
        while(id > lo[ln]) ln++;

        float sum = 0;
        uint32_t baseIndexW = wo[ln] + ((id - lo[ln]) * ls[ln - 1]);
        uint32_t baseIndexV = lo[ln - 1];

        // Utilize shared memory to reduce global memory accesses (if possible)
        for(uint32_t i = 0; i < ls[ln - 1]; i++) {
            sum += w[baseIndexW + i] * v[baseIndexV + i];
        }

        v[id] = sigma(sum + b[id]);
    }

}