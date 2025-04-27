#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_m(unsigned int *ind, unsigned int *scand, unsigned int shift, const unsigned int ne)
{
    unsigned int sosm = 1 << shift;
    int m_i_b = blockIdx.x * blockDim.x + threadIdx.x;
    if (m_i_b < ne) {  // Swap the conditional check to minimize thread divergence
        scand[m_i_b] = (ind[m_i_b] & sosm) ? 0 : 1;
    }
}