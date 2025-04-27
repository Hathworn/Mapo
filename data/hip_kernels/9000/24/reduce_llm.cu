#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduce(double4 *ac, double4 *ac1, double4 *ac2, unsigned int bf_real, unsigned int dimension) {
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = dimension * bf_real;
    double4 myacc;

    extern __shared__ double4 shaccelerations[];
    double4 *shacc = (double4*)shaccelerations;

    if (i < 3 * k) {
        // Reduce the number of branches by grouping them
        if (i < k) {
            myacc = ac[i];
        } else if (i < 2 * k) {
            myacc = ac1[i - k];
        } else {
            myacc = ac2[i - 2 * k];
        }

        // Load into shared memory and perform the reduction
        shacc[threadIdx.x] = (i < k) ? ac[i + k] : ((i < 2 * k) ? ac1[i] : ac2[i - k]);

        // Accumulate results
        myacc.x += shacc[threadIdx.x].x;
        myacc.y += shacc[threadIdx.x].y;
        myacc.z += shacc[threadIdx.x].z;

        // Write back results based on range
        if (i < k) {
            ac[i] = myacc;
        } else if (i < 2 * k) {
            ac1[i - k] = myacc;
        } else {
            ac2[i - 2 * k] = myacc;
        }
    }
}