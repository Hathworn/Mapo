#include "hip/hip_runtime.h"
#include "includes.h"
/*
cudaStructTest
testing/optimizing how to access/manipulate/return
structures in cuda.
*/

#define N 30
#define TRUE 1
#define FALSE 0
#define MAX_BLOCKS 65000

typedef struct {
    int id;
    int age;
    int height;
} Person;

// Optimize global kernel function
__global__ void analyze_age(Person *people, int *statResults) {
    int id = threadIdx.x + blockIdx.x * blockDim.x;

    if (id < N) {
        Person person = people[id];

        // Simplify conditional logic
        statResults[id] = (person.age != 28);
    }
}