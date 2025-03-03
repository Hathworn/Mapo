#include <stdio.h>
#include <hip/hip_runtime.h>
#include <hip/hip_runtime.h>
#include <vector>
#include <functional>
#include <math.h>
#include <time.h>
#include <random>
#include <assert.h>
#include <device_launch_parameters.h>

typedef unsigned char byte;

static void HandleError(hipError_t err,
                        const char *file,
                        int line)
{
    if (err != hipSuccess)
    {
        printf("%s in %s at line %d\n", hipGetErrorString(err),
               file, line);
        exit(EXIT_FAILURE);
    }
}
#define HANDLE_ERROR(err) (HandleError(err, __FILE__, __LINE__))
#define CUDA_CALL(err) (HandleError(err, __FILE__, __LINE__))

inline size_t get_number_of_parts(size_t whole, size_t divider)
{
    return ((whole + divider - 1) / divider);
}

#define CUDA_TIMED_BLOCK_START(fn_name)      \
    const char *___tmdFnName = fn_name;      \
    hipEvent_t startEvent, stopEvent;       \
    float elapsedTime;                       \
    CUDA_CALL(hipEventCreate(&startEvent)); \
    CUDA_CALL(hipEventCreate(&stopEvent));  \
    CUDA_CALL(hipEventRecord(startEvent, 0));

#define CUDA_TIMED_BLOCK_END                                              \
    CUDA_CALL(hipEventRecord(stopEvent, 0));                             \
    CUDA_CALL(hipEventSynchronize(stopEvent));                           \
    CUDA_CALL(hipEventElapsedTime(&elapsedTime, startEvent, stopEvent)); \
    printf("%s took: %f ms\n", ___tmdFnName, elapsedTime);                \
    CUDA_CALL(hipEventDestroy(startEvent));                              \
    CUDA_CALL(hipEventDestroy(stopEvent));

template <typename T>
bool all_not_eq(const std::vector<T> &data, const T &cmp)
{
    for (size_t i = 0; i < data.size(); i++)
    {
        if (data[i] == cmp)
            return false;
    }
    return true;
}

template <typename T>
void safe_cuda_free(T *ptr)
{
    if (ptr != nullptr)
    {
        hipFree(ptr);
    }
}
