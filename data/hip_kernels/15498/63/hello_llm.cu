#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Use register memory for thread index
    int tid = threadIdx.x; 

    // Utilize fast shared memory for frequently accessed data
    __shared__ char message[32]; 
    sprintf(message, "Hello world! I'm thread %d\n", tid);

    // Coalesced memory access by reducing printf calls
    printf("%s", message);
}