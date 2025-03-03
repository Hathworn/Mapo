; ModuleID = '../data/hip_kernels/17313/0/main.cu'
source_filename = "../data/hip_kernels/17313/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z9calc_freqPiiPci(i32 addrspace(1)* nocapture %0, i32 %1, i8 addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #1 {
  %5 = alloca [128 x i32], align 16, addrspace(5)
  %6 = bitcast [128 x i32] addrspace(5)* %5 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 512, i8 addrspace(5)* %6) #3
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 0
  store i32 0, i32 addrspace(5)* %13, align 16, !tbaa !7
  %14 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 1
  store i32 0, i32 addrspace(5)* %14, align 4, !tbaa !7
  %15 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 2
  store i32 0, i32 addrspace(5)* %15, align 8, !tbaa !7
  %16 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 3
  store i32 0, i32 addrspace(5)* %16, align 4, !tbaa !7
  %17 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 4
  store i32 0, i32 addrspace(5)* %17, align 16, !tbaa !7
  %18 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 5
  store i32 0, i32 addrspace(5)* %18, align 4, !tbaa !7
  %19 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 6
  store i32 0, i32 addrspace(5)* %19, align 8, !tbaa !7
  %20 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 7
  store i32 0, i32 addrspace(5)* %20, align 4, !tbaa !7
  %21 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 8
  store i32 0, i32 addrspace(5)* %21, align 16, !tbaa !7
  %22 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 9
  store i32 0, i32 addrspace(5)* %22, align 4, !tbaa !7
  %23 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 10
  store i32 0, i32 addrspace(5)* %23, align 8, !tbaa !7
  %24 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 11
  store i32 0, i32 addrspace(5)* %24, align 4, !tbaa !7
  %25 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 12
  store i32 0, i32 addrspace(5)* %25, align 16, !tbaa !7
  %26 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 13
  store i32 0, i32 addrspace(5)* %26, align 4, !tbaa !7
  %27 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 14
  store i32 0, i32 addrspace(5)* %27, align 8, !tbaa !7
  %28 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 15
  store i32 0, i32 addrspace(5)* %28, align 4, !tbaa !7
  %29 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 16
  store i32 0, i32 addrspace(5)* %29, align 16, !tbaa !7
  %30 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 17
  store i32 0, i32 addrspace(5)* %30, align 4, !tbaa !7
  %31 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 18
  store i32 0, i32 addrspace(5)* %31, align 8, !tbaa !7
  %32 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 19
  store i32 0, i32 addrspace(5)* %32, align 4, !tbaa !7
  %33 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 20
  store i32 0, i32 addrspace(5)* %33, align 16, !tbaa !7
  %34 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 21
  store i32 0, i32 addrspace(5)* %34, align 4, !tbaa !7
  %35 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 22
  store i32 0, i32 addrspace(5)* %35, align 8, !tbaa !7
  %36 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 23
  store i32 0, i32 addrspace(5)* %36, align 4, !tbaa !7
  %37 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 24
  store i32 0, i32 addrspace(5)* %37, align 16, !tbaa !7
  %38 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 25
  store i32 0, i32 addrspace(5)* %38, align 4, !tbaa !7
  %39 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 26
  store i32 0, i32 addrspace(5)* %39, align 8, !tbaa !7
  %40 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 27
  store i32 0, i32 addrspace(5)* %40, align 4, !tbaa !7
  %41 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 28
  store i32 0, i32 addrspace(5)* %41, align 16, !tbaa !7
  %42 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 29
  store i32 0, i32 addrspace(5)* %42, align 4, !tbaa !7
  %43 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 30
  store i32 0, i32 addrspace(5)* %43, align 8, !tbaa !7
  %44 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 31
  store i32 0, i32 addrspace(5)* %44, align 4, !tbaa !7
  %45 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 32
  store i32 0, i32 addrspace(5)* %45, align 16, !tbaa !7
  %46 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 33
  store i32 0, i32 addrspace(5)* %46, align 4, !tbaa !7
  %47 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 34
  store i32 0, i32 addrspace(5)* %47, align 8, !tbaa !7
  %48 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 35
  store i32 0, i32 addrspace(5)* %48, align 4, !tbaa !7
  %49 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 36
  store i32 0, i32 addrspace(5)* %49, align 16, !tbaa !7
  %50 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 37
  store i32 0, i32 addrspace(5)* %50, align 4, !tbaa !7
  %51 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 38
  store i32 0, i32 addrspace(5)* %51, align 8, !tbaa !7
  %52 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 39
  store i32 0, i32 addrspace(5)* %52, align 4, !tbaa !7
  %53 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 40
  store i32 0, i32 addrspace(5)* %53, align 16, !tbaa !7
  %54 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 41
  store i32 0, i32 addrspace(5)* %54, align 4, !tbaa !7
  %55 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 42
  store i32 0, i32 addrspace(5)* %55, align 8, !tbaa !7
  %56 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 43
  store i32 0, i32 addrspace(5)* %56, align 4, !tbaa !7
  %57 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 44
  store i32 0, i32 addrspace(5)* %57, align 16, !tbaa !7
  %58 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 45
  store i32 0, i32 addrspace(5)* %58, align 4, !tbaa !7
  %59 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 46
  store i32 0, i32 addrspace(5)* %59, align 8, !tbaa !7
  %60 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 47
  store i32 0, i32 addrspace(5)* %60, align 4, !tbaa !7
  %61 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 48
  store i32 0, i32 addrspace(5)* %61, align 16, !tbaa !7
  %62 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 49
  store i32 0, i32 addrspace(5)* %62, align 4, !tbaa !7
  %63 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 50
  store i32 0, i32 addrspace(5)* %63, align 8, !tbaa !7
  %64 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 51
  store i32 0, i32 addrspace(5)* %64, align 4, !tbaa !7
  %65 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 52
  store i32 0, i32 addrspace(5)* %65, align 16, !tbaa !7
  %66 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 53
  store i32 0, i32 addrspace(5)* %66, align 4, !tbaa !7
  %67 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 54
  store i32 0, i32 addrspace(5)* %67, align 8, !tbaa !7
  %68 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 55
  store i32 0, i32 addrspace(5)* %68, align 4, !tbaa !7
  %69 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 56
  store i32 0, i32 addrspace(5)* %69, align 16, !tbaa !7
  %70 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 57
  store i32 0, i32 addrspace(5)* %70, align 4, !tbaa !7
  %71 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 58
  store i32 0, i32 addrspace(5)* %71, align 8, !tbaa !7
  %72 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 59
  store i32 0, i32 addrspace(5)* %72, align 4, !tbaa !7
  %73 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 60
  store i32 0, i32 addrspace(5)* %73, align 16, !tbaa !7
  %74 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 61
  store i32 0, i32 addrspace(5)* %74, align 4, !tbaa !7
  %75 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 62
  store i32 0, i32 addrspace(5)* %75, align 8, !tbaa !7
  %76 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 63
  store i32 0, i32 addrspace(5)* %76, align 4, !tbaa !7
  %77 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 64
  store i32 0, i32 addrspace(5)* %77, align 16, !tbaa !7
  %78 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 65
  store i32 0, i32 addrspace(5)* %78, align 4, !tbaa !7
  %79 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 66
  store i32 0, i32 addrspace(5)* %79, align 8, !tbaa !7
  %80 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 67
  store i32 0, i32 addrspace(5)* %80, align 4, !tbaa !7
  %81 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 68
  store i32 0, i32 addrspace(5)* %81, align 16, !tbaa !7
  %82 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 69
  store i32 0, i32 addrspace(5)* %82, align 4, !tbaa !7
  %83 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 70
  store i32 0, i32 addrspace(5)* %83, align 8, !tbaa !7
  %84 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 71
  store i32 0, i32 addrspace(5)* %84, align 4, !tbaa !7
  %85 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 72
  store i32 0, i32 addrspace(5)* %85, align 16, !tbaa !7
  %86 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 73
  store i32 0, i32 addrspace(5)* %86, align 4, !tbaa !7
  %87 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 74
  store i32 0, i32 addrspace(5)* %87, align 8, !tbaa !7
  %88 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 75
  store i32 0, i32 addrspace(5)* %88, align 4, !tbaa !7
  %89 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 76
  store i32 0, i32 addrspace(5)* %89, align 16, !tbaa !7
  %90 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 77
  store i32 0, i32 addrspace(5)* %90, align 4, !tbaa !7
  %91 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 78
  store i32 0, i32 addrspace(5)* %91, align 8, !tbaa !7
  %92 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 79
  store i32 0, i32 addrspace(5)* %92, align 4, !tbaa !7
  %93 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 80
  store i32 0, i32 addrspace(5)* %93, align 16, !tbaa !7
  %94 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 81
  store i32 0, i32 addrspace(5)* %94, align 4, !tbaa !7
  %95 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 82
  store i32 0, i32 addrspace(5)* %95, align 8, !tbaa !7
  %96 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 83
  store i32 0, i32 addrspace(5)* %96, align 4, !tbaa !7
  %97 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 84
  store i32 0, i32 addrspace(5)* %97, align 16, !tbaa !7
  %98 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 85
  store i32 0, i32 addrspace(5)* %98, align 4, !tbaa !7
  %99 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 86
  store i32 0, i32 addrspace(5)* %99, align 8, !tbaa !7
  %100 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 87
  store i32 0, i32 addrspace(5)* %100, align 4, !tbaa !7
  %101 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 88
  store i32 0, i32 addrspace(5)* %101, align 16, !tbaa !7
  %102 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 89
  store i32 0, i32 addrspace(5)* %102, align 4, !tbaa !7
  %103 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 90
  store i32 0, i32 addrspace(5)* %103, align 8, !tbaa !7
  %104 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 91
  store i32 0, i32 addrspace(5)* %104, align 4, !tbaa !7
  %105 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 92
  store i32 0, i32 addrspace(5)* %105, align 16, !tbaa !7
  %106 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 93
  store i32 0, i32 addrspace(5)* %106, align 4, !tbaa !7
  %107 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 94
  store i32 0, i32 addrspace(5)* %107, align 8, !tbaa !7
  %108 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 95
  store i32 0, i32 addrspace(5)* %108, align 4, !tbaa !7
  %109 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 96
  store i32 0, i32 addrspace(5)* %109, align 16, !tbaa !7
  %110 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 97
  store i32 0, i32 addrspace(5)* %110, align 4, !tbaa !7
  %111 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 98
  store i32 0, i32 addrspace(5)* %111, align 8, !tbaa !7
  %112 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 99
  store i32 0, i32 addrspace(5)* %112, align 4, !tbaa !7
  %113 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 100
  store i32 0, i32 addrspace(5)* %113, align 16, !tbaa !7
  %114 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 101
  store i32 0, i32 addrspace(5)* %114, align 4, !tbaa !7
  %115 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 102
  store i32 0, i32 addrspace(5)* %115, align 8, !tbaa !7
  %116 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 103
  store i32 0, i32 addrspace(5)* %116, align 4, !tbaa !7
  %117 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 104
  store i32 0, i32 addrspace(5)* %117, align 16, !tbaa !7
  %118 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 105
  store i32 0, i32 addrspace(5)* %118, align 4, !tbaa !7
  %119 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 106
  store i32 0, i32 addrspace(5)* %119, align 8, !tbaa !7
  %120 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 107
  store i32 0, i32 addrspace(5)* %120, align 4, !tbaa !7
  %121 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 108
  store i32 0, i32 addrspace(5)* %121, align 16, !tbaa !7
  %122 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 109
  store i32 0, i32 addrspace(5)* %122, align 4, !tbaa !7
  %123 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 110
  store i32 0, i32 addrspace(5)* %123, align 8, !tbaa !7
  %124 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 111
  store i32 0, i32 addrspace(5)* %124, align 4, !tbaa !7
  %125 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 112
  store i32 0, i32 addrspace(5)* %125, align 16, !tbaa !7
  %126 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 113
  store i32 0, i32 addrspace(5)* %126, align 4, !tbaa !7
  %127 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 114
  store i32 0, i32 addrspace(5)* %127, align 8, !tbaa !7
  %128 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 115
  store i32 0, i32 addrspace(5)* %128, align 4, !tbaa !7
  %129 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 116
  store i32 0, i32 addrspace(5)* %129, align 16, !tbaa !7
  %130 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 117
  store i32 0, i32 addrspace(5)* %130, align 4, !tbaa !7
  %131 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 118
  store i32 0, i32 addrspace(5)* %131, align 8, !tbaa !7
  %132 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 119
  store i32 0, i32 addrspace(5)* %132, align 4, !tbaa !7
  %133 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 120
  store i32 0, i32 addrspace(5)* %133, align 16, !tbaa !7
  %134 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 121
  store i32 0, i32 addrspace(5)* %134, align 4, !tbaa !7
  %135 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 122
  store i32 0, i32 addrspace(5)* %135, align 8, !tbaa !7
  %136 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 123
  store i32 0, i32 addrspace(5)* %136, align 4, !tbaa !7
  %137 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 124
  store i32 0, i32 addrspace(5)* %137, align 16, !tbaa !7
  %138 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 125
  store i32 0, i32 addrspace(5)* %138, align 4, !tbaa !7
  %139 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 126
  store i32 0, i32 addrspace(5)* %139, align 8, !tbaa !7
  %140 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 127
  store i32 0, i32 addrspace(5)* %140, align 4, !tbaa !7
  %141 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %142 = mul i32 %141, %11
  %143 = add i32 %142, %12
  %144 = icmp slt i32 %143, %1
  br i1 %144, label %529, label %145

