#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void k_copy_reshape_rowmajor(unsigned int numEls, unsigned int a_nd, const float * a_data, const int * a_dim, const int * a_str, unsigned int z_nd, float * z_data, const int * z_dim, const int * z_str)
{
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;
    
    // Loop over all elements assigned to this thread
    for (unsigned int i = idx; i < numEls; i += numThreads)
    {
        const float * a_i = a_data;
        int a_ii = i;

        // Calculate the corresponding position in the source array
        for (unsigned int _d = 0; _d < a_nd; ++_d) {
            unsigned int d = a_nd - 1 - _d;
            int a_i_d = a_ii % a_dim[d];
            a_ii /= a_dim[d];
            a_i += a_i_d * a_str[d];
        }

        float * z_i = z_data;
        int z_ii = i;

        // Calculate the corresponding position in the destination array
        for (unsigned int _d = 0; _d < z_nd; ++_d) {
            unsigned int d = z_nd - 1 - _d;
            int z_i_d = z_ii % z_dim[d];
            z_ii /= z_dim[d];
            z_i += z_i_d * z_str[d];
        }

        z_i[0] = a_i[0]; // Copy data from source to destination
    }
}