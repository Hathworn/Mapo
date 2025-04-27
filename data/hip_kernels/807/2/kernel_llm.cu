#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int power_modulo_fast(long a, long b, long m) {
    long result = 1;
    long x = a % m;

    for (long i = 1; i <= b; i <<= 1) {
        x %= m;
        if ((b & i) != 0) {
            result *= x;
            result %= m;
        }
        x *= x;
    }

    return result;
}

__device__ float generate(hiprandState* globalState, int ind) {
    hiprandState localState = globalState[ind];
    float RANDOM = hiprand_uniform(&localState);
    globalState[ind] = localState;
    return RANDOM;
}

__global__ void kernel(int p, bool* prime, hiprandState* globalState) {
    int i = blockIdx.x;
    int a = 0;

    // Utilize shared memory for faster access
    __shared__ bool shared_prime;
    if (threadIdx.x == 0) {
        shared_prime = *prime;
    }
    __syncthreads();

    while(shared_prime && i < PRECISION) {
        a = (generate(globalState, i % BLOCKS_NUBMER) * (p - 2)) + 1;
        if(power_modulo_fast(a, p - 1, p) == 1) {
            i += BLOCKS_NUBMER;
        } else {
            shared_prime = false;
        }
    }

    if (threadIdx.x == 0) {
        *prime = shared_prime;
    }
}