145:                                              ; preds = %529, %4
  %146 = load i32, i32 addrspace(5)* %13, align 16, !tbaa !7
  %147 = atomicrmw add i32 addrspace(1)* %0, i32 %146 syncscope("agent-one-as") monotonic, align 4
  %148 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 1
  %149 = load i32, i32 addrspace(5)* %14, align 4, !tbaa !7
  %150 = atomicrmw add i32 addrspace(1)* %148, i32 %149 syncscope("agent-one-as") monotonic, align 4
  %151 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 2
  %152 = load i32, i32 addrspace(5)* %15, align 8, !tbaa !7
  %153 = atomicrmw add i32 addrspace(1)* %151, i32 %152 syncscope("agent-one-as") monotonic, align 4
  %154 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 3
  %155 = load i32, i32 addrspace(5)* %16, align 4, !tbaa !7
  %156 = atomicrmw add i32 addrspace(1)* %154, i32 %155 syncscope("agent-one-as") monotonic, align 4
  %157 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 4
  %158 = load i32, i32 addrspace(5)* %17, align 16, !tbaa !7
  %159 = atomicrmw add i32 addrspace(1)* %157, i32 %158 syncscope("agent-one-as") monotonic, align 4
  %160 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 5
  %161 = load i32, i32 addrspace(5)* %18, align 4, !tbaa !7
  %162 = atomicrmw add i32 addrspace(1)* %160, i32 %161 syncscope("agent-one-as") monotonic, align 4
  %163 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 6
  %164 = load i32, i32 addrspace(5)* %19, align 8, !tbaa !7
  %165 = atomicrmw add i32 addrspace(1)* %163, i32 %164 syncscope("agent-one-as") monotonic, align 4
  %166 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 7
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !7
  %168 = atomicrmw add i32 addrspace(1)* %166, i32 %167 syncscope("agent-one-as") monotonic, align 4
  %169 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 8
  %170 = load i32, i32 addrspace(5)* %21, align 16, !tbaa !7
  %171 = atomicrmw add i32 addrspace(1)* %169, i32 %170 syncscope("agent-one-as") monotonic, align 4
  %172 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 9
  %173 = load i32, i32 addrspace(5)* %22, align 4, !tbaa !7
  %174 = atomicrmw add i32 addrspace(1)* %172, i32 %173 syncscope("agent-one-as") monotonic, align 4
  %175 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 10
  %176 = load i32, i32 addrspace(5)* %23, align 8, !tbaa !7
  %177 = atomicrmw add i32 addrspace(1)* %175, i32 %176 syncscope("agent-one-as") monotonic, align 4
  %178 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 11
  %179 = load i32, i32 addrspace(5)* %24, align 4, !tbaa !7
  %180 = atomicrmw add i32 addrspace(1)* %178, i32 %179 syncscope("agent-one-as") monotonic, align 4
  %181 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 12
  %182 = load i32, i32 addrspace(5)* %25, align 16, !tbaa !7
  %183 = atomicrmw add i32 addrspace(1)* %181, i32 %182 syncscope("agent-one-as") monotonic, align 4
  %184 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 13
  %185 = load i32, i32 addrspace(5)* %26, align 4, !tbaa !7
  %186 = atomicrmw add i32 addrspace(1)* %184, i32 %185 syncscope("agent-one-as") monotonic, align 4
  %187 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 14
  %188 = load i32, i32 addrspace(5)* %27, align 8, !tbaa !7
  %189 = atomicrmw add i32 addrspace(1)* %187, i32 %188 syncscope("agent-one-as") monotonic, align 4
  %190 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 15
  %191 = load i32, i32 addrspace(5)* %28, align 4, !tbaa !7
  %192 = atomicrmw add i32 addrspace(1)* %190, i32 %191 syncscope("agent-one-as") monotonic, align 4
  %193 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 16
  %194 = load i32, i32 addrspace(5)* %29, align 16, !tbaa !7
  %195 = atomicrmw add i32 addrspace(1)* %193, i32 %194 syncscope("agent-one-as") monotonic, align 4
  %196 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 17
  %197 = load i32, i32 addrspace(5)* %30, align 4, !tbaa !7
  %198 = atomicrmw add i32 addrspace(1)* %196, i32 %197 syncscope("agent-one-as") monotonic, align 4
  %199 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 18
  %200 = load i32, i32 addrspace(5)* %31, align 8, !tbaa !7
  %201 = atomicrmw add i32 addrspace(1)* %199, i32 %200 syncscope("agent-one-as") monotonic, align 4
  %202 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 19
  %203 = load i32, i32 addrspace(5)* %32, align 4, !tbaa !7
  %204 = atomicrmw add i32 addrspace(1)* %202, i32 %203 syncscope("agent-one-as") monotonic, align 4
  %205 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 20
  %206 = load i32, i32 addrspace(5)* %33, align 16, !tbaa !7
  %207 = atomicrmw add i32 addrspace(1)* %205, i32 %206 syncscope("agent-one-as") monotonic, align 4
  %208 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 21
  %209 = load i32, i32 addrspace(5)* %34, align 4, !tbaa !7
  %210 = atomicrmw add i32 addrspace(1)* %208, i32 %209 syncscope("agent-one-as") monotonic, align 4
  %211 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 22
  %212 = load i32, i32 addrspace(5)* %35, align 8, !tbaa !7
  %213 = atomicrmw add i32 addrspace(1)* %211, i32 %212 syncscope("agent-one-as") monotonic, align 4
  %214 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 23
  %215 = load i32, i32 addrspace(5)* %36, align 4, !tbaa !7
  %216 = atomicrmw add i32 addrspace(1)* %214, i32 %215 syncscope("agent-one-as") monotonic, align 4
  %217 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 24
  %218 = load i32, i32 addrspace(5)* %37, align 16, !tbaa !7
  %219 = atomicrmw add i32 addrspace(1)* %217, i32 %218 syncscope("agent-one-as") monotonic, align 4
  %220 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 25
  %221 = load i32, i32 addrspace(5)* %38, align 4, !tbaa !7
  %222 = atomicrmw add i32 addrspace(1)* %220, i32 %221 syncscope("agent-one-as") monotonic, align 4
  %223 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 26
  %224 = load i32, i32 addrspace(5)* %39, align 8, !tbaa !7
  %225 = atomicrmw add i32 addrspace(1)* %223, i32 %224 syncscope("agent-one-as") monotonic, align 4
  %226 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 27
  %227 = load i32, i32 addrspace(5)* %40, align 4, !tbaa !7
  %228 = atomicrmw add i32 addrspace(1)* %226, i32 %227 syncscope("agent-one-as") monotonic, align 4
  %229 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 28
  %230 = load i32, i32 addrspace(5)* %41, align 16, !tbaa !7
  %231 = atomicrmw add i32 addrspace(1)* %229, i32 %230 syncscope("agent-one-as") monotonic, align 4
  %232 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 29
  %233 = load i32, i32 addrspace(5)* %42, align 4, !tbaa !7
  %234 = atomicrmw add i32 addrspace(1)* %232, i32 %233 syncscope("agent-one-as") monotonic, align 4
  %235 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 30
  %236 = load i32, i32 addrspace(5)* %43, align 8, !tbaa !7
  %237 = atomicrmw add i32 addrspace(1)* %235, i32 %236 syncscope("agent-one-as") monotonic, align 4
  %238 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 31
  %239 = load i32, i32 addrspace(5)* %44, align 4, !tbaa !7
  %240 = atomicrmw add i32 addrspace(1)* %238, i32 %239 syncscope("agent-one-as") monotonic, align 4
  %241 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 32
  %242 = load i32, i32 addrspace(5)* %45, align 16, !tbaa !7
  %243 = atomicrmw add i32 addrspace(1)* %241, i32 %242 syncscope("agent-one-as") monotonic, align 4
  %244 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 33
  %245 = load i32, i32 addrspace(5)* %46, align 4, !tbaa !7
  %246 = atomicrmw add i32 addrspace(1)* %244, i32 %245 syncscope("agent-one-as") monotonic, align 4
  %247 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 34
  %248 = load i32, i32 addrspace(5)* %47, align 8, !tbaa !7
  %249 = atomicrmw add i32 addrspace(1)* %247, i32 %248 syncscope("agent-one-as") monotonic, align 4
  %250 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 35
  %251 = load i32, i32 addrspace(5)* %48, align 4, !tbaa !7
  %252 = atomicrmw add i32 addrspace(1)* %250, i32 %251 syncscope("agent-one-as") monotonic, align 4
  %253 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 36
  %254 = load i32, i32 addrspace(5)* %49, align 16, !tbaa !7
  %255 = atomicrmw add i32 addrspace(1)* %253, i32 %254 syncscope("agent-one-as") monotonic, align 4
  %256 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 37
  %257 = load i32, i32 addrspace(5)* %50, align 4, !tbaa !7
  %258 = atomicrmw add i32 addrspace(1)* %256, i32 %257 syncscope("agent-one-as") monotonic, align 4
  %259 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 38
  %260 = load i32, i32 addrspace(5)* %51, align 8, !tbaa !7
  %261 = atomicrmw add i32 addrspace(1)* %259, i32 %260 syncscope("agent-one-as") monotonic, align 4
  %262 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 39
  %263 = load i32, i32 addrspace(5)* %52, align 4, !tbaa !7
  %264 = atomicrmw add i32 addrspace(1)* %262, i32 %263 syncscope("agent-one-as") monotonic, align 4
  %265 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 40
  %266 = load i32, i32 addrspace(5)* %53, align 16, !tbaa !7
  %267 = atomicrmw add i32 addrspace(1)* %265, i32 %266 syncscope("agent-one-as") monotonic, align 4
  %268 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 41
  %269 = load i32, i32 addrspace(5)* %54, align 4, !tbaa !7
  %270 = atomicrmw add i32 addrspace(1)* %268, i32 %269 syncscope("agent-one-as") monotonic, align 4
  %271 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 42
  %272 = load i32, i32 addrspace(5)* %55, align 8, !tbaa !7
  %273 = atomicrmw add i32 addrspace(1)* %271, i32 %272 syncscope("agent-one-as") monotonic, align 4
  %274 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 43
  %275 = load i32, i32 addrspace(5)* %56, align 4, !tbaa !7
  %276 = atomicrmw add i32 addrspace(1)* %274, i32 %275 syncscope("agent-one-as") monotonic, align 4
  %277 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 44
  %278 = load i32, i32 addrspace(5)* %57, align 16, !tbaa !7
  %279 = atomicrmw add i32 addrspace(1)* %277, i32 %278 syncscope("agent-one-as") monotonic, align 4
  %280 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 45
  %281 = load i32, i32 addrspace(5)* %58, align 4, !tbaa !7
  %282 = atomicrmw add i32 addrspace(1)* %280, i32 %281 syncscope("agent-one-as") monotonic, align 4
  %283 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 46
  %284 = load i32, i32 addrspace(5)* %59, align 8, !tbaa !7
  %285 = atomicrmw add i32 addrspace(1)* %283, i32 %284 syncscope("agent-one-as") monotonic, align 4
  %286 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 47
  %287 = load i32, i32 addrspace(5)* %60, align 4, !tbaa !7
  %288 = atomicrmw add i32 addrspace(1)* %286, i32 %287 syncscope("agent-one-as") monotonic, align 4
  %289 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 48
  %290 = load i32, i32 addrspace(5)* %61, align 16, !tbaa !7
  %291 = atomicrmw add i32 addrspace(1)* %289, i32 %290 syncscope("agent-one-as") monotonic, align 4
  %292 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 49
  %293 = load i32, i32 addrspace(5)* %62, align 4, !tbaa !7
  %294 = atomicrmw add i32 addrspace(1)* %292, i32 %293 syncscope("agent-one-as") monotonic, align 4
  %295 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 50
  %296 = load i32, i32 addrspace(5)* %63, align 8, !tbaa !7
  %297 = atomicrmw add i32 addrspace(1)* %295, i32 %296 syncscope("agent-one-as") monotonic, align 4
  %298 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 51
  %299 = load i32, i32 addrspace(5)* %64, align 4, !tbaa !7
  %300 = atomicrmw add i32 addrspace(1)* %298, i32 %299 syncscope("agent-one-as") monotonic, align 4
  %301 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 52
  %302 = load i32, i32 addrspace(5)* %65, align 16, !tbaa !7
  %303 = atomicrmw add i32 addrspace(1)* %301, i32 %302 syncscope("agent-one-as") monotonic, align 4
  %304 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 53
  %305 = load i32, i32 addrspace(5)* %66, align 4, !tbaa !7
  %306 = atomicrmw add i32 addrspace(1)* %304, i32 %305 syncscope("agent-one-as") monotonic, align 4
  %307 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 54
  %308 = load i32, i32 addrspace(5)* %67, align 8, !tbaa !7
  %309 = atomicrmw add i32 addrspace(1)* %307, i32 %308 syncscope("agent-one-as") monotonic, align 4
  %310 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 55
  %311 = load i32, i32 addrspace(5)* %68, align 4, !tbaa !7
  %312 = atomicrmw add i32 addrspace(1)* %310, i32 %311 syncscope("agent-one-as") monotonic, align 4
  %313 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 56
  %314 = load i32, i32 addrspace(5)* %69, align 16, !tbaa !7
  %315 = atomicrmw add i32 addrspace(1)* %313, i32 %314 syncscope("agent-one-as") monotonic, align 4
  %316 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 57
  %317 = load i32, i32 addrspace(5)* %70, align 4, !tbaa !7
  %318 = atomicrmw add i32 addrspace(1)* %316, i32 %317 syncscope("agent-one-as") monotonic, align 4
  %319 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 58
  %320 = load i32, i32 addrspace(5)* %71, align 8, !tbaa !7
  %321 = atomicrmw add i32 addrspace(1)* %319, i32 %320 syncscope("agent-one-as") monotonic, align 4
  %322 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 59
  %323 = load i32, i32 addrspace(5)* %72, align 4, !tbaa !7
  %324 = atomicrmw add i32 addrspace(1)* %322, i32 %323 syncscope("agent-one-as") monotonic, align 4
  %325 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 60
  %326 = load i32, i32 addrspace(5)* %73, align 16, !tbaa !7
  %327 = atomicrmw add i32 addrspace(1)* %325, i32 %326 syncscope("agent-one-as") monotonic, align 4
  %328 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 61
  %329 = load i32, i32 addrspace(5)* %74, align 4, !tbaa !7
  %330 = atomicrmw add i32 addrspace(1)* %328, i32 %329 syncscope("agent-one-as") monotonic, align 4
  %331 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 62
  %332 = load i32, i32 addrspace(5)* %75, align 8, !tbaa !7
  %333 = atomicrmw add i32 addrspace(1)* %331, i32 %332 syncscope("agent-one-as") monotonic, align 4
  %334 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 63
  %335 = load i32, i32 addrspace(5)* %76, align 4, !tbaa !7
  %336 = atomicrmw add i32 addrspace(1)* %334, i32 %335 syncscope("agent-one-as") monotonic, align 4
  %337 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 64
  %338 = load i32, i32 addrspace(5)* %77, align 16, !tbaa !7
  %339 = atomicrmw add i32 addrspace(1)* %337, i32 %338 syncscope("agent-one-as") monotonic, align 4
  %340 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 65
  %341 = load i32, i32 addrspace(5)* %78, align 4, !tbaa !7
  %342 = atomicrmw add i32 addrspace(1)* %340, i32 %341 syncscope("agent-one-as") monotonic, align 4
  %343 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 66
  %344 = load i32, i32 addrspace(5)* %79, align 8, !tbaa !7
  %345 = atomicrmw add i32 addrspace(1)* %343, i32 %344 syncscope("agent-one-as") monotonic, align 4
  %346 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 67
  %347 = load i32, i32 addrspace(5)* %80, align 4, !tbaa !7
  %348 = atomicrmw add i32 addrspace(1)* %346, i32 %347 syncscope("agent-one-as") monotonic, align 4
  %349 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 68
  %350 = load i32, i32 addrspace(5)* %81, align 16, !tbaa !7
  %351 = atomicrmw add i32 addrspace(1)* %349, i32 %350 syncscope("agent-one-as") monotonic, align 4
  %352 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 69
  %353 = load i32, i32 addrspace(5)* %82, align 4, !tbaa !7
  %354 = atomicrmw add i32 addrspace(1)* %352, i32 %353 syncscope("agent-one-as") monotonic, align 4
  %355 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 70
  %356 = load i32, i32 addrspace(5)* %83, align 8, !tbaa !7
  %357 = atomicrmw add i32 addrspace(1)* %355, i32 %356 syncscope("agent-one-as") monotonic, align 4
  %358 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 71
  %359 = load i32, i32 addrspace(5)* %84, align 4, !tbaa !7
  %360 = atomicrmw add i32 addrspace(1)* %358, i32 %359 syncscope("agent-one-as") monotonic, align 4
  %361 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 72
  %362 = load i32, i32 addrspace(5)* %85, align 16, !tbaa !7
  %363 = atomicrmw add i32 addrspace(1)* %361, i32 %362 syncscope("agent-one-as") monotonic, align 4
  %364 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 73
  %365 = load i32, i32 addrspace(5)* %86, align 4, !tbaa !7
  %366 = atomicrmw add i32 addrspace(1)* %364, i32 %365 syncscope("agent-one-as") monotonic, align 4
  %367 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 74
  %368 = load i32, i32 addrspace(5)* %87, align 8, !tbaa !7
  %369 = atomicrmw add i32 addrspace(1)* %367, i32 %368 syncscope("agent-one-as") monotonic, align 4
  %370 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 75
  %371 = load i32, i32 addrspace(5)* %88, align 4, !tbaa !7
  %372 = atomicrmw add i32 addrspace(1)* %370, i32 %371 syncscope("agent-one-as") monotonic, align 4
  %373 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 76
  %374 = load i32, i32 addrspace(5)* %89, align 16, !tbaa !7
  %375 = atomicrmw add i32 addrspace(1)* %373, i32 %374 syncscope("agent-one-as") monotonic, align 4
  %376 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 77
  %377 = load i32, i32 addrspace(5)* %90, align 4, !tbaa !7
  %378 = atomicrmw add i32 addrspace(1)* %376, i32 %377 syncscope("agent-one-as") monotonic, align 4
  %379 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 78
  %380 = load i32, i32 addrspace(5)* %91, align 8, !tbaa !7
  %381 = atomicrmw add i32 addrspace(1)* %379, i32 %380 syncscope("agent-one-as") monotonic, align 4
  %382 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 79
  %383 = load i32, i32 addrspace(5)* %92, align 4, !tbaa !7
  %384 = atomicrmw add i32 addrspace(1)* %382, i32 %383 syncscope("agent-one-as") monotonic, align 4
  %385 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 80
  %386 = load i32, i32 addrspace(5)* %93, align 16, !tbaa !7
  %387 = atomicrmw add i32 addrspace(1)* %385, i32 %386 syncscope("agent-one-as") monotonic, align 4
  %388 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 81
  %389 = load i32, i32 addrspace(5)* %94, align 4, !tbaa !7
  %390 = atomicrmw add i32 addrspace(1)* %388, i32 %389 syncscope("agent-one-as") monotonic, align 4
  %391 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 82
  %392 = load i32, i32 addrspace(5)* %95, align 8, !tbaa !7
  %393 = atomicrmw add i32 addrspace(1)* %391, i32 %392 syncscope("agent-one-as") monotonic, align 4
  %394 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 83
  %395 = load i32, i32 addrspace(5)* %96, align 4, !tbaa !7
  %396 = atomicrmw add i32 addrspace(1)* %394, i32 %395 syncscope("agent-one-as") monotonic, align 4
  %397 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 84
  %398 = load i32, i32 addrspace(5)* %97, align 16, !tbaa !7
  %399 = atomicrmw add i32 addrspace(1)* %397, i32 %398 syncscope("agent-one-as") monotonic, align 4
  %400 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 85
  %401 = load i32, i32 addrspace(5)* %98, align 4, !tbaa !7
  %402 = atomicrmw add i32 addrspace(1)* %400, i32 %401 syncscope("agent-one-as") monotonic, align 4
  %403 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 86
  %404 = load i32, i32 addrspace(5)* %99, align 8, !tbaa !7
  %405 = atomicrmw add i32 addrspace(1)* %403, i32 %404 syncscope("agent-one-as") monotonic, align 4
  %406 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 87
  %407 = load i32, i32 addrspace(5)* %100, align 4, !tbaa !7
  %408 = atomicrmw add i32 addrspace(1)* %406, i32 %407 syncscope("agent-one-as") monotonic, align 4
  %409 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 88
  %410 = load i32, i32 addrspace(5)* %101, align 16, !tbaa !7
  %411 = atomicrmw add i32 addrspace(1)* %409, i32 %410 syncscope("agent-one-as") monotonic, align 4
  %412 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 89
  %413 = load i32, i32 addrspace(5)* %102, align 4, !tbaa !7
  %414 = atomicrmw add i32 addrspace(1)* %412, i32 %413 syncscope("agent-one-as") monotonic, align 4
  %415 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 90
  %416 = load i32, i32 addrspace(5)* %103, align 8, !tbaa !7
  %417 = atomicrmw add i32 addrspace(1)* %415, i32 %416 syncscope("agent-one-as") monotonic, align 4
  %418 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 91
  %419 = load i32, i32 addrspace(5)* %104, align 4, !tbaa !7
  %420 = atomicrmw add i32 addrspace(1)* %418, i32 %419 syncscope("agent-one-as") monotonic, align 4
  %421 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 92
  %422 = load i32, i32 addrspace(5)* %105, align 16, !tbaa !7
  %423 = atomicrmw add i32 addrspace(1)* %421, i32 %422 syncscope("agent-one-as") monotonic, align 4
  %424 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 93
  %425 = load i32, i32 addrspace(5)* %106, align 4, !tbaa !7
  %426 = atomicrmw add i32 addrspace(1)* %424, i32 %425 syncscope("agent-one-as") monotonic, align 4
  %427 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 94
  %428 = load i32, i32 addrspace(5)* %107, align 8, !tbaa !7
  %429 = atomicrmw add i32 addrspace(1)* %427, i32 %428 syncscope("agent-one-as") monotonic, align 4
  %430 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 95
  %431 = load i32, i32 addrspace(5)* %108, align 4, !tbaa !7
  %432 = atomicrmw add i32 addrspace(1)* %430, i32 %431 syncscope("agent-one-as") monotonic, align 4
  %433 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 96
  %434 = load i32, i32 addrspace(5)* %109, align 16, !tbaa !7
  %435 = atomicrmw add i32 addrspace(1)* %433, i32 %434 syncscope("agent-one-as") monotonic, align 4
  %436 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 97
  %437 = load i32, i32 addrspace(5)* %110, align 4, !tbaa !7
  %438 = atomicrmw add i32 addrspace(1)* %436, i32 %437 syncscope("agent-one-as") monotonic, align 4
  %439 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 98
  %440 = load i32, i32 addrspace(5)* %111, align 8, !tbaa !7
  %441 = atomicrmw add i32 addrspace(1)* %439, i32 %440 syncscope("agent-one-as") monotonic, align 4
  %442 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 99
  %443 = load i32, i32 addrspace(5)* %112, align 4, !tbaa !7
  %444 = atomicrmw add i32 addrspace(1)* %442, i32 %443 syncscope("agent-one-as") monotonic, align 4
  %445 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 100
  %446 = load i32, i32 addrspace(5)* %113, align 16, !tbaa !7
  %447 = atomicrmw add i32 addrspace(1)* %445, i32 %446 syncscope("agent-one-as") monotonic, align 4
  %448 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 101
  %449 = load i32, i32 addrspace(5)* %114, align 4, !tbaa !7
  %450 = atomicrmw add i32 addrspace(1)* %448, i32 %449 syncscope("agent-one-as") monotonic, align 4
  %451 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 102
  %452 = load i32, i32 addrspace(5)* %115, align 8, !tbaa !7
  %453 = atomicrmw add i32 addrspace(1)* %451, i32 %452 syncscope("agent-one-as") monotonic, align 4
  %454 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 103
  %455 = load i32, i32 addrspace(5)* %116, align 4, !tbaa !7
  %456 = atomicrmw add i32 addrspace(1)* %454, i32 %455 syncscope("agent-one-as") monotonic, align 4
  %457 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 104
  %458 = load i32, i32 addrspace(5)* %117, align 16, !tbaa !7
  %459 = atomicrmw add i32 addrspace(1)* %457, i32 %458 syncscope("agent-one-as") monotonic, align 4
  %460 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 105
  %461 = load i32, i32 addrspace(5)* %118, align 4, !tbaa !7
  %462 = atomicrmw add i32 addrspace(1)* %460, i32 %461 syncscope("agent-one-as") monotonic, align 4
  %463 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 106
  %464 = load i32, i32 addrspace(5)* %119, align 8, !tbaa !7
  %465 = atomicrmw add i32 addrspace(1)* %463, i32 %464 syncscope("agent-one-as") monotonic, align 4
  %466 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 107
  %467 = load i32, i32 addrspace(5)* %120, align 4, !tbaa !7
  %468 = atomicrmw add i32 addrspace(1)* %466, i32 %467 syncscope("agent-one-as") monotonic, align 4
  %469 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 108
  %470 = load i32, i32 addrspace(5)* %121, align 16, !tbaa !7
  %471 = atomicrmw add i32 addrspace(1)* %469, i32 %470 syncscope("agent-one-as") monotonic, align 4
  %472 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 109
  %473 = load i32, i32 addrspace(5)* %122, align 4, !tbaa !7
  %474 = atomicrmw add i32 addrspace(1)* %472, i32 %473 syncscope("agent-one-as") monotonic, align 4
  %475 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 110
  %476 = load i32, i32 addrspace(5)* %123, align 8, !tbaa !7
  %477 = atomicrmw add i32 addrspace(1)* %475, i32 %476 syncscope("agent-one-as") monotonic, align 4
  %478 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 111
  %479 = load i32, i32 addrspace(5)* %124, align 4, !tbaa !7
  %480 = atomicrmw add i32 addrspace(1)* %478, i32 %479 syncscope("agent-one-as") monotonic, align 4
  %481 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 112
  %482 = load i32, i32 addrspace(5)* %125, align 16, !tbaa !7
  %483 = atomicrmw add i32 addrspace(1)* %481, i32 %482 syncscope("agent-one-as") monotonic, align 4
  %484 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 113
  %485 = load i32, i32 addrspace(5)* %126, align 4, !tbaa !7
  %486 = atomicrmw add i32 addrspace(1)* %484, i32 %485 syncscope("agent-one-as") monotonic, align 4
  %487 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 114
  %488 = load i32, i32 addrspace(5)* %127, align 8, !tbaa !7
  %489 = atomicrmw add i32 addrspace(1)* %487, i32 %488 syncscope("agent-one-as") monotonic, align 4
  %490 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 115
  %491 = load i32, i32 addrspace(5)* %128, align 4, !tbaa !7
  %492 = atomicrmw add i32 addrspace(1)* %490, i32 %491 syncscope("agent-one-as") monotonic, align 4
  %493 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 116
  %494 = load i32, i32 addrspace(5)* %129, align 16, !tbaa !7
  %495 = atomicrmw add i32 addrspace(1)* %493, i32 %494 syncscope("agent-one-as") monotonic, align 4
  %496 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 117
  %497 = load i32, i32 addrspace(5)* %130, align 4, !tbaa !7
  %498 = atomicrmw add i32 addrspace(1)* %496, i32 %497 syncscope("agent-one-as") monotonic, align 4
  %499 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 118
  %500 = load i32, i32 addrspace(5)* %131, align 8, !tbaa !7
  %501 = atomicrmw add i32 addrspace(1)* %499, i32 %500 syncscope("agent-one-as") monotonic, align 4
  %502 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 119
  %503 = load i32, i32 addrspace(5)* %132, align 4, !tbaa !7
  %504 = atomicrmw add i32 addrspace(1)* %502, i32 %503 syncscope("agent-one-as") monotonic, align 4
  %505 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 120
  %506 = load i32, i32 addrspace(5)* %133, align 16, !tbaa !7
  %507 = atomicrmw add i32 addrspace(1)* %505, i32 %506 syncscope("agent-one-as") monotonic, align 4
  %508 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 121
  %509 = load i32, i32 addrspace(5)* %134, align 4, !tbaa !7
  %510 = atomicrmw add i32 addrspace(1)* %508, i32 %509 syncscope("agent-one-as") monotonic, align 4
  %511 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 122
  %512 = load i32, i32 addrspace(5)* %135, align 8, !tbaa !7
  %513 = atomicrmw add i32 addrspace(1)* %511, i32 %512 syncscope("agent-one-as") monotonic, align 4
  %514 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 123
  %515 = load i32, i32 addrspace(5)* %136, align 4, !tbaa !7
  %516 = atomicrmw add i32 addrspace(1)* %514, i32 %515 syncscope("agent-one-as") monotonic, align 4
  %517 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 124
  %518 = load i32, i32 addrspace(5)* %137, align 16, !tbaa !7
  %519 = atomicrmw add i32 addrspace(1)* %517, i32 %518 syncscope("agent-one-as") monotonic, align 4
  %520 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 125
  %521 = load i32, i32 addrspace(5)* %138, align 4, !tbaa !7
  %522 = atomicrmw add i32 addrspace(1)* %520, i32 %521 syncscope("agent-one-as") monotonic, align 4
  %523 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 126
  %524 = load i32, i32 addrspace(5)* %139, align 8, !tbaa !7
  %525 = atomicrmw add i32 addrspace(1)* %523, i32 %524 syncscope("agent-one-as") monotonic, align 4
  %526 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 127
  %527 = load i32, i32 addrspace(5)* %140, align 4, !tbaa !7
  %528 = atomicrmw add i32 addrspace(1)* %526, i32 %527 syncscope("agent-one-as") monotonic, align 4
  call void @llvm.lifetime.end.p5i8(i64 512, i8 addrspace(5)* %6) #3
  ret void

529:                                              ; preds = %4, %529
  %530 = phi i32 [ %538, %529 ], [ %143, %4 ]
  %531 = sext i32 %530 to i64
  %532 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %531
  %533 = load i8, i8 addrspace(1)* %532, align 1, !tbaa !11, !amdgpu.noclobber !5
  %534 = sext i8 %533 to i32
  %535 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(5)* %5, i32 0, i32 %534
  %536 = load i32, i32 addrspace(5)* %535, align 4, !tbaa !7
  %537 = add nsw i32 %536, 1
  store i32 %537, i32 addrspace(5)* %535, align 4, !tbaa !7
  %538 = add nsw i32 %530, %3
  %539 = icmp slt i32 %538, %1
  br i1 %539, label %529, label %145, !llvm.loop !12
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!9, !9, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
