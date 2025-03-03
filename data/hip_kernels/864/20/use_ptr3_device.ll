; ModuleID = '../data/hip_kernels/864/20/main.cu'
source_filename = "../data/hip_kernels/864/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@const_ptr = protected addrspace(4) externally_initialized global i32* null, align 8
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (i32* addrspace(4)* @const_ptr to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z8use_ptr3v() local_unnamed_addr #0 {
  %1 = load i32*, i32* addrspace(4)* @const_ptr, align 8, !tbaa !4
  store i32 0, i32* %1, align 4, !tbaa !8
  %2 = getelementptr inbounds i32, i32* %1, i64 1
  store i32 1, i32* %2, align 4, !tbaa !8
  %3 = getelementptr inbounds i32, i32* %1, i64 2
  store i32 2, i32* %3, align 4, !tbaa !8
  %4 = getelementptr inbounds i32, i32* %1, i64 3
  store i32 3, i32* %4, align 4, !tbaa !8
  %5 = getelementptr inbounds i32, i32* %1, i64 4
  store i32 4, i32* %5, align 4, !tbaa !8
  %6 = getelementptr inbounds i32, i32* %1, i64 5
  store i32 5, i32* %6, align 4, !tbaa !8
  %7 = getelementptr inbounds i32, i32* %1, i64 6
  store i32 6, i32* %7, align 4, !tbaa !8
  %8 = getelementptr inbounds i32, i32* %1, i64 7
  store i32 7, i32* %8, align 4, !tbaa !8
  %9 = getelementptr inbounds i32, i32* %1, i64 8
  store i32 8, i32* %9, align 4, !tbaa !8
  %10 = getelementptr inbounds i32, i32* %1, i64 9
  store i32 9, i32* %10, align 4, !tbaa !8
  %11 = getelementptr inbounds i32, i32* %1, i64 10
  store i32 10, i32* %11, align 4, !tbaa !8
  %12 = getelementptr inbounds i32, i32* %1, i64 11
  store i32 11, i32* %12, align 4, !tbaa !8
  %13 = getelementptr inbounds i32, i32* %1, i64 12
  store i32 12, i32* %13, align 4, !tbaa !8
  %14 = getelementptr inbounds i32, i32* %1, i64 13
  store i32 13, i32* %14, align 4, !tbaa !8
  %15 = getelementptr inbounds i32, i32* %1, i64 14
  store i32 14, i32* %15, align 4, !tbaa !8
  %16 = getelementptr inbounds i32, i32* %1, i64 15
  store i32 15, i32* %16, align 4, !tbaa !8
  %17 = getelementptr inbounds i32, i32* %1, i64 16
  store i32 16, i32* %17, align 4, !tbaa !8
  %18 = getelementptr inbounds i32, i32* %1, i64 17
  store i32 17, i32* %18, align 4, !tbaa !8
  %19 = getelementptr inbounds i32, i32* %1, i64 18
  store i32 18, i32* %19, align 4, !tbaa !8
  %20 = getelementptr inbounds i32, i32* %1, i64 19
  store i32 19, i32* %20, align 4, !tbaa !8
  %21 = getelementptr inbounds i32, i32* %1, i64 20
  store i32 20, i32* %21, align 4, !tbaa !8
  %22 = getelementptr inbounds i32, i32* %1, i64 21
  store i32 21, i32* %22, align 4, !tbaa !8
  %23 = getelementptr inbounds i32, i32* %1, i64 22
  store i32 22, i32* %23, align 4, !tbaa !8
  %24 = getelementptr inbounds i32, i32* %1, i64 23
  store i32 23, i32* %24, align 4, !tbaa !8
  %25 = getelementptr inbounds i32, i32* %1, i64 24
  store i32 24, i32* %25, align 4, !tbaa !8
  %26 = getelementptr inbounds i32, i32* %1, i64 25
  store i32 25, i32* %26, align 4, !tbaa !8
  %27 = getelementptr inbounds i32, i32* %1, i64 26
  store i32 26, i32* %27, align 4, !tbaa !8
  %28 = getelementptr inbounds i32, i32* %1, i64 27
  store i32 27, i32* %28, align 4, !tbaa !8
  %29 = getelementptr inbounds i32, i32* %1, i64 28
  store i32 28, i32* %29, align 4, !tbaa !8
  %30 = getelementptr inbounds i32, i32* %1, i64 29
  store i32 29, i32* %30, align 4, !tbaa !8
  %31 = getelementptr inbounds i32, i32* %1, i64 30
  store i32 30, i32* %31, align 4, !tbaa !8
  %32 = getelementptr inbounds i32, i32* %1, i64 31
  store i32 31, i32* %32, align 4, !tbaa !8
  %33 = getelementptr inbounds i32, i32* %1, i64 32
  store i32 32, i32* %33, align 4, !tbaa !8
  %34 = getelementptr inbounds i32, i32* %1, i64 33
  store i32 33, i32* %34, align 4, !tbaa !8
  %35 = getelementptr inbounds i32, i32* %1, i64 34
  store i32 34, i32* %35, align 4, !tbaa !8
  %36 = getelementptr inbounds i32, i32* %1, i64 35
  store i32 35, i32* %36, align 4, !tbaa !8
  %37 = getelementptr inbounds i32, i32* %1, i64 36
  store i32 36, i32* %37, align 4, !tbaa !8
  %38 = getelementptr inbounds i32, i32* %1, i64 37
  store i32 37, i32* %38, align 4, !tbaa !8
  %39 = getelementptr inbounds i32, i32* %1, i64 38
  store i32 38, i32* %39, align 4, !tbaa !8
  %40 = getelementptr inbounds i32, i32* %1, i64 39
  store i32 39, i32* %40, align 4, !tbaa !8
  %41 = getelementptr inbounds i32, i32* %1, i64 40
  store i32 40, i32* %41, align 4, !tbaa !8
  %42 = getelementptr inbounds i32, i32* %1, i64 41
  store i32 41, i32* %42, align 4, !tbaa !8
  %43 = getelementptr inbounds i32, i32* %1, i64 42
  store i32 42, i32* %43, align 4, !tbaa !8
  %44 = getelementptr inbounds i32, i32* %1, i64 43
  store i32 43, i32* %44, align 4, !tbaa !8
  %45 = getelementptr inbounds i32, i32* %1, i64 44
  store i32 44, i32* %45, align 4, !tbaa !8
  %46 = getelementptr inbounds i32, i32* %1, i64 45
  store i32 45, i32* %46, align 4, !tbaa !8
  %47 = getelementptr inbounds i32, i32* %1, i64 46
  store i32 46, i32* %47, align 4, !tbaa !8
  %48 = getelementptr inbounds i32, i32* %1, i64 47
  store i32 47, i32* %48, align 4, !tbaa !8
  %49 = getelementptr inbounds i32, i32* %1, i64 48
  store i32 48, i32* %49, align 4, !tbaa !8
  %50 = getelementptr inbounds i32, i32* %1, i64 49
  store i32 49, i32* %50, align 4, !tbaa !8
  %51 = getelementptr inbounds i32, i32* %1, i64 50
  store i32 50, i32* %51, align 4, !tbaa !8
  %52 = getelementptr inbounds i32, i32* %1, i64 51
  store i32 51, i32* %52, align 4, !tbaa !8
  %53 = getelementptr inbounds i32, i32* %1, i64 52
  store i32 52, i32* %53, align 4, !tbaa !8
  %54 = getelementptr inbounds i32, i32* %1, i64 53
  store i32 53, i32* %54, align 4, !tbaa !8
  %55 = getelementptr inbounds i32, i32* %1, i64 54
  store i32 54, i32* %55, align 4, !tbaa !8
  %56 = getelementptr inbounds i32, i32* %1, i64 55
  store i32 55, i32* %56, align 4, !tbaa !8
  %57 = getelementptr inbounds i32, i32* %1, i64 56
  store i32 56, i32* %57, align 4, !tbaa !8
  %58 = getelementptr inbounds i32, i32* %1, i64 57
  store i32 57, i32* %58, align 4, !tbaa !8
  %59 = getelementptr inbounds i32, i32* %1, i64 58
  store i32 58, i32* %59, align 4, !tbaa !8
  %60 = getelementptr inbounds i32, i32* %1, i64 59
  store i32 59, i32* %60, align 4, !tbaa !8
  %61 = getelementptr inbounds i32, i32* %1, i64 60
  store i32 60, i32* %61, align 4, !tbaa !8
  %62 = getelementptr inbounds i32, i32* %1, i64 61
  store i32 61, i32* %62, align 4, !tbaa !8
  %63 = getelementptr inbounds i32, i32* %1, i64 62
  store i32 62, i32* %63, align 4, !tbaa !8
  %64 = getelementptr inbounds i32, i32* %1, i64 63
  store i32 63, i32* %64, align 4, !tbaa !8
  %65 = getelementptr inbounds i32, i32* %1, i64 64
  store i32 64, i32* %65, align 4, !tbaa !8
  %66 = getelementptr inbounds i32, i32* %1, i64 65
  store i32 65, i32* %66, align 4, !tbaa !8
  %67 = getelementptr inbounds i32, i32* %1, i64 66
  store i32 66, i32* %67, align 4, !tbaa !8
  %68 = getelementptr inbounds i32, i32* %1, i64 67
  store i32 67, i32* %68, align 4, !tbaa !8
  %69 = getelementptr inbounds i32, i32* %1, i64 68
  store i32 68, i32* %69, align 4, !tbaa !8
  %70 = getelementptr inbounds i32, i32* %1, i64 69
  store i32 69, i32* %70, align 4, !tbaa !8
  %71 = getelementptr inbounds i32, i32* %1, i64 70
  store i32 70, i32* %71, align 4, !tbaa !8
  %72 = getelementptr inbounds i32, i32* %1, i64 71
  store i32 71, i32* %72, align 4, !tbaa !8
  %73 = getelementptr inbounds i32, i32* %1, i64 72
  store i32 72, i32* %73, align 4, !tbaa !8
  %74 = getelementptr inbounds i32, i32* %1, i64 73
  store i32 73, i32* %74, align 4, !tbaa !8
  %75 = getelementptr inbounds i32, i32* %1, i64 74
  store i32 74, i32* %75, align 4, !tbaa !8
  %76 = getelementptr inbounds i32, i32* %1, i64 75
  store i32 75, i32* %76, align 4, !tbaa !8
  %77 = getelementptr inbounds i32, i32* %1, i64 76
  store i32 76, i32* %77, align 4, !tbaa !8
  %78 = getelementptr inbounds i32, i32* %1, i64 77
  store i32 77, i32* %78, align 4, !tbaa !8
  %79 = getelementptr inbounds i32, i32* %1, i64 78
  store i32 78, i32* %79, align 4, !tbaa !8
  %80 = getelementptr inbounds i32, i32* %1, i64 79
  store i32 79, i32* %80, align 4, !tbaa !8
  %81 = getelementptr inbounds i32, i32* %1, i64 80
  store i32 80, i32* %81, align 4, !tbaa !8
  %82 = getelementptr inbounds i32, i32* %1, i64 81
  store i32 81, i32* %82, align 4, !tbaa !8
  %83 = getelementptr inbounds i32, i32* %1, i64 82
  store i32 82, i32* %83, align 4, !tbaa !8
  %84 = getelementptr inbounds i32, i32* %1, i64 83
  store i32 83, i32* %84, align 4, !tbaa !8
  %85 = getelementptr inbounds i32, i32* %1, i64 84
  store i32 84, i32* %85, align 4, !tbaa !8
  %86 = getelementptr inbounds i32, i32* %1, i64 85
  store i32 85, i32* %86, align 4, !tbaa !8
  %87 = getelementptr inbounds i32, i32* %1, i64 86
  store i32 86, i32* %87, align 4, !tbaa !8
  %88 = getelementptr inbounds i32, i32* %1, i64 87
  store i32 87, i32* %88, align 4, !tbaa !8
  %89 = getelementptr inbounds i32, i32* %1, i64 88
  store i32 88, i32* %89, align 4, !tbaa !8
  %90 = getelementptr inbounds i32, i32* %1, i64 89
  store i32 89, i32* %90, align 4, !tbaa !8
  %91 = getelementptr inbounds i32, i32* %1, i64 90
  store i32 90, i32* %91, align 4, !tbaa !8
  %92 = getelementptr inbounds i32, i32* %1, i64 91
  store i32 91, i32* %92, align 4, !tbaa !8
  %93 = getelementptr inbounds i32, i32* %1, i64 92
  store i32 92, i32* %93, align 4, !tbaa !8
  %94 = getelementptr inbounds i32, i32* %1, i64 93
  store i32 93, i32* %94, align 4, !tbaa !8
  %95 = getelementptr inbounds i32, i32* %1, i64 94
  store i32 94, i32* %95, align 4, !tbaa !8
  %96 = getelementptr inbounds i32, i32* %1, i64 95
  store i32 95, i32* %96, align 4, !tbaa !8
  %97 = getelementptr inbounds i32, i32* %1, i64 96
  store i32 96, i32* %97, align 4, !tbaa !8
  %98 = getelementptr inbounds i32, i32* %1, i64 97
  store i32 97, i32* %98, align 4, !tbaa !8
  %99 = getelementptr inbounds i32, i32* %1, i64 98
  store i32 98, i32* %99, align 4, !tbaa !8
  %100 = getelementptr inbounds i32, i32* %1, i64 99
  store i32 99, i32* %100, align 4, !tbaa !8
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !6, i64 0}
