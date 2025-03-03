#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Random( float *results, long int n, unsigned int seed ) {
int idx = blockIdx.x * blockDim.x + threadIdx.x;
hiprandState_t state;

hiprand_init(seed, blockIdx.x, 0, &state);
results[ idx ] = (float)hiprand(&state) / 1000.0f;
// if( idx < n ){
//   results[ idx ] = 1.0;
// }
}