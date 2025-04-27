#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel using block and thread ID calculations
__global__ void update_veloc_elastic_kernel(float *veloc, const float *accel, const int size, const float deltatover2) {
    int id = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure id is within bounds
    if (id < size) {
        int index1 = id;
        int index2 = size + id;
        int index3 = 2 * size + id;
        
        // Optimized memory accesses with pre-computed indices
        float accel1 = accel[index1];
        float accel2 = accel[index2];
        float accel3 = accel[index3];

        veloc[index1] += deltatover2 * accel1;
        veloc[index2] += deltatover2 * accel2;
        veloc[index3] += deltatover2 * accel3;
    }
}