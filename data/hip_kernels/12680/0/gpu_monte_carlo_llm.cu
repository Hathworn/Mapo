#include "hip/hip_runtime.h"
#include "hiprand_kernel.h"

#define TRIALS_PER_THREAD 4096
#define BLOCKS 256
#define THREADS 256

#ifdef DP
typedef double Real;
#define PI  3.14159265358979323846
#else
typedef float Real;
#define PI 3.1415926535
#endif

// Improved kernel function
__global__ void gpu_monte_carlo(Real *estimate, hiprandState *states, int trials) {
    unsigned int tid = threadIdx.x + blockDim.x * blockIdx.x;
    int points_in_circle = 0;
    Real x, y;
    
    // Initialize state only once per thread instead of every trial
    hiprand_init(1234, tid, 0, &states[tid]);

    // Use shared memory to reduce global memory access latency
    extern __shared__ int shared_points_in_circle[];
    shared_points_in_circle[threadIdx.x] = 0;
    
    for(int i = 0; i < trials; i++) {
        x = hiprand_uniform(&states[tid]);
        y = hiprand_uniform(&states[tid]);
        shared_points_in_circle[threadIdx.x] += (x * x + y * y <= 1.0f);
    }

    // Aggregate results from shared memory to reduce divergence
    __syncthreads();
    if (threadIdx.x == 0) {
        int block_points_in_circle = 0;
        for (int i = 0; i < blockDim.x; i++) {
            block_points_in_circle += shared_points_in_circle[i];
        }
        estimate[blockIdx.x] = 4.0f * block_points_in_circle / (Real)(trials * blockDim.x);
    }
}