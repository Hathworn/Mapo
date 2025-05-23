#include "hip/hip_runtime.h"
#include "includes.h"

namespace {

}  // namespace

__global__ void join_add(const int *d1, const int *d2, int *d3) {
    // Use threadIdx to ensure only one thread does the work
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        d3[0] = d1[0] + d2[0];
    }
}