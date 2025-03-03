#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernBiasAndLog(double* sumexp, double* bias) {
*sumexp = *bias + log(*sumexp);
}