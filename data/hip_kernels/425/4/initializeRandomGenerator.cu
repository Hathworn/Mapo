#include "hip/hip_runtime.h"
#include "includes.h"

/*****************************************************************************/
/* Вычислить активационную функцию y(x) = 2x / (1 + abs(x)). */
/*****************************************************************************/
//inline REAL OpenNNL::activation(REAL x, TActivationKind kind)
__global__ void initializeRandomGenerator ( hiprandState * state, unsigned long seed, int count )
{
int idx = blockIdx.x * blockDim.x + threadIdx.x;

if(idx < count)
hiprand_init ( seed, idx, 0, &state[idx] );
}