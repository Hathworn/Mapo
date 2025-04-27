#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduce(double4 *ac, double4 *ac1, double4 *ac2, unsigned int bf_real, unsigned int dimension) {
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = dimension * bf_real;
    double4 myacc;

    extern __shared__ double4 shaccelerations[];

    // Combine similar operations using a pointer array for the inputs and outputs
    double4 *input_ac[] = {ac, ac1, ac2};
    double4 *output_ac[] = {ac, ac1, ac2};

    // Determine the data segment for this thread
    int segment = i / k;
    int local_index = i % k;

    if(segment < 3 && local_index < k) {
        myacc = input_ac[segment][local_index];
        shaccelerations[threadIdx.x] = input_ac[segment][local_index + k * segment];

        // Unroll the accumulation loop for efficiency
        myacc.x += shaccelerations[threadIdx.x].x;
        myacc.y += shaccelerations[threadIdx.x].y;
        myacc.z += shaccelerations[threadIdx.x].z;

        output_ac[segment][local_index] = myacc;
    }
